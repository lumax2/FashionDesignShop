package cn.fds.shiro;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import cn.fds.pojo.User;
import cn.fds.service.UserService;


public class AuthRealm extends AuthorizingRealm{
	@Resource
	private UserService userService;
	
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		//后台页面，测试放行
		List<String> pList = new ArrayList<String>();
		pList.add("货运管理");
		pList.add("系统管理");
		pList.add("系统管理");
		
		//从数据库查询
		/*User user =(User) SecurityUtils.getSubject().getPrincipal();
		List<String> pList =userService.findPListByUserId(user.getUserId());*/
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermissions(pList);
		
		return info;
	}

	@Override
	//登陆认证模块
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken loginToken = (UsernamePasswordToken)token;
		String username = loginToken.getUsername();
		User user = userService.findUserByUsername(username);
		AuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getPassword(),this.getName());
		return info;
	}



	
	
	
}
