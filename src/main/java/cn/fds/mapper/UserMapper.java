package cn.fds.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.fds.pojo.User;

public interface UserMapper {
	/**
	 * 根据用户名和密码在user_p中查询用户信息
	 * @param username 用户名
	 * @param password 密码
	 * @return 用户信息
	 */
	@Select("select * from user_p where user_name = #{username} and password = #{password}")
	public User findUserByUsernameAndPassword(@Param("username") String username,@Param("password") String password);

	/**
	 * 新增用户信息
	 * @param user 用户信息
	 */
	public void saveUser(User user);

	/**
	 * 根据用户名查询相对应的用户信息
	 * @param username 用户名
	 * @return
	 */
	@Select("select * from user_p where user_name = #{username}")
	public User findUserByUsername(String username);
	
	/**
	 * 查询所有的会员信息
	 * @return 会员集合
	 */
	@Select("select * from user_p")
	public List<User> findAll();
	
	/**
	 * 根据用户Id查找用户
	 * @param userId 用户Id
	 * @return user
	 */
	@Select("select * from user_p where user_id=#{userId}")
	public User findUserByUserId(String userId);
	
	/**
	 * 修改user信息
	 * @param user
	 */
	public void updateUser(User user);
	
	
	/**
	 * 给相应userId的用户添加角色
	 * @param userId
	 * @param roleId
	 */
	public void saveRoles(@Param("userId")String userId, @Param("roleId")String roleId);
	
	/**
	 * 根据userId删除用户所有角色,防止重复提交
	 * @param userId
	 */
	public void deleteUserRoles(String userId);
	
	/**
	 * 根据userId删除用户
	 * @param userIds
	 */
	public void deleteUser(String[] userIds);
	

}

