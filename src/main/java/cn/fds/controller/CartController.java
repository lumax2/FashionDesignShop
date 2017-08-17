package cn.fds.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.fds.pojo.Product;
import cn.fds.pojo.User;
import cn.fds.service.ProductService;
//import cn.fds.service.OrderService;

@Controller
@RequestMapping("cart")
public class CartController {

	//@Autowired
	//private OrderService orderService;
	//添加购物车
	@Autowired
	private ProductService productService;
	/**
	 *======跳转到[购物车]页面======
	 */
	@RequestMapping("/toCart")
	public String toCart(HttpSession httpSession,Model model) {
		Object userObj = httpSession.getAttribute("userSession");
		if(userObj==null) {
			model.addAttribute("errorInfo","查看购物车前请先登录");
			return "/home/login";
		}
		return "home/cart";
	}
	
	/**
	 * ===========购物车添加功能=============
	 * ==========跳转到[购物车]页面==========
	 * ====将购物车信息存放在[cartSession]中====
	 * @param product 商品信息
	 * @param buyNum 购买商品的数量
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("addCart")
	public String addCart(HttpSession httpSession,Model model,String productId,String buyNum){
		User user = (User)httpSession.getAttribute("userSession");
		if(user==null){
			model.addAttribute("errorInfo", "添加购物车请先登录");
			return "home/login";
		}
		if(buyNum==null) {
			buyNum = "1";
		}
		Product product = productService.findProductByProductId(productId);
		Integer bNum = Integer.valueOf(buyNum);
		Object cartObj = httpSession.getAttribute("cartSession");
		Map<Product,Integer> cart = null;
		if(cartObj==null){
			cart = new HashMap<Product,Integer>();
			cart.put(product, bNum);
		} else {
			cart = (Map<Product,Integer>)cartObj;
			if(cart.containsKey(product)) {
				cart.put(product, cart.get(product)+bNum);
			} else {
				cart.put(product, bNum);
			}
		}
		httpSession.setAttribute("cartSession", cart);
		return "home/cart";
	}
	
	/**
	 * ==========删除购物车信息==========
	 * ===从cartSession中删除相应键值对===
	 * @param productId 商品编号
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("deleteCart")
	public String deleteCart(HttpSession httpSession,String productId){
		Object obj = httpSession.getAttribute("cartSession");
		Map<Product,Integer> cart = null;
		if(obj == null) {
			return "home/cart";
		} else {
			Product product = new Product();
			product.setProductId(productId);
			cart = (Map<Product,Integer>)obj;
			cart.remove(product);
			httpSession.setAttribute("cartSession", cart);
			return "home/cart";
		}
	}
	
	/**
	 * ==========修改购物车信息==========
	 * ===在cartSession中修改相应键值对===
	 * @param productId 商品编号
	 * @param buyNum 购买数量
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("editCart")
	public String editCart(HttpSession httpSession,String productId,String buyNum){
		Object obj = httpSession.getAttribute("cartSession");
		Map<Product,Integer> cart = null;
		Integer bNum = Integer.valueOf(buyNum);
		if(obj == null) {
			return "home/cart";
		} else {
			cart = (Map<Product,Integer>)obj;
			Product product = new Product();
			product.setProductId(productId);
			cart.put(product, bNum);
			httpSession.setAttribute("cartSession", cart);
			return "home/cart";
		}
	}
}
