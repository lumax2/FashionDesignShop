package cn.fds.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.fds.pojo.Module;
import cn.fds.pojo.Role;
import cn.fds.service.ModuleService;
import cn.fds.service.RoleService;

@Controller
public class RoleController {
	
	@Autowired
	private ModuleService moduleService;
	
	@Autowired
	private RoleService roleService;

	//角色列表
	@RequestMapping("/torolelist")
	public String toRoleList(Model model){
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		return "back/sysadmin1/role/jRoleList";
	}
	
	//角色增加
	@RequestMapping("/tocreaterole")
	public String toRoleCreate(){
		return "back/sysadmin1/role/jRoleCreate";
	}
	//保存增加的角色
	@RequestMapping("createrole")
	public String createRole(Role role){
		
		roleService.createRole(role);
		return "redirect:/torolelist";
	}
	
	
	@RequestMapping("/todeleterole")
	public String toDeleteRole(Model model){
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		return "back/sysadmin1/role/jRoleDelete";
	}
	
	//角色删除
	@RequestMapping("/deleterole")
	public String toRoleDelete(@RequestParam("roleId")String[] roleIds){
		roleService.deleteRoleById(roleIds);
		return "redirect:/torolelist";
	}
	
	//定向到角色修改页面
	@RequestMapping("/toupdaterole")
	public String toRoleUpdate(String roleId,Model model){
		Role role = roleService.findRoleById(roleId);
		model.addAttribute("role", role);
		return "back/sysadmin1/role/jRoleUpdate";
	}
	
	//角色修改
	@RequestMapping("updaterole")
	public String updateRole(Role role){
		roleService.updateRole(role);
		return "redirect:/torolelist";
	}
	//角色查询
	@RequestMapping("/toqueryrole")
	public String toRoleQuery(String roleId,Model model){
		Role role = roleService.findRoleById(roleId);
		model.addAttribute("role", role);
		return "back/sysadmin1/role/jRoleQuery";
	}
	
	@RequestMapping("/torolemodule")
	public String toRolemodule(String roleId,Model model){
		List<Module> moduleList = moduleService.findAll();
		model.addAttribute("moduleList", moduleList);
		List<String> rModuleList= roleService.findRoleModuleList(roleId);
		model.addAttribute("rModuleList", rModuleList);
		model.addAttribute("roleId", roleId);
		return "back/sysadmin1/role/jRoleModule";
	}
	
	@RequestMapping("/saveRoleModule")
	public String saveRoleModule(String roleId,@RequestParam("moduleId")String[] moduleIds){
		
		roleService.saveRoleModule(roleId,moduleIds);
		return "redirect:/torolelist";
	}
	
	
	
}
