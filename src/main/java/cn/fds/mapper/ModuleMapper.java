package cn.fds.mapper;

import java.util.List;

import cn.fds.pojo.Module;

public interface ModuleMapper {
	
	public List<Module> findAll();

	public void saveModule(Module module);

	public Module findModuleById(String moduleId);

	public void updateModule(Module module);

	public void deleteModule(String[] moduleIds);
    
	public void deleteRoleModule(String[] moduleIds);

}
