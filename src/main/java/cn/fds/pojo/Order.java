package cn.fds.pojo;

import java.util.Date;

public class Order {

	private String orderId;
	private Double orderMoney;
	private String receiveInfo;
	private Integer payState;
	private String  userId;
	private Date orderTime;
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(Double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public String getReceiveInfo() {
		return receiveInfo;
	}
	public void setReceiveInfo(String receiveInfo) {
		this.receiveInfo = receiveInfo;
	}
	public Integer getPayState() {
		return payState;
	}
	public void setPayState(Integer payState) {
		this.payState = payState;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date ordeTime) {
		this.orderTime = ordeTime;
	}
	
}
