package utils;

import java.security.MessageDigest;


import org.apache.tomcat.util.codec.binary.Base64;


public class encrypt {
	// md5
	// sha-1 => thường được sử dụng
	public static String toSHA1(String str) {
		String salt = "bnczb@./vbeqe?/wiuiw";// Làm cho mật khẩu phức tap
		String result = null;
		
		str = str + salt;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(md.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
        
        
}