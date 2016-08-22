package com.earn.ms.po;
/**
 * 用户实体类
 * @author Link
 *
 */
public class LeUser extends Common {
	private String uid;
	private String phone;
	private String passwd;
	private String alipay ;
	private String alipayname ;
	private String  singdate ;
	private int puid;
	private String  wechatid ;
	private int groupuid ;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getAlipay() {
		return alipay;
	}
	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}
	public String getAlipayname() {
		return alipayname;
	}
	public void setAlipayname(String alipayname) {
		this.alipayname = alipayname;
	}
	public String getSingdate() {
		return singdate;
	}
	public void setSingdate(String singdate) {
		this.singdate = singdate;
	}
	public int getPuid() {
		return puid;
	}
	public void setPuid(int puid) {
		this.puid = puid;
	}
	public String getWechatid() {
		return wechatid;
	}
	public void setWechatid(String wechatid) {
		this.wechatid = wechatid;
	}
	public int getGroupuid() {
		return groupuid;
	}
	public void setGroupuid(int groupuid) {
		this.groupuid = groupuid;
	}
	
  
}
