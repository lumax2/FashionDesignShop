package cn.fds.service;

import java.util.List;

import cn.fds.pojo.Role;
import cn.fds.pojo.User;

public interface UserService {
	/**
	 * 根据用户名和密码查询数据库中的用户信息
	 * @param username 用户名
	 * @param password 密码
	 * @return 用户信息
	 */
	public User findUserByUsernameAndPassword(String username, String password);

	/**
	 * 根据用户名查询数据库中的用户信息
	 * @param username 用户名
	 * @return 用户信息
	 */
	public User findUserByUsername(String username);

	/**
	 * 新增用户信息
	 * @param user 用户信息
	 */
	public void saveUser(User user);

	/**
	 * 根据用户名查询角色信息
	 * @param username 用户名
	 * @return 角色信息
	 */
	public List<Role> getRoleByUsername(String username);
	
	/**
	 * 查找所有的会员信息
	 * @return 会员集合
	 */
	public List<User> findAll();
	
	/**
	 * 根据用户Id查找用户
	 * @param userId 用户Id
	 * @return user
	 */
	public User findUserByUserId(String userId);

	/**
	 * 修改user信息
	 * @param user
	 */
	public void updateUser(User user);
	
	/**
	 * 给相应userId的用户添加角色
	 * @param userId
	 * @param roleIds
	 */
	public void saveRoles(String userId, String[] roleIds);
	
	/**
	 * 根据userId删除用户
	 * @param userIds
	 */
	public void deleteUser(String[] userIds);
}

