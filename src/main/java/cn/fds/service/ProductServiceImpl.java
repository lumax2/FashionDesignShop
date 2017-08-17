package cn.fds.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fds.mapper.ProductMapper;
import cn.fds.pojo.Product;
import cn.fds.pojo.ProductJson;
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper productMapper;
	/**
	 * 根据id查询信息
	 */
	@Override
	public Product findProductByProductId(String productId) {
		
		return productMapper.findProductByProductId(productId);
	}

	@Override
	public List<Product> findAllProduct() {
		
		return productMapper.findAllProduct();
	}

	@Override
	public void updateProduct(Product product) {
		
		
		productMapper.updateProduct(product);

	}

	@Override
	public void createProduct(Product product) {
		
		productMapper.createProduct(product);
		
	}

	@Override
	public void deleteProductById(String[] productIds) {

		for(String productId:productIds){
			productMapper.deleteProductById(productId);
		}
		
	}

	@Override
	public List<String> findProductName() {
		List<String> prodNameList=productMapper.findProdName();
		return prodNameList;
	}

	@Override
	public List<ProductJson> findProductNameValue() {
		List<ProductJson>prodJsonList=	productMapper.findProdNV();
		return prodJsonList;
	}

	@Override
	public List<Product> findAllProducts(String realPath) throws IOException {
		
		List<Product> productList =productMapper.findAllProduct();
		for(Product p:productList){
			//将读入的FileInputStream变成字节数组
			InputStream fis = new FileInputStream(realPath+p.getImgUrl());
			byte[] img=new byte[fis.available()];
			fis.read(img);
			fis.close();
			//将字节数组设置到product对象的img属性
			p.setImg(img);
		}
		return productList;
	}

}
