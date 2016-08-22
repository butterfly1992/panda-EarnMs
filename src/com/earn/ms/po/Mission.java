package com.earn.ms.po;

import java.math.BigDecimal;

/**
 * 任务类
 * 
 * @author Link
 *
 */
public class Mission extends Common {

	private int misindex;//任务编号
	private String proid;// )产品id
	private BigDecimal misprice;// 任务价格
	private String misdesc;// 任务描述
	private String misdate;// 任务触发日期0表示安装当天，1表示安装下一天，一次类推
	private String mistime;// 任务触发时间:5表示试玩5分钟，在线五分钟，也可能表示其他，如升2级，玩2局之类的
	private String mistype;// 任务类型0表示在线时长、1玩的局数、2升级书、3累计积分数，4注册等
	private String misverify;// 验证URL
	
	public int getMisindex() {
		return misindex;
	}
	public void setMisindex(int misindex) {
		this.misindex = misindex;
	}
	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
	}
	public BigDecimal getMisprice() {
		return misprice;
	}
	public void setMisprice(BigDecimal misprice) {
		this.misprice = misprice;
	}
	public String getMisdesc() {
		return misdesc;
	}
	public void setMisdesc(String misdesc) {
		this.misdesc = misdesc;
	}
	public String getMisdate() {
		return misdate;
	}
	public void setMisdate(String misdate) {
		this.misdate = misdate;
	}
	public String getMistime() {
		return mistime;
	}
	public void setMistime(String mistime) {
		this.mistime = mistime;
	}
	public String getMistype() {
		return mistype;
	}
	public void setMistype(String mistype) {
		this.mistype = mistype;
	}
	public String getMisverify() {
		return misverify;
	}
	public void setMisverify(String misverify) {
		this.misverify = misverify;
	}
	@Override
	public String toString() {
		return "Mission [misindex=" + misindex + ", proid=" + proid
				+ ", misprice=" + misprice + ", misdesc=" + misdesc
				+ ", misdate=" + misdate + ", mistime=" + mistime
				+ ", mistype=" + mistype + ", misverify=" + misverify + "]";
	}

	
}
