package cn.fds.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.fds.pojo.Product;
import cn.fds.pojo.ProductJson;
import cn.fds.service.ProductService;


@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	
	/*登陆官网首页,原本为了实现首页的foreach遍历商品功能
	 *每次要回到首页都需要通过核心分发器回到这里执行连接数据库查询的动作,
	 *现在引入productSession,将查询到的product集合放入session中,
	 *相当于引入了一个缓存,这样减少了数据库的访问量,
	 *若session为空则会触发为空后的重新查询*/
	//还需要后台在更新或增加玩数据后,执行有关productSession的相关操作
	
	@RequestMapping("home")
	public String test(Model model) {
	/*	Object productObj = httpSession.getAttribute("productSession");
		if(productObj==null){
			List<Product> productSession = productService.findAllProduct();
			httpSession.setAttribute("productSession", productSession);
		}*/
		List<Product> productList=productService.findAllProduct();
		model.addAttribute("productSession", productList);
		return "home/index";
	}
	
	@RequestMapping("order")
	public String test1() {
		
		return "orderlist/orderlist";
	}
	//转向欢迎页面
	@RequestMapping("/toback.action")
	public String home(Model model) throws JsonProcessingException{
		
		List<String> prodNameList=productService.findProductName();
		List<ProductJson> prodNV=productService.findProductNameValue();
		
		ObjectMapper objectMapper =new ObjectMapper();
		
		String prodNameJson=objectMapper.writeValueAsString(prodNameList);
		String prodNVJson =objectMapper.writeValueAsString(prodNV);
		
		model.addAttribute("prodNVJson",prodNVJson);
		model.addAttribute("prodNameJson", prodNameJson);
		
		return "back";
	}
	
	
	//转向tilte标题栏页面
	@RequestMapping("/title.action")
	public String title(){
		return "back/home/title";
	}
	
	//通用的left和main
	@RequestMapping("/{Module}/Left.action")
	public String homeLeft(@PathVariable String Module){
		return "back/"+Module+"/left";
	}	
	
	@RequestMapping("/{Module}/Main.action")
	public String homeMain(@PathVariable String Module){
		return "back/"+Module+"/main";
	}
	
	@RequestMapping("/toecharts.action")
	public String echart(Model model) throws JsonProcessingException{
		List<String> prodNameList=productService.findProductName();
		List<ProductJson> prodNV=productService.findProductNameValue();
		
		ObjectMapper objectMapper =new ObjectMapper();
		
		String prodNameJson=objectMapper.writeValueAsString(prodNameList);
		String prodNVJson =objectMapper.writeValueAsString(prodNV);
		
		System.out.println("prodNameJson:"+prodNameJson);
		System.out.println("prodNVJson:"+prodNVJson);
		
		model.addAttribute("prodNVJson",prodNVJson);
		model.addAttribute("prodNameJson", prodNameJson);
		return "/echart";
	}
}
