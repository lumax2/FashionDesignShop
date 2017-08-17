package cn.fds.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.fds.pojo.Order;
import cn.fds.pojo.OrderInfo;
import cn.fds.pojo.OrderItem;
import cn.fds.pojo.Product;
import cn.fds.pojo.User;
import cn.fds.service.OrderItemService;
import cn.fds.service.OrderService;
import cn.fds.service.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderitemService;
	@Autowired
	private ProductService productService;
		//前端页面订单查询根据userId 
		@RequestMapping("/toOrderList")
		public String toBeforeOrderList(Model model,HttpSession session){
			//从session中获取用户信息
			
			Object userobj = session.getAttribute("user");
			
			String userId = ((User)userobj).getUserId(); 
			//订单详情
			List<OrderInfo> orderinfolist = new ArrayList<OrderInfo>();
			//订单信息
			List<Order>orderlist = orderService.findOrderByUserId(userId);
			//订单条目
			List<OrderItem> orderItemlist = orderitemService.findOrderItemByUserId(userId);
			
			Map<Product,Integer>map = new HashMap<Product,Integer>();
			for (Order order : orderlist) {
				OrderInfo orderinfo  = new OrderInfo();
				orderinfo.setOrder(order);
				//遍历商品条目
			for (OrderItem orderItem : orderItemlist) {
				if(order.getOrderId()==orderItem.getOrderId()){
				  Product product = 
					productService.findProductByProductId(orderItem.getProductId());
					map.put(product,orderItem.getBuyNum() );	
					}
				}
				orderinfo.setMap(map);
				
				orderinfolist.add(orderinfo);
			}
			model.addAttribute("orderinfolist", orderinfolist);
			
			//System.out.println(orderlist.toString());
			return "orderlist/orderlist";
		}
		//订单列表
		@RequestMapping("toorderlist")
		public String toOrderList(Model model){
			List<Order> orderList = orderService.findAll();
			model.addAttribute("orderList", orderList);
			return "back/sysadmin1/order/jOrderList";
		}
		
		//订单添加
		@RequestMapping("tocreateorder")
		public String toOrderCreate(){
		
			
			return "back/sysadmin1/order/jOrderCreate";
		}
		
		//订单修改
		@RequestMapping("toupdateorder")
		public String toOrderUpdate(String orderId,Model model){
			Order order=orderService.findOrderByOrderId(orderId);
			//System.out.println(order);
			model.addAttribute("order",order);
			return "back/sysadmin1/order/jOrderUpdate";
		}
		
		@RequestMapping("updateOrder")
		public String updateOrder(Order order){
			orderService.updateOrder(order);
			return "redirect:/toorderlist";
		}
		//订单查询
		@RequestMapping("toqueryorder")
		public String toOrderQuery(String orderId,Model model){
			Order order=orderService.findOrderByOrderId(orderId);
			//System.out.println(order);
			model.addAttribute("order",order);
			return "back/sysadmin1/order/jOrderQuery";
		}
		//跳转到订单删除页面
		@RequestMapping("todeleteorder")
		public String toDeleteOrder(Model model){
			List<Order> orderList = orderService.findAll();
			model.addAttribute("orderList", orderList);
			return "back/sysadmin1/order/jOrderDelete";
		}
		
		//订单删除
		@RequestMapping("deleteorder")
		public String deleteOrders(@RequestParam(value="orderId")String[] orderIds){
			orderService.deleteOrders(orderIds);
			return "redirect:/todeleteorder";
		}
		
		@RequestMapping("/newOrder")
		public String newOrder(Order order){
			orderService.newOrder(order);
			return "redirect:/toorderlist";
		}
		
}
