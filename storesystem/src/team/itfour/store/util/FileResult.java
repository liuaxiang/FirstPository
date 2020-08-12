package team.itfour.store.util;

import java.io.Serializable;

//文件上传结果封装类
public class FileResult implements Serializable {

	/**
	 * * / 
	

  /**
	 * 文件名
	 */
	
	private static final long serialVersionUID = -4118483515928349479L;
	
	private String fileName;
	/**
	 * 扩展名
	 */
	private String extName;
	/**
	 * 文件大小，字节
	 */
	private Long fileSize;
	/**
	 * 文件存储在服务器的相对地址
	 */
	private String serverPath;
	private Boolean success = false;
	private String msg;

	public FileResult() {
		super();
	}

	public

	FileResult(Boolean success, String msg) {
		super();
		this.success = success;
		this.msg = msg;
	}

	public

	FileResult(String fileName, String extName, Long fileSize, String serverPath) {
		super();
		this.fileName = fileName;
		this.extName = extName;
		this.fileSize = fileSize;
		this.serverPath = serverPath;
	}

	/**
	 * @return 文件名
	 */
	public String getFileName() {
		return fileName;
	}

	public

	void setFileName(String fileName) {
	this.fileName = fileName;
	}/***@return 扩展名*/

	public String getExtName() {
	return extName;
	}

	public

	void setExtName(String extName) {
	this.extName = extName;
	}/***文件大小-字节**@return*/

	public Long getFileSize() {
	return fileSize;
	}

	public void setFileSize(Long fileSize) {
	this.fileSize = fileSize;
	}/****@return 文件存储在服务器的相对地址*/

	public String getServerPath() {
	return serverPath;
	}

	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;

	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
