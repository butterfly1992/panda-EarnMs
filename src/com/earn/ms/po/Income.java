package com.earn.ms.po;

/**
 * 收入类
 * 
 * @author Administrator
 * 
 */
public class Income extends Common {
	// LE_MIS_DRI_EXP_COMP  收入明细表
	private String misid;// 任务ID
	private String uid;// 用户id
	private String dedate;// 明细日期
	private String detime;// 明细时间
	private String dedesc;// 明细描述
	private double deincome;// 收入
	private String proid;// 产品id
	private String proicon;// 产品logo
	private String puid;// 父id

	// LE_USERINCOME   收入统计表
	private String lastincome;// 上次收入日期
	private double totalincome;// 全部收入
	private double totalpay;// 全部支出
	private double dayicm;// 日收入
	private double monthicm;// 月收入
	private double yearicm;// 年收入
	private double inviteincme;// 邀请收入
	private double redpackage;// 红包收入
	private double misincom;// 任务收入

	public String getMisid() {
		return misid;
	}

	public void setMisid(String misid) {
		this.misid = misid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getDedate() {
		return dedate;
	}

	public void setDedate(String dedate) {
		this.dedate = dedate;
	}

	public String getDetime() {
		return detime;
	}

	public void setDetime(String detime) {
		this.detime = detime;
	}

	public String getDedesc() {
		return dedesc;
	}

	public void setDedesc(String dedesc) {
		this.dedesc = dedesc;
	}

	public double getDeincome() {
		return deincome;
	}

	public void setDeincome(double deincome) {
		this.deincome = deincome;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getProicon() {
		return proicon;
	}

	public void setProicon(String proicon) {
		this.proicon = proicon;
	}

	public String getPuid() {
		return puid;
	}

	public void setPuid(String puid) {
		this.puid = puid;
	}

	public String getLastincome() {
		return lastincome;
	}

	public void setLastincome(String lastincome) {
		this.lastincome = lastincome;
	}

	public double getTotalincome() {
		return totalincome;
	}

	public void setTotalincome(double totalincome) {
		this.totalincome = totalincome;
	}

	public double getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(double totalpay) {
		this.totalpay = totalpay;
	}

	public double getDayicm() {
		return dayicm;
	}

	public void setDayicm(double dayicm) {
		this.dayicm = dayicm;
	}

	public double getMonthicm() {
		return monthicm;
	}

	public void setMonthicm(double monthicm) {
		this.monthicm = monthicm;
	}

	public double getYearicm() {
		return yearicm;
	}

	public void setYearicm(double yearicm) {
		this.yearicm = yearicm;
	}

	public double getInviteincme() {
		return inviteincme;
	}

	public void setInviteincme(double inviteincme) {
		this.inviteincme = inviteincme;
	}

	public double getRedpackage() {
		return redpackage;
	}

	public void setRedpackage(double redpackage) {
		this.redpackage = redpackage;
	}

	public double getMisincom() {
		return misincom;
	}

	public void setMisincom(double misincom) {
		this.misincom = misincom;
	}
}
