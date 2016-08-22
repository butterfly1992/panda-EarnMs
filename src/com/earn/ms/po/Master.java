package com.earn.ms.po;

import java.math.BigDecimal;
/**
 * 师徒 关系
 * @author Link
 *
 */
public class Master extends Common {

	private int uid;// 用户id
	private int puid;// 父id
	private BigDecimal income;// 收入
	private String uicon;// 子节点头像
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPuid() {
		return puid;
	}
	public void setPuid(int puid) {
		this.puid = puid;
	}
	public BigDecimal getIncome() {
		return income;
	}
	public void setIncome(BigDecimal income) {
		this.income = income;
	}
	public String getUicon() {
		return uicon;
	}
	public void setUicon(String uicon) {
		this.uicon = uicon;
	}
	
}
