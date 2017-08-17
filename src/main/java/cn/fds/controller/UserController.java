package cn.fds.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fasterxml.jackson.core.JsonProcessingException;


import cn.fds.pojo.Role;
import cn.fds.pojo.User;
import cn.fds.service.RoleService;
import cn.fds.service.UserService;
import cn.fds.utils.ExcelUtil;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping("/save")
	public String saveUser(User user){
		userService.saveUser(user);
		return "index";
	}
	//用户列表
	@RequestMapping("/touserlist")
	public String toUserList(Model model){
		List<User> userList = userService.findAll();
		model.addAttribute("userList", userList);
		return "back/sysadmin1/user/jUserList";
	}
	//增加用户
	@RequestMapping("/tocreateuser")
	public String toCreateUser(){
		return "back/sysadmin1/user/jUserCreate";
	}
	
	@RequestMapping("/saveUser")
	public String saveUsers(User user){
		userService.saveUser(user);
		return "redirect:/touserlist";
	}
	
	//去修改用户
	@RequestMapping("/toupdateuser")
	public String toUpdate(String userId,Model model){
		User user = userService.findUserByUserId(userId);
		model.addAttribute("user",user);
		return "back/sysadmin1/user/jUserUpdate";
	}
	
	@RequestMapping("/updateUser")
	public String update(User user){
		userService.updateUser(user);
		return "redirect:/touserlist";
	}
	
	//查询用户
	@RequestMapping("/toqueryuser")
	public String toView(String userId,Model model){
		User user=userService.findUserByUserId(userId);
		model.addAttribute("user",user);
		return "back/sysadmin1/user/jUserQuery";
	}
	
	
	@RequestMapping("/touserrole")
	public String role(String userId,Model model) throws JsonProcessingException{
		//根据userid查询所有的roleID
		List<String> uRoleIdList =roleService.findRoleListByUserId(userId);
		
		List<Role> roleList =roleService.findAll();
		
		model.addAttribute("userId",userId);
		model.addAttribute("roleList", roleList);
		model.addAttribute("uRoleIdList",uRoleIdList);
		
		return "back/sysadmin1/user/jUserRole";
	}
	
	
	@RequestMapping("/saveroles")
	public String saveRoles(String userId,@RequestParam(value="roleId")String[] roleIds){
		userService.saveRoles(userId,roleIds);
		return "redirect:/touserlist";
	}
	
	@RequestMapping("/todeleteuser")
	public String toDeleteUser(Model model){
		List<User> userList = userService.findAll();
		model.addAttribute("userList", userList);
		return "back/sysadmin1/user/jUserDelete";
	}
	
	
	@RequestMapping("/deleteuser")
	public String deleteUser(@RequestParam(value="userId",required=true)String[] userIds){
		userService.deleteUser(userIds);
		return "redirect:/todeleteuser";
	}
	
	
	@RequestMapping("/partExport")
    //@ResponseBody
    public String partExport(Model model) throws IOException{
		ExcelUtil<User> ex = new ExcelUtil<User>();
		String title="用户表";
		String[] headers = { "用户id","用户名","密码","真实姓名","联系电话"};
		List<User> userList = userService.findAll();
		OutputStream outXlsx = new FileOutputStream("E://user.xls");
		String pattern="yyyy-MM-dd";
		ex.exportExcel(title, headers, userList, outXlsx, pattern);
		//System.out.println("导出成功!");
		/*res.setContentType("text/html;charset=utf-8");
		res.getWriter().write("导出成功,user.xls存在本机E盘根目录下,成功后自动跳转回主页!");
		res.setHeader("refresh", "3;url=/index.jsp");*/
		model.addAttribute("title","userList.xls文件");
		return "/chenyue/error";
    }
}
