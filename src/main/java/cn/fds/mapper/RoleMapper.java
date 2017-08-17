package cn.fds.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.fds.pojo.Role;

public interface RoleMapper {
	/**
	 * 根据用户名查询角色信息
	 * @param username
	 * @return 角色信息
	 */
	public List<Role> getRoleByUsername(String username);
	
	/**
	 * 查找所有的角色信息
	 * @return 角色集合
	 */
	@Select("select * from role_p")
	public List<Role> findAll();
	
	/**
	 * 根据userId查找对应的角色
	 * @param userId
	 * @return
	 */
	public List<String> fingRoleListByUserId(String userId);

	/**
	 * 根据roleId查找对应角色
	 * @param roleId
	 */
	
	@Select("select * from role_p where role_id=#{roleId}")
	public Role findRoleById(String roleId);

	/**
	 * 增加角色
	 * @param role
	 */
	@Insert("insert into role_p values (#{roleId},#{roleName})")
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
	@Update("update role_p set role_name = #{roleName} where role_id=#{roleId}")
	public void updateRole(Role role);

	/**
	 * 根据角色id删除用户角色关联表
	 * @param roleIds
	 */
	public void deleteURoleByRoleId(String[] roleIds);

	/**
	 * 根据角色id删除权限角色关联表
	 * @param roleIds
	 */
	public void deleteRModuleByRoleId(String[] roleIds);

	/**
	 * 根据角色id查询权限信息
	 * @param roleId
	 * @return
	 */
	@Select("select module_id from role_module_p where role_id =#{roleId}")
	public List<String> findRoleModuleList(String roleId);

	/**
	 * 保存角色权限信息到关联表
	 * @param roleId
	 * @param moduleIds
	 */
	public void saveRoleModule(@Param("roleId")String roleId, @Param("moduleId")String moduleId);
}
