package cn.fds.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

import cn.fds.utils.MD5HashPassword;


public class AuthCredential extends  SimpleCredentialsMatcher{
	
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		UsernamePasswordToken loginToken = (UsernamePasswordToken)token;
		String password = String.valueOf(loginToken.getPassword());
		String username = loginToken.getUsername();
		password = MD5HashPassword.getMD5HashPassword(password, username);
		loginToken.setPassword(password.toCharArray());
		return super.doCredentialsMatch(loginToken, info);
	}
}
