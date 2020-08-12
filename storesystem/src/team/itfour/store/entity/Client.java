package team.itfour.store.entity;
/**
 * 
 * @author gao
 *
 */
public class Client {
	//客户编号
	private Integer clientNo;
	//客户名称
	private String clientName;
	//客户电话
	private String clientPhone;
	//客户地址
	private String clientAddress;
	//客户邮箱
	private String clientEmail;
	//客户昵称
	private String nickName;
	public Integer getClientNo() {
		return clientNo;
	}
	public void setClientNo(Integer clientNo) {
		this.clientNo = clientNo;
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
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Client(Integer clientNo, String clientName, String clientPhone, String clientAddress, String clientEmail,
			String nickName) {
		super();
		this.clientNo = clientNo;
		this.clientName = clientName;
		this.clientPhone = clientPhone;
		this.clientAddress = clientAddress;
		this.clientEmail = clientEmail;
		this.nickName = nickName;
	}
	public Client() {
		super();
	}
	@Override
	public String toString() {
		return "Client [clientNo=" + clientNo + ", clientName=" + clientName + ", clientPhone=" + clientPhone
				+ ", clientAddress=" + clientAddress + ", clientEmail=" + clientEmail + ", nickName=" + nickName + "]";
	}
	
}
