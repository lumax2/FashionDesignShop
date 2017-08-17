package cn.fds.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fds.mapper.ModuleMapper;
import cn.fds.pojo.Module;

@Service
public class ModuleServiceImpl implements ModuleService{
	@Autowired
	private ModuleMapper moduleMapper;

	@Override
	public List<Module> findAll() {
		return moduleMapper.findAll();
	}

	@Override
	public void saveModule(Module module) {
		String moduleId = UUID.randomUUID().toString();
		module.setModuleId(moduleId);
		moduleMapper.saveModule(module);
		
	}

	@Override
	public Module findModuleById(String moduleId) {
		return moduleMapper.findModuleById(moduleId);
	}

	@Override
	public void updateModule(Module module) {
		moduleMapper.updateModule(module);
		
	}

	@Override
	public void deleteModule(String[] moduleIds) {
		moduleMapper.deleteRoleModule(moduleIds);
		moduleMapper.deleteModule(moduleIds);
		
	}

}
