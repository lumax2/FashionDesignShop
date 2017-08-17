package cn.fds.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.fds.pojo.Module;
import cn.fds.service.ModuleService;

@Controller
public class ModuleController {
	@Autowired
	private ModuleService moduleService;

	//权限列表
	@RequestMapping("/tomodulelist")
	public String toModuleList(Model model){
		List<Module> moduleList = moduleService.findAll();
		model.addAttribute("moduleList", moduleList);
		return "back/sysadmin1/module/jModuleList";
	}
	
	//权限增加
		@RequestMapping("/tocreatemodule")
		public String toModuleCreate(Model model){
			List<Module> parentList = moduleService.findAll();
			model.addAttribute("parentList", parentList);
			return "back/sysadmin1/module/jModuleCreate";
		}
		
		//权限增加
		@RequestMapping("/tosave")
		public String toSave(Module module){
			moduleService.saveModule(module);
			return "redirect:/tomodulelist";
		}
		
		//权限删除
		@RequestMapping("/todeletemodule")
		public String toModuleDelete(@RequestParam(value="moduleId",required=true)String[] moduleIds){
			moduleService.deleteModule(moduleIds);
			return "redirect:/tomodulelist";
		}
		//权限修改
		@RequestMapping("/toupdatemodule")
		public String toModuleUpdate(String moduleId,Model model){
			Module module = moduleService.findModuleById(moduleId);
			List<Module> parentList = moduleService.findAll();
			model.addAttribute("module", module);
			model.addAttribute("parentList", parentList);
			return "back/sysadmin1/module/jModuleUpdate";
		}
		
		@RequestMapping("/toupdate")
		public String toupdate(Module module){
			moduleService.updateModule(module);
			return "redirect:/tomodulelist";
		}
		
		//权限查询
		@RequestMapping("/toquerymodule")
		public String toModuleQuery(){
			return "back/sysadmin1/module/jModuleQuery";
		}
		
}












