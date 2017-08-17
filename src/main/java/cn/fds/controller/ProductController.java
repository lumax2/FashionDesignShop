package cn.fds.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.fds.pojo.Product;
import cn.fds.service.ProductService;
import cn.fds.utils.ExcelUtil;
import cn.fds.utils.FileUtils;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	/**
	 * ====跳转到商品详情页面====
	 * 根据商品信息查找商品
	 */
	@RequestMapping("/toProductInfo")
	public String toProductInfo(String productId,HttpServletRequest request) {
		Product prod = productService.findProductByProductId(productId);
		request.setAttribute("prod", prod);
		return "productInfo/prodinfo";
	}
	
	//商品列表
	@RequestMapping("/toproductlist")
	public String toProductList(Model model){
		
		List<Product> productList =productService.findAllProduct();
		model.addAttribute("productList", productList);
		return "back/sysadmin1/product/jProductList";
	}
	
	//商品添加
		@RequestMapping("/tocreateproduct")
		public String tocreateproduct(Model model){
			
			List<Product> productList =productService.findAllProduct();
			model.addAttribute("productList", productList);
			return "back/sysadmin1/product/jProductCreate";
		}
		
		//商品去删除
		@RequestMapping("/todeleteproduct")
		public String todeleteproduct(Model model){
			
			List<Product> productList =productService.findAllProduct();
			
			model.addAttribute("productList", productList);
			
			return "back/sysadmin1/product/jProductDelete";
		}
		
		//商品删除
		@RequestMapping("/deleteproduct")
		public String deleteproduct(@RequestParam("productId") String[] productIds,HttpSession httpSession){
			productService.deleteProductById(productIds);
			httpSession.removeAttribute("productSession");
			return "redirect:/toproductlist";
		}
		
		//商品添加
		@RequestMapping("/createproduct")
		 public String createproduct(HttpServletRequest request,HttpSession httpSession) {   
		
			String realPath = request.getSession().
			                getServletContext().getRealPath("/");
			
			String realPathTran2 =realPath.replaceAll("\\\\", "/");
			//System.out.println(" replaceAll(/, File.separator):"+realPathTran2);
		//	System.out.println("realpath:"+realPath);
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
			  /**页面控件的文件流**/  
	        MultipartFile multipartFile = multipartRequest.getFile("file");  
	        String imgUrl=FileUtils.copyInputStreamToFile(multipartFile,realPathTran2);  
	        Product product = new Product();
	        /**获取产品信息**/
	        product.setProductId(multipartRequest.getParameter("productId")); 
	        product.setProductName(multipartRequest.getParameter("productName"));
	        product.setProductPrice(Double.valueOf(multipartRequest.getParameter("productPrice")));
	        product.setProductCatory(multipartRequest.getParameter("productCatory"));
	        product.setProductDesc(multipartRequest.getParameter("productDesc"));
	        product.setImgUrl(imgUrl);
	        productService.createProduct(product);

	        httpSession.removeAttribute("productSession");

	       return "redirect:/toproductlist";
		}
		
		
	//商品去修改
	@RequestMapping("/toupdateproduct")
	public String toUpdate(String productId,Model model){
		
		List<Product> productList =productService.findAllProduct();
		model.addAttribute("productList", productList);
		return "back/sysadmin1/product/jProductUpdate1";
	}
	//商品去修改页面1
	@RequestMapping("/toupdateproduct2")
	public String toUpdateP(String productId,Model model){
		
		Product product =productService.findProductByProductId(productId);
		model.addAttribute("product", product);
		return "back/sysadmin1/product/jProductUpdate2";
	}
	
	

	//商品修改
	@RequestMapping("/updateproduct")
	public String Update(HttpServletRequest request,HttpSession httpSession){
		
		String realPath = request.getSession().getServletContext().getRealPath("/");

		String realPathTran2 =realPath.replaceAll("\\\\", "/");
//System.out.println(" replaceAll(/, File.separator):"+realPathTran2);
//	System.out.println("realpath:"+realPath);
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  

  /**页面控件的文件流**/  
		MultipartFile multipartFile = multipartRequest.getFile("file");  
		String imgUrl=null;
		if(multipartFile.isEmpty()){
			 imgUrl=multipartRequest.getParameter("imgUrl");
		}else{
			imgUrl=FileUtils.copyInputStreamToFile(multipartFile,realPathTran2); 
		}
		 
		Product product = new Product();
/**获取产品信息**/
		product.setProductId(multipartRequest.getParameter("productId")); 
		product.setProductName(multipartRequest.getParameter("productName"));
		product.setProductPrice(Double.valueOf(multipartRequest.getParameter("productPrice")));
		product.setProductCatory(multipartRequest.getParameter("productCatory"));
		product.setProductDesc(multipartRequest.getParameter("productDesc"));

		product.setImgUrl(imgUrl);
		productService.updateProduct(product);
		httpSession.removeAttribute("productSession");
			return "redirect:/toproductlist";
	}
	
	//商品查询
	@RequestMapping("/toqueryproduct")
	public String toquery(Model model){
		List<Product> productList =productService.findAllProduct();
		model.addAttribute("productList", productList);
		return "back/sysadmin1/product/jProductQuery";
	}
	
	//商品列表excel导出
	@RequestMapping("/prodListExcelOut")
	public String toExcelList(HttpServletRequest request,Model model) throws FileNotFoundException{
		ExcelUtil<Product> ex = new ExcelUtil<Product>();
		String title="产品列表";
		String[] headers = { "产品id","产品名","产品单价","产品品类","产品路径","产品描述","产品照片"};
		List<Product> productList;
		String realPath=request.getSession().getServletContext().getRealPath("/");
		try {
			productList = productService.findAllProducts(realPath);
			OutputStream outXlsx = new FileOutputStream("E://prodList.xls");
			String pattern="yyyy-MM-dd";
			ex.exportExcel(title, headers, productList, outXlsx, pattern);
			System.out.println("导出成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("title","prodList.xls文件");
		  return "/chenyue/error";
	}
	
	
}


