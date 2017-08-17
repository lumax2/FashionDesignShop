package cn.fds.pojo;

import java.util.Map;

public class OrderInfo {
 
	private Order order;//商品订单
	private Map<Product,Integer> map;//当前订单下的所有订单信息
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Map<Product, Integer> getMap() {
		return map;
	}
	public void setMap(Map<Product, Integer> map) {
		this.map = map;
	}
}
