package cn.fds.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.fds.mapper.OrderItemMapper;
import cn.fds.mapper.OrderMapper;
import cn.fds.mapper.ProductMapper;
import cn.fds.pojo.Order;
import cn.fds.pojo.OrderInfo;
import cn.fds.pojo.OrderItem;
import cn.fds.pojo.Product;
@Service
public class OrderItemServiceImpl implements OrderItemService {

	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public void saveOrderItem(OrderItem oi) {
		
		orderItemMapper.saveOrderItem(oi);
	}
	@Override
	public List<OrderItem> findOrderItemByUserId(String userId) {
		
		return orderItemMapper.findOrderItemByUserId(userId);
	}
	
	/*重载saveOrderItem方法 by Cade*/
	@Override
	public void saveOrderItem(Map<Product, Integer> cart, Order order) {
		String orderId = order.getOrderId();
		for(Entry<Product,Integer> entry:cart.entrySet()) {
			String productId = entry.getKey().getProductId();
			Integer buyNum = entry.getValue();
			orderItemMapper.addOrderItem(orderId,productId,buyNum);
		}
	}
	
	/*by Cade */
	@Override
	public List<OrderInfo> getOrderInfoByUserId(String userId) {
		List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
		List<Order> orders = orderMapper.findOrderByUserId(userId);
		List<OrderItem> ois = orderItemMapper.getOrderItemByUserId(userId);
		for(Order order:orders) {
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setOrder(order);
			Map<Product,Integer> map = new HashMap<Product,Integer>();
			for(OrderItem oi : ois){
				if(oi.getOrderId().equals(order.getOrderId())){
					Product product = productMapper.findProductByProductId(oi.getProductId());
					Integer buyNum = oi.getBuyNum();
					map.put(product, buyNum);
				}
			}
			orderInfo.setMap(map);
			orderInfoList.add(orderInfo);
		}
		return orderInfoList;
	}

}
