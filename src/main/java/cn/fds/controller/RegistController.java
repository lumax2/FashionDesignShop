package cn.fds.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fds.pojo.User;
import cn.fds.service.UserService;

@Controller
public class RegistController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/toRegist")
	public String regist(){
		return "home/newRegist";
	}
	@RequestMapping("/createuser")
	public String createUser(User user,HttpServletRequest request){
		if(user==null){
			request.setAttribute("msg", "信息不能为空!");
			return "home/newRegist";
		}else{
			boolean flag=true;
			if(user.getUsername()==null||"".equals(user.getUsername())){
				request.setAttribute("username_msg", "用户名不能为空!");
				flag=false;
			}
			
			User aeuser=userService.findUserByUsername(user.getUsername());
			
			if(aeuser!=null){
				request.setAttribute("username_msg", "用户名已经存在");
				flag=false;
			}
			if(user.getPassword()==null||"".equals(user.getPassword())){
				request.setAttribute("password_msg","密码不能为空!");
				flag=false;
			}
			if(user.getName()==null||"".equals(user.getName())){
				request.setAttribute("name_msg", "真实姓名不能为空!");
				flag=false;
			}
			if(user.getTelephone()==null||"".equals(user.getTelephone())){
				request.setAttribute("telephone_msg", "电话不能为空!");
				flag=false;
			}
			if(!user.getTelephone().matches("\\d{11}")){
				request.setAttribute("telephone_msg", "电话格式错误!");
				flag=false;
			}
			if(!flag){
				return "home/newRegist";
			}
		}
		userService.saveUser(user);
		return "home/login";
		
	}
	
	@RequestMapping(value="tocheckname")
	@ResponseBody
	public boolean checkUsername(String username){
		User aeuser=userService.findUserByUsername(username);
		if(aeuser!=null){
			return true;
		}
		return false;
	}
}
