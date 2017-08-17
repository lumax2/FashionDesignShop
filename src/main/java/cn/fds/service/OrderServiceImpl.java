package cn.fds.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fds.mapper.OrderItemMapper;
import cn.fds.mapper.OrderMapper;
import cn.fds.pojo.Order;
import cn.fds.pojo.User;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	
	@Override
	public void saveOrderByProductId(User userId) {
		
		
		orderMapper.saveOrderByProductId(userId);
	}
	/**
	 * 根据订单id查询具体订单信息
	 */
	@Override
	public Order findOrderByOrderId(String orderId) {
		
		return orderMapper.findOrderByOrderId(orderId);
	}
	
	@Override
	public List<Order> findOrderByUserId(String userId) {
		
		return orderMapper.findOrderByUserId(userId);
	}

	
	/**
	 *查询所有的订单
	 */
	@Override
	public List<Order> findAll() {
		
		return orderMapper.findAll();
	}
	
	/**
	 * 修改指定订单信息
	 */
	@Override
	public void updateOrder(Order order) {
		order.setOrderTime(new Date());
		orderMapper.updateOrder(order);
	}
	
	/**
	 * 根据订单id数组删除订单
	 */
	@Override
	public void deleteOrders(String[] orderIds) {
		orderMapper.deleteOrders(orderIds);
		
	}
	@Override
	public void newOrder(Order order) {
		order.setOrderId(UUID.randomUUID().toString());
		order.setOrderTime(new Date());
		order.setPayState(0);
		orderMapper.newOrder(order);
		
	}

	
	/**
	 * 向order表中添加订单信息
	 */
	public void saveOrder(Order order) {
		
		orderMapper.saveOrder(order);
	}
	
	/**
	 * 根据订单编号删除数据库中的对应数据
	 */
	@Override
	public void deleteOrderInfo(String orderId) {
		orderMapper.deleteOrderByOrderId(orderId);
		orderItemMapper.deleteOrderItemByOrderId(orderId);
	}
	@Override
	public void updateState(String orderId) {
		
		orderMapper.updateState(orderId);
	}
}
