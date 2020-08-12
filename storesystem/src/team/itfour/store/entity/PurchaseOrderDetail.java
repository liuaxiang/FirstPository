package team.itfour.store.entity;
/**
 * 
 * @author gao
 *
 */
public class PurchaseOrderDetail {
	//明细编号
	private Integer pDetailNo;
	
	
	private Integer pOrderNo;
	//购买商品数量
	private Integer buyGoodsNumber;
	//商品单价
	private float goodsPrice;
	//商品类型
	private Goods goods;
	
	//进货订单类型
	private PurchaseOrders purchaseOrders;
	
	

	public PurchaseOrderDetail() {
		super();
	}



	public PurchaseOrderDetail(Integer pDetailNo, Integer pOrderNo, Integer buyGoodsNumber, float goodsPrice,
			Goods goods, PurchaseOrders purchaseOrders) {
		super();
		this.pDetailNo = pDetailNo;
		this.pOrderNo = pOrderNo;
		this.buyGoodsNumber = buyGoodsNumber;
		this.goodsPrice = goodsPrice;
		this.goods = goods;
		this.purchaseOrders = purchaseOrders;
	}



	public Integer getpDetailNo() {
		return pDetailNo;
	}



	public void setpDetailNo(Integer pDetailNo) {
		this.pDetailNo = pDetailNo;
	}



	public Integer getpOrderNo() {
		return pOrderNo;
	}



	public void setpOrderNo(Integer pOrderNo) {
		this.pOrderNo = pOrderNo;
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



	public PurchaseOrders getPurchaseOrders() {
		return purchaseOrders;
	}



	public void setPurchaseOrders(PurchaseOrders purchaseOrders) {
		this.purchaseOrders = purchaseOrders;
	}



	@Override
	public String toString() {
		return "PurchaseOrderDetail [pDetailNo=" + pDetailNo + ", pOrderNo=" + pOrderNo + ", buyGoodsNumber="
				+ buyGoodsNumber + ", goodsPrice=" + goodsPrice + ", goods=" + goods + ", purchaseOrders="
				+ purchaseOrders + "]";
	}
	

	
}
