package cn.fds.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.fds.pojo.Order;
import cn.fds.service.OrderService;
import cn.fds.utils.PaymentUtil;

@Controller
public class PayController {
	
	@RequestMapping("/topay")
	public String toconfirm(String orderId,Model model){
		
Order order = orderService.findOrderByOrderId(orderId);
		
		double money = order.getOrderMoney();
		
		model.addAttribute("order", order);
		model.addAttribute("money", money);
		
		return "/confirm/pay";
	}

	@Autowired
	private OrderService orderService;
	public static Properties prop;
	
	static{
		prop = new Properties();
		String path = 	PayController.class.getClassLoader().getResource
				("merchantInfo.properties").getPath();
		
		try {
			prop.load(new FileInputStream(path));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/pay")
	public String topay(String orderId/*,Model model,HttpServletRequest request,double money, String paystate*/){
		
		/*Order order = orderService.findOrderByOrderId(orderId);
		
		//double money = order.getOrderMoney();
		
		
		
		model.addAttribute("order", order);
		
		String p0_Cmd = "Buy" ;
		String p1_MerId = "10001126856";
		String p2_Order = orderId;
		//测试时使用,部署后
		String p3_Amt = money+"";//money+"";
		String p4_Cur = "CNY";
		String p5_Pid = "";
		String p6_Pcat="";
		String p7_Pdesc = "";
		String p8_Url = prop.getProperty("responseURL");//重定向地址
		String p9_SAF ="0";
		String pd_FrpId = request.getParameter("pd_FrpId");
		String pa_MP = "";
		String pr_NeedResponse = "1";
		String hmac =PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat,
			p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, prop.getProperty("keyValue"));
		//保存到request作用域中
		request.setAttribute("hmac", hmac);
		request.setAttribute("p0_Cmd", p0_Cmd);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("p2_Order", p2_Order);
		request.setAttribute("p3_Amt", p3_Amt);
		request.setAttribute("p4_Cur", p4_Cur);
		request.setAttribute("p5_Pid", p5_Pid);
		request.setAttribute("p6_Pcat", p6_Pcat);
		request.setAttribute("p7_Pdesc", p7_Pdesc);
		request.setAttribute("p8_Url", p8_Url);
		request.setAttribute("p9_SAF", p9_SAF);
		request.setAttribute("pa_MP", pa_MP);
		request.setAttribute("pd_FrpId", pd_FrpId);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);*/
		
		orderService.updateState(orderId);
		
		return "redirect:/head/toOrderList";
	}
	
	
	
	
}
