package cn.fds.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5HashPassword {
	public static String getMD5HashPassword(String password,String username) {
		return new Md5Hash(password,username,3).toString();
	}
}
