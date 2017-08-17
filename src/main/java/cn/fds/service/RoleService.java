package cn.fds.service;

import java.util.List;

import cn.fds.pojo.Role;

public interface RoleService {
	/**
	 * 查找所有的角色
	 * @return
	 */
	public List<Role> findAll();
	
	/**
	 * 根据userId查找对应的角色
	 * @param userId
	 * @return
	 */
	public List<String> findRoleListByUserId(String userId);

	/**
	 * 根据角色id查找角色
	 * @param roleId
	 * @return 
	 */
	public Role findRoleById(String roleId);

	/**
	 * 增加角色
	 * @param role
	 */
	public void createRole(Role role);

	/**
	 * 根据角色id删除角色
	 * @param roleId
	 */
	public void deleteRoleById(String[] roleIds);

	/**
	 * 修改角色
	 * @param role
	 */
	public void updateRole(Role role);

	/**
	 * 根据角色id查找其权限
	 * @param roleId
	 * @return
	 */
	public List<String> findRoleModuleList(String roleId);

	/**
	 * 将角色权限信息保存到关联表
	 * @param roleId
	 * @param moduleIds
	 */
	public void saveRoleModule(String roleId, String[] moduleIds);
}
