package team.itfour.store.entity;
/**
 * 
 * @author gao
 *
 */
public class SalesOrderDetail {
	//明细编号
	private Integer sDetailNo;
	
	
	//购买商品数量
	private Integer buyGoodsNumber;
	//商品单价
	private float goodsPrice;
	//商品编号
	private Goods goods;
	//订单类型
	private SalesOrder sales_order;
	
	
	public SalesOrderDetail() {
		super();
	}


	public SalesOrderDetail(Integer sDetailNo, Integer buyGoodsNumber, float goodsPrice, Goods goods,
			SalesOrder sales_order) {
		super();
		this.sDetailNo = sDetailNo;
		this.buyGoodsNumber = buyGoodsNumber;
		this.goodsPrice = goodsPrice;
		this.goods = goods;
		this.sales_order = sales_order;
	}


	public Integer getsDetailNo() {
		return sDetailNo;
	}


	public void setsDetailNo(Integer sDetailNo) {
		this.sDetailNo = sDetailNo;
	}


	public Integer getBuyGoodsNumber() {
		return buyGoodsNumber;
	}


	public void setBuyGoodsNumber(Integer buyGoodsNumber) {
		this.buyGoodsNumber = buyGoodsNumber;
	}


	public float getGoodsPrice() {
		return goodsPrice;
	}


	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}


	public Goods getGoods() {
		return goods;
	}


	public void setGoods(Goods goods) {
		this.goods = goods;
	}


	public SalesOrder getSales_order() {
		return sales_order;
	}


	public void setSales_order(SalesOrder sales_order) {
		this.sales_order = sales_order;
	}


	@Override
	public String toString() {
		return "SalesOrderDetail [sDetailNo=" + sDetailNo + ", buyGoodsNumber=" + buyGoodsNumber + ", goodsPrice="
				+ goodsPrice + ", goods=" + goods + ", sales_order=" + sales_order + "]";
	}
	
	
}
