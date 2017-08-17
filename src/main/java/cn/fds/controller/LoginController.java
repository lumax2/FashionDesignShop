package cn.fds.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.fds.pojo.OrderInfo;
import cn.fds.pojo.Role;
import cn.fds.pojo.User;
import cn.fds.service.OrderItemService;
import cn.fds.service.UserService;
@Controller
public class LoginController extends BaseController{
	@Resource
	private UserService userService;
	
	@Resource
	private OrderItemService orderItemService;
	
	@RequestMapping("toLogin")
	public String toLogin() {
		return "home/login";
	}
	
	/**
	 * 验证登录页面传来的"用户名"和"密码"
	 * =====若内容为空,返回登录页面,并提示为空=======
	 * ==若数据库没有相应信息,返回登录页面,并提示错误===
	 * ==========若信息匹配,返回主页==============
	 */
	@RequestMapping("login")
	public String login(String username, String password,Model model,HttpSession httpSession) {
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			model.addAttribute("errorInfo","用户名或密码为空");
			return "/home/login";
		}
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);
		try{
			subject.login(token);
			User user = (User)subject.getPrincipal();
			List<Role> role = userService.getRoleByUsername(username);
			httpSession.setAttribute("userSession", user);
			httpSession.setAttribute("roleSession", role);
			return "redirect:/home.action";
		} catch(AuthenticationException e) {
			e.printStackTrace();
			model.addAttribute("errorInfo","用户名或密码错误");
			return "/home/login";
		}
	}
	
	/**
	 * ==============退出登录================
	 * ===========删除userSession===========
	 */
	@RequestMapping("logout")
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("userSession");
		httpSession.removeAttribute("cartSession");
		httpSession.removeAttribute("orderInfoSession");
		return "/home/index";
	}
	
	
}
