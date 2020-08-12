package team.itfour.store.entity;

public class Goods {
	//商品编号
	private Integer goodsNo;
	//商品名称
	private String goodsName;
	//商品主图
	private String mainFigure;
	//商品数量
	private Integer goodsNumber;
	//商品价格
	private Double goodsPrice;
	//商品评论
	private String goodsRemark;
	//品牌对象
	private GoodsBrand goodsBrand;
	//类型对象
	private GoodsType goodsType;

	
	
	
	public Goods() {
		super();
	}


	public Goods(Integer goodsNo) {
		super();
		this.goodsNo = goodsNo;
	}

	
	

	public Goods(Integer goodsNo, String goodsName, String mainFigure, Integer goodsNumber, Double goodsPrice,
			String goodsRemark, GoodsBrand goodsBrand, GoodsType goodsType) {
		super();
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
		this.mainFigure = mainFigure;
		this.goodsNumber = goodsNumber;
		this.goodsPrice = goodsPrice;
		this.goodsRemark = goodsRemark;
		this.goodsBrand = goodsBrand;
		this.goodsType = goodsType;
	}


	public Integer getGoodsNo() {
		return goodsNo;
	}


	public void setGoodsNo(Integer goodsNo) {
		this.goodsNo = goodsNo;
	}


	public String getGoodsName() {
		return goodsName;
	}


	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}


	public String getMainFigure() {
		return mainFigure;
	}


	public void setMainFigure(String mainFigure) {
		this.mainFigure = mainFigure;
	}


	public Integer getGoodsNumber() {
		return goodsNumber;
	}


	public void setGoodsNumber(Integer goodsNumber) {
		this.goodsNumber = goodsNumber;
	}


	public Double getGoodsPrice() {
		return goodsPrice;
	}


	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}


	public String getGoodsRemark() {
		return goodsRemark;
	}


	public void setGoodsRemark(String goodsRemark) {
		this.goodsRemark = goodsRemark;
	}


	public GoodsBrand getGoods_brand() {
		return goodsBrand;
	}


	public void setGoods_brand(GoodsBrand goodsBrand) {
		this.goodsBrand = goodsBrand;
	}


	public GoodsType getGoods_type() {
		return goodsType;
	}


	public void setGoods_type(GoodsType goodsType) {
		this.goodsType = goodsType;
	}


	@Override
	public String toString() {
		return "Goods [goodsNo=" + goodsNo + ", goodsName=" + goodsName + ", mainFigure=" + mainFigure
				+ ", goodsNumber=" + goodsNumber + ", goodsPrice=" + goodsPrice + ", goodsRemark=" + goodsRemark
				+ ", goodsBrand=" + goodsBrand + ", goodsType=" + goodsType + "]";
	}



	
}
