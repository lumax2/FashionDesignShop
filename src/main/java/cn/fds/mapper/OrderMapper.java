package cn.fds.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import cn.fds.pojo.Order;
import cn.fds.pojo.User;

public interface OrderMapper {

	/**
	 * 添加购物车
	 * @param productId
	 */
	public void saveOrderByProductId(User userId);
	/**
	 * 
	 * 根据订单id查找订单信息
	 * @param orderId
	 * @return
	 */
	public Order findOrderByOrderId(String orderId);
	/**
	 * 根据userId查询所有订单信息
	 * @return
	 */
	public List<Order> findOrderByUserId(String userId);

	
	/**
	 * 查询所有订单信息
	 * @return
	 */
	public List<Order> findAll();
	
	/**
	 * 根据订单Id修改订单信息
	 * @param order
	 */
	public void updateOrder(Order order);
	
	/**
	 * 根据订单ID数组删除订单
	 * @param orderIds
	 */
	public void deleteOrders(String[] orderIds);
	
	/**
	 * 新增订单
	 * @param order
	 */
	public void newOrder(Order order);
	

	
	/**
	 * 向order表中添加订单信息
	 * @param order
	 */
	public void saveOrder(Order order);
	
	/**
	 * 在order_p表中删除与orderId对应的数据
	 * @param orderId 订单编号
	 */
	@Delete("delete from order_p where order_id = #{orderId}")
	public void deleteOrderByOrderId(String orderId);
	/**
	 * 修改支付状态
	 * @param orderId
	 */
	@Update("update order_p set paystate=1 where order_id=#{orderId}")
	public void updateState(String orderId);
}
