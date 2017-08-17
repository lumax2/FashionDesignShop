package imgFileTest;

import java.io.File;
import java.util.UUID;

public class ImgFileTest {

	public static void main(String[] args) {
				// 产生一个相对唯一的随机数
				int hc = UUID.randomUUID().hashCode();
				// 将这个哈希值转化成一个十六进制的字符串
				// 哈希值是一个32位的二进制数据，-> 最多8位
				String s = Integer.toHexString(hc);
				// 为了防止这个字符串不足8位，将字符串补齐为8位
				for (int i = 0; i < 8 - s.length(); i++) {
					s += "0";
				}
				// 将字符串拆分为字符，利用字符产生一个八级深的目录
				String path = "E:\\split";
				for (char c : s.toCharArray()) {
					path = path + "\\" + c;
				}
				// 需要将这些目录创建出来
				File parent = new File(path);
				parent.mkdirs();
	}
}
