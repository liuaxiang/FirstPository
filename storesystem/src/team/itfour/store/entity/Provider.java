package team.itfour.store.entity;
/**
 * 
 * @author gao
 *
 */
public class Provider {
    //商家编号
    private Integer providerNo;
    //商家名称
	private String providerName;
    //联系电话
	private String providerPhone;
	//联系邮箱	
	private String providerEmail;
	//联系地址	
	private String providerAddress;
	//联系人	
	private String pContact;
	
	public Integer getProviderNo() {
		return providerNo;
	}
	public void setProviderNo(Integer providerNo) {
		this.providerNo = providerNo;
	}
	public String getProviderName() {
		return providerName;
	}
	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	public String getProviderPhone() {
		return providerPhone;
	}
	public void setProviderPhone(String providerPhone) {
		this.providerPhone = providerPhone;
	}
	public String getProviderEmail() {
		return providerEmail;
	}
	public void setProviderEmail(String providerEmail) {
		this.providerEmail = providerEmail;
	}
	public String getProviderAddress() {
		return providerAddress;
	}
	public void setProviderAddress(String providerAddress) {
		this.providerAddress = providerAddress;
	}
	public String getpContact() {
		return pContact;
	}
	public void setpContact(String pContact) {
		this.pContact = pContact;
	}
	public Provider(Integer providerNo, String providerName, String providerPhone, String providerEmail,
			String providerAddress, String pContact) {
		super();
		this.providerNo = providerNo;
		this.providerName = providerName;
		this.providerPhone = providerPhone;
		this.providerEmail = providerEmail;
		this.providerAddress = providerAddress;
		this.pContact = pContact;
	}
	public Provider() {
		super();
	}
	@Override
	public String toString() {
		return "Provider [providerNo=" + providerNo + ", providerName=" + providerName + ", providerPhone="
				+ providerPhone + ", providerEmail=" + providerEmail + ", providerAddress=" + providerAddress
				+ ", pContact=" + pContact + "]";
	}
		
}
