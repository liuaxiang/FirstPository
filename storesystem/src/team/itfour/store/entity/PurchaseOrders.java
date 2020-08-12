package team.itfour.store.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 
 * @author gao
 *
 */
public class PurchaseOrders {
	//进货单号
	private Integer pOrderNo;
	//进货时间
	private Date pOrderTime;
	
	public Integer getpOrderNo() {
		return pOrderNo;
	}
	public void setpOrderNo(Integer pOrderNo) {
		this.pOrderNo = pOrderNo;
	}
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@JsonFormat(pattern = "yyyy/MM/dd")
	public Date getpOrderTime() {
		return pOrderTime;
	}
	public void setpOrderTime(Date pOrderTime) {
		this.pOrderTime = pOrderTime;
	}
	public PurchaseOrders(Integer pOrderNo, Date pOrderTime) {
		super();
		this.pOrderNo = pOrderNo;
		this.pOrderTime = pOrderTime;
	}
	public PurchaseOrders() {
		super();
	}
	@Override
	public String toString() {
		return "PurchaseOrders [pOrderNo=" + pOrderNo + ", pOrderTime=" + pOrderTime + "]";
	}
	
}
