package cn.fds.service;

import java.util.List;

import cn.fds.pojo.Module;

public interface ModuleService {
	public List<Module> findAll();

	public void saveModule(Module module);

	public Module findModuleById(String moduleId);

	public void updateModule(Module module);

	public void deleteModule(String[] moduleIds);

}
