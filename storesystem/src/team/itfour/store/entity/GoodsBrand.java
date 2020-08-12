package team.itfour.store.entity;
/**
 * 
 * @author gao
 *
 */
public class GoodsBrand {
	//品牌编号
	private Integer brandNo;
	//品牌名称
	private String brandName;
	//供货商类型

	private Provider provider;

	
	public GoodsBrand() {
		super();
	}


	public GoodsBrand(Integer brandNo, String brandName, Provider provider) {
		super();
		this.brandNo = brandNo;
		this.brandName = brandName;
		this.provider = provider;
	}


	public Integer getBrandNo() {
		return brandNo;
	}


	public void setBrandNo(Integer brandNo) {
		this.brandNo = brandNo;
	}


	public String getBrandName() {
		return brandName;
	}


	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}


	public Provider getProvider() {
		return provider;
	}


	public void setProvider(Provider provider) {
		this.provider = provider;
	}


	@Override
	public String toString() {
		return "GoodsBrand [brandNo=" + brandNo + ", brandName=" + brandName + ", provider=" + provider + "]";
	}
	

	
}
