package cn.fds.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.fds.pojo.Order;
import cn.fds.pojo.OrderInfo;
import cn.fds.pojo.OrderItem;
import cn.fds.pojo.Product;
import cn.fds.pojo.User;
import cn.fds.service.OrderItemService;
import cn.fds.service.OrderService;

@Controller
public class AddOrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@SuppressWarnings({ "unused", "unchecked" })
	@RequestMapping("order/saveOrder")
	public String addOrder(HttpSession session,HttpServletResponse response,
			String userId,String receiveInfo,Model model){
		userId="1";
		if(userId==null){
			session.setAttribute("errorInfo", "请先登录");
			return "home/login";
		}
		Object cartobj = session.getAttribute("cartSession");
		Map<Product,Integer> map = (Map<Product,Integer>)cartobj;
		Order order = new Order();
		 order.setOrderId(UUID.randomUUID().toString());
		order.setOrderTime(new Date());
		order.setReceiveInfo(receiveInfo);
		order.setPayState(0);
		order.setUserId(userId);
		double money = 0;
		
		List<OrderItem> orderitem = new ArrayList<OrderItem>();
		OrderItem oi = new OrderItem();
		for (Map.Entry<Product, Integer> entry:map.entrySet()) {
			oi.setBuyNum(entry.getValue());
			oi.setOrderId(order.getOrderId());
			oi.setProductId(entry.getKey().getProductId());
			orderitem.add(oi);
			money = money+entry.getKey().getProductPrice()*entry.getValue();
		}
		order.setOrderMoney(money);
		try{
		orderService.saveOrder(order);
		orderItemService.saveOrderItem(oi);
		session.removeAttribute("cart");
		response.getWriter().write("添加成功");
		return "redirect:/toOrderList.action";
		}catch(Exception e){
			session.setAttribute("msg", "添加失败");
			return "home/cart";
		}
		
		
	}
	
	/**
	 * ======向orderAdd页面跳转======
	 */
	@RequestMapping("/order/toOrderAdd")
	public String toOrderAdd(HttpSession httpSession) {
		Object cartObj = httpSession.getAttribute("cartSession");
		if(cartObj==null){
			return "redirect:/home.action";
		}
		return "/home/orderAdd";
	}
	
	/**
	 *======向orderList页面跳转======
	 *======传送orderInfoList====== 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/order/toOrderList")
	public String toOrderList(Model model,HttpSession httpSession,String receiveInfo,String money){
		
		/*====判断userSession是否为空,如果为空直接返回到首页,用于规避特殊情况====*/
		Object orderInfoObj = httpSession.getAttribute("orderInfoSession");
		Object cartObj = httpSession.getAttribute("cartSession");
		Object userObj = httpSession.getAttribute("userSession");
		if(userObj==null) {
			return "redirect:/home.action";
		} else {
			if(cartObj==null) {
				if(orderInfoObj==null){
					return "redirect:/home.action";
				}
				return "/home/orderList";
			}
		}
		
		/*=====创建orderInfo对象添加到orderListSession这个List集合中=====
		 *=========并创建orderItem对象向数据库插入orderItem的数据========= 
		 *=================同时给下一个页面提供展现用的数据================*/
		
		OrderInfo orderInfo = new OrderInfo();
		Map<Product,Integer> cart = (Map<Product,Integer>)cartObj;
		User user = (User)userObj;
		Order order = new Order();
		order.setOrderId(UUID.randomUUID().toString());
		order.setPayState(0);
		order.setOrderMoney(Double.valueOf(money));
		order.setReceiveInfo(receiveInfo);
		order.setUserId(user.getUserId());
		order.setOrderTime(new Date());
		orderInfo.setOrder(order);
		orderInfo.setMap(cart);
		
		/*=======将数据插入到orderInfoSession=======*/
		List<OrderInfo> orderInfoSession = (List<OrderInfo>)orderInfoObj;
		if(orderInfoSession==null){
			orderInfoSession = orderItemService.getOrderInfoByUserId(user.getUserId());
			if(orderInfoSession==null){
				orderInfoSession = new ArrayList<OrderInfo>();
			}
		}
		orderInfoSession.add(orderInfo);
		httpSession.setAttribute("orderInfoSession", orderInfoSession);
		
		/*======插入到数据库======*/
		try{
			orderService.saveOrder(order);
			orderItemService.saveOrderItem(cart,order);
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/home.action";
		}
		
		/*=======将购物车中的商品删除=======*/
		httpSession.removeAttribute("cartSession");
		return "/home/orderList";
	}
	
	
	/**
	 * =========向orderList页面跳转=========
	 */
	@RequestMapping("/head/toOrderList")
	public String toOrderList(HttpSession httpSession,Model model) {
		Object userObj = httpSession.getAttribute("userSession");
		if(userObj==null) {
			model.addAttribute("errorInfo","查看订单前请先登录");
			return "/home/login";
		}
		User user = (User)httpSession.getAttribute("userSession");
		List<OrderInfo> orderInfoSession = orderItemService.getOrderInfoByUserId(user.getUserId());
		if(orderInfoSession==null){
			orderInfoSession = new ArrayList<OrderInfo>();
		}
		httpSession.setAttribute("orderInfoSession", orderInfoSession);
		return "/home/orderList";
	}
	
	@RequestMapping("/order/deleteOrder")
	public String deleteOrder(String orderId,HttpSession httpSession,Model model) {
		Object userObj = httpSession.getAttribute("userSession");
		if(userObj == null) {
			model.addAttribute("errorInfo","查询订单前请先登录");
			return "/home/login";
		}
		User user = (User)userObj;
		orderService.deleteOrderInfo(orderId);
		List<OrderInfo> orderInfoSession = orderItemService.getOrderInfoByUserId(user.getUserId());
		httpSession.setAttribute("orderInfoSession", orderInfoSession);
		return "/home/orderList";
	}
}
