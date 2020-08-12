package team.itfour.store.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @author gao
 *
 */
public class SalesOrder {
	//销售单号
	private Integer sOrderNo;
	//订单日期
	private Date sOrderTime;
	//订单状态
	private String salesOrderState;
	
	//客户名称
	private String clientName;
	//联系电话
	private String clientPhone;
	//送货地址
	private String clientAddress;
	//客户类型
	private Client client;
	
	
	public SalesOrder() {
		super();
	}


	public SalesOrder(Integer sOrderNo, Date sOrderTime, String salesOrderState, String clientName, String clientPhone,
			String clientAddress, Client client) {
		super();
		this.sOrderNo = sOrderNo;
		this.sOrderTime = sOrderTime;
		this.salesOrderState = salesOrderState;
		this.clientName = clientName;
		this.clientPhone = clientPhone;
		this.clientAddress = clientAddress;
		this.client = client;
	}


	public Integer getsOrderNo() {
		return sOrderNo;
	}


	public void setsOrderNo(Integer sOrderNo) {
		this.sOrderNo = sOrderNo;
	}


	public Date getsOrderTime() {
		return sOrderTime;
	}


	public void setsOrderTime(Date sOrderTime) {
		this.sOrderTime = sOrderTime;
	}


	public String getSalesOrderState() {
		return salesOrderState;
	}


	public void setSalesOrderState(String salesOrderState) {
		this.salesOrderState = salesOrderState;
	}


	public String getClientName() {
		return clientName;
	}


	public void setClientName(String clientName) {
		this.clientName = clientName;
	}


	public String getClientPhone() {
		return clientPhone;
	}


	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}


	public String getClientAddress() {
		return clientAddress;
	}


	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}


	public Client getClient() {
		return client;
	}


	public void setClient(Client client) {
		this.client = client;
	}


	@Override
	public String toString() {
		return "SalesOrder [sOrderNo=" + sOrderNo + ", sOrderTime=" + sOrderTime + ", salesOrderState="
				+ salesOrderState + ", clientName=" + clientName + ", clientPhone=" + clientPhone + ", clientAddress="
				+ clientAddress + ", client=" + client + "]";
	}
	

}
