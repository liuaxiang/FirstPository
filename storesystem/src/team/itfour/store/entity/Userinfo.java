package team.itfour.store.entity;

import java.util.Date;

/**
 * 
 * @author gao
 *
 */
public class Userinfo {
	//用户编号
	private Integer userNo;
	//用户账号
	private String userName;
	//密码
	private String password;
	//真实姓名
	private String realName;
	//用户权限
	private String userPermissions;
	//电话号码
	private String userPhone;
	//用户住址
	private String userAddress;
	//用户邮箱
	private String userEmail;
	//注册日期
	private Date regDate;
	
	
	
	public Userinfo() {
		super();
	}



	public Userinfo(Integer userNo, String userName, String password, String realName, String userPermissions,
			String userPhone, String userAddress, String userEmail, Date regDate) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.userPermissions = userPermissions;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.regDate = regDate;
	}



	public Integer getUserNo() {
		return userNo;
	}



	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getRealName() {
		return realName;
	}



	public void setRealName(String realName) {
		this.realName = realName;
	}



	public String getUserPermissions() {
		return userPermissions;
	}



	public void setUserPermissions(String userPermissions) {
		this.userPermissions = userPermissions;
	}



	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	public String getUserAddress() {
		return userAddress;
	}



	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}



	@Override
	public String toString() {
		return "Userinfo [userNo=" + userNo + ", userName=" + userName + ", password=" + password + ", realName="
				+ realName + ", userPermissions=" + userPermissions + ", userPhone=" + userPhone + ", userAddress="
				+ userAddress + ", userEmail=" + userEmail + ", regDate=" + regDate + "]";
	}
	
	
}
