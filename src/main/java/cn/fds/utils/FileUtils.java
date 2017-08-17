package cn.fds.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {

	//将照片存贮在对应的文件路径下
	public static String  copyInputStreamToFile(MultipartFile multipartFile,String realPath) {
        
		if(multipartFile.isEmpty()){
			return "";
		}
		
		/**
		 * 创建一个8级深的目录
		 */
		// 产生一个相对唯一的随机数
		int hc = UUID.randomUUID().hashCode();
		// 将这个哈希值转化成一个十六进制的字符串
		// 哈希值是一个32位的二进制数据，-> 最多8位
		String s = Integer.toHexString(hc);
		// 为了防止这个字符串不足8位，将字符串补齐为8位
		for (int i = 0; i < 8 - s.length(); i++) {
			s += "0";
		}
		 /**构建图片保存的目录**/
		// 将字符串拆分为字符，利用字符产生一个八级深的目录
		String path = realPath+"img/imgupload";
		String path1="img/imgupload";
		for (char c : s.toCharArray()) {
			  /**构建图片保存的目录**/ 
			path = path + "/" + c;
			path1=path1+"/"+c;
		}
		 /**根据真实路径创建目录**/   
		File parent = new File(path);
		parent.mkdirs();
		
		System.out.println("照片存储路径"+path);
        /**页面控件的文件流**/ /**获取文件的后缀**/  
        /*String suffix = multipartFile.getOriginalFilename().substring (multipartFile.getOriginalFilename().lastIndexOf("."));  */
        // /**使用UUID生成文件名称**/ //  
        //构建文件名称   
        String logImageName = multipartFile.getOriginalFilename();  
        /**拼成完整的文件保存路径加文件**/   
       String fileName = path  + File.separator + logImageName;   
       File file = new File(fileName);   
       
       try {   
    	   multipartFile.transferTo(file);  
        }  
       catch (IllegalStateException e)  
        { e.printStackTrace(); }   
        catch (IOException e)   
        { e.printStackTrace(); } 
      
   		String imgUrl ="/"+(path1+File.separator+logImageName).replaceAll("\\\\", "/");
   		System.out.println("imgUrl:"+imgUrl);
		return imgUrl;
	}

}
