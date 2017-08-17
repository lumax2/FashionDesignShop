package cn.fds.service;

import java.util.List;

import cn.fds.pojo.Order;
import cn.fds.pojo.User;

public interface OrderService {

	public void saveOrderByProductId(User userId);
	/**
	 * 根据orderId查询订单
	 * @param orderId
	 * @return
	 */
	public Order findOrderByOrderId(String orderId);
	
	/**
	 * 查询所有订单信息
	 * @return
	 */
	public List<Order> findOrderByUserId(String userId);
	

	/**
	 * 查询所有订单
	 * @return
	 */
	public List<Order> findAll();
	
	/**
	 * 修改指定订单信息
	 * @param order
	 */
	public void updateOrder(Order order);
	
	/**
	 * 根据订单Id数组删除订单
	 * @param orderIds
	 */
	public void deleteOrders(String[] orderIds);
	
	/**
	 * 新增订单
	 * @param order
	 */
	public void newOrder(Order order);

	/**
	 * 向order中添加订单信息
	 * @param order
	 */
	public void saveOrder(Order order);
	
	/**
	 * 根据订单删除数据库中的对应数据
	 * @param orderId 订单编号
	 */
	public void deleteOrderInfo(String orderId);
	
	/**
	 * 修改支付状态
	 * @param orderId
	 * @param paystate 
	 */
	
	public void updateState(String orderId);
	
}