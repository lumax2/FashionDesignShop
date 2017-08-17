package cn.fds.service;

import java.util.List;
import java.util.Map;

import cn.fds.pojo.Order;
import cn.fds.pojo.OrderInfo;
import cn.fds.pojo.OrderItem;
import cn.fds.pojo.Product;

public interface OrderItemService {
	
	/**
	 * 向订单条目表中加信息
	 * @param oi
	 */
	void saveOrderItem(OrderItem oi);

	/**
	 * 根据用户id查询订单条目
	 * @param userId
	 * @return
	 */
	List<OrderItem> findOrderItemByUserId(String userId);
	
	
	/**
	 * 重载saveOrderItem方法,向数据库插入OrderItem所需要的信息 by Cade
	 * @param cart Map类型对象,内保存产品信息以及购买数量
	 * @param order Order类型对象,内保存订单信息
	 */
	public void saveOrderItem(Map<Product, Integer> cart, Order order);

	/**
	 * 在登录时根据UserId来查询对应的OrderInfo信息
	 * @param userId 用户编号
	 * @return orderInfo信息
	 */
	public List<OrderInfo> getOrderInfoByUserId(String userId);
	
	
}
