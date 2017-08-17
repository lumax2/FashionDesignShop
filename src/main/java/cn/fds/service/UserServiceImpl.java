package cn.fds.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fds.mapper.RoleMapper;
import cn.fds.mapper.UserMapper;
import cn.fds.pojo.Role;
import cn.fds.pojo.User;
import cn.fds.utils.MD5HashPassword;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	public User findUserByUsernameAndPassword(String username, String password) {

		return  userMapper.findUserByUsernameAndPassword(username, password);

	}

	@Override
	public User findUserByUsername(String username) {

		return userMapper.findUserByUsername(username);

	}

	@Override
	public void saveUser(User user) {
		user.setUserId(UUID.randomUUID().toString());
		String password = 
			MD5HashPassword.getMD5HashPassword(user.getPassword(), user.getUsername());
		
		user.setPassword(password);
		
		userMapper.saveUser(user);
	}

	@Override
	public List<Role> getRoleByUsername(String username) {
		return roleMapper.getRoleByUsername(username);
	}

	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}

	@Override
	public User findUserByUserId(String userId) {
		return userMapper.findUserByUserId(userId);
	}

	@Override
	public void updateUser(User user) {
		User oldUser = userMapper.findUserByUserId(user.getUserId());
		if(!oldUser.getPassword().equals(user.getPassword())){
			String password=MD5HashPassword.getMD5HashPassword(user.getPassword(), user.getUsername());
			user.setPassword(password);
		}
		userMapper.updateUser(user);
		
	}

	@Override
	public void saveRoles(String userId, String[] roleIds) {
		userMapper.deleteUserRoles(userId);
		for(String roleId:roleIds){
			userMapper.saveRoles(userId,roleId);
		}
		
		
	}

	@Override
	public void deleteUser(String[] userIds) {
		for(String userId:userIds){
			//删除用户前,删除关联表数据
			userMapper.deleteUserRoles(userId);
		}
		
		//删除用户
		userMapper.deleteUser(userIds);
		
	}

}