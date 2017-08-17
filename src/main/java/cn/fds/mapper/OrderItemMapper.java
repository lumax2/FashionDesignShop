package cn.fds.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import cn.fds.pojo.OrderItem;

public interface OrderItemMapper {

	/**
	 * 订单条目表添加信息
	 * @param oi
	 */
	void saveOrderItem(OrderItem oi);

	/**
	 * 查询订单条目
	 * @param userId
	 * @return
	 */
	List<OrderItem> findOrderItemByUserId(String userId);
	
	/**
	 * 将数据插入到order_product_p表中 by Cade
	 * @param orderId	订单信息
	 * @param productId 产品信息
	 * @param buyNum    购买数量
	 */
	public void addOrderItem(@Param("orderId") String orderId,@Param("productId") String productId,@Param("buyNum") Integer buyNum);

	/**
	 * 根据用户id在product_order_p表中查询相应数据并返回
	 * @param userId 用户编号
	 */
	public List<OrderItem> getOrderItemByUserId(@Param("userId") String userId);

	/**
	 * 根据订单id在product_order_p表中删除相应的数据
	 * @param orderId 订单编号
	 */
	@Delete("delete from product_order_p where order_id = #{orderId}")
	public void deleteOrderItemByOrderId(String orderId);

}
