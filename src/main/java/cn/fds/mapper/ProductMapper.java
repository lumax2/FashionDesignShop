package cn.fds.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.fds.pojo.Product;
import cn.fds.pojo.ProductJson;

public interface ProductMapper {

	/**
	 * 商品添加
	 * @param productId商品id
	 * @return商品信息
	 */
	public Product findProductByProductId(String productId);

	/**
	 * 查询全部产品信息
	 * @return
	 */
	public List<Product> findAllProduct();

	
	/**
	 * 更新商品
	 * @param product
	 */
	public void updateProduct(Product product);

	/**
	 * 新增商品
	 * @param product
	 */
	public void createProduct(Product product);

	/**
	 * 根据商品id,删除商品
	 * @param productId
	 */
	public void deleteProductById(String productId);
	/**
	 * 获得所有产品的品名
	 * @return
	 */
	public List<String> findProdName();
	/**
	 * 获得所有产品的品名及对应品名的销售数量
	 * @return
	 */
	public List<ProductJson> findProdNV();
	

}
