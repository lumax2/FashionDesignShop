package cn.fds.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import cn.fds.pojo.Product;
import cn.fds.pojo.ProductJson;
import cn.fds.pojo.User;

public interface ProductService {

	/**
	 *
	 * @param productId商品id
	 * @return商品信息
	 */
	public Product findProductByProductId(String productId);
	
	/**
	 * 商品查询
	 * @return
	 */
	public List<Product> findAllProduct();

	/**
	 * 商品修改
	 * @param product
	 */
	public void updateProduct(Product product);

	/**
	 * 新增商品
	 * @param product
	 */
	public void createProduct(Product product);

	/**
	 * 删除商品列表
	 * @param productIds
	 */
	public void deleteProductById(String[] productIds);

	/**
	 * 获得所有产品的品名
	 * @return
	 */
	public List<String> findProductName();

	/**
	 * 获得所有产品的品名及对应品名的销售数量
	 * @return
	 */
	public List<ProductJson> findProductNameValue();

	/**
	 * 查找所有的产品，包括照片的文件
	 * @return
	 * @throws IOException 
	 */
	public	List<Product> findAllProducts(String realPath) throws  IOException;

	
	
}
