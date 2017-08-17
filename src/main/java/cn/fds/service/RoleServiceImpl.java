package cn.fds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fds.mapper.RoleMapper;
import cn.fds.pojo.Role;
@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<Role> findAll() {
		
		return roleMapper.findAll();
	}
	@Override
	public List<String> findRoleListByUserId(String userId) {
		
		return roleMapper.fingRoleListByUserId(userId);
	}
	@Override
	public Role findRoleById(String roleId) {
		return roleMapper.findRoleById(roleId);
		
	}
	@Override
	public void createRole(Role role) {
		roleMapper.createRole(role);
		
	}
	@Override
	public void deleteRoleById(String[] roleIds) {
		roleMapper.deleteURoleByRoleId(roleIds);
		roleMapper.deleteRModuleByRoleId(roleIds);
		roleMapper.deleteRoleById(roleIds);
		
	}
	@Override
	public void updateRole(Role role) {
		roleMapper.updateRole(role);
		
		
	}
	@Override
	public List<String> findRoleModuleList(String roleId) {
		return roleMapper.findRoleModuleList(roleId);
	}
	@Override
	public void saveRoleModule(String roleId, String[] moduleIds) {
		for(String moduleId:moduleIds){
			roleMapper.saveRoleModule(roleId,moduleId);
		}
		
	}
	
}
