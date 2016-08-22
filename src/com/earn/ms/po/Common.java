package com.earn.ms.po;

import com.earn.ms.util.Util;

/**
 * 公共类
 * 
 * @author Administrator
 * 
 */
public class Common {

	private String id;
	private String name;
	private String username;
	private String dept;
	private String lasttime;
	private String time;//时间
	private String date;//日期
	private String endTime = Util.DateTime("yyyy-MM-dd");
	private String startTime = Util.WeekTime();
	private String search;
	private String statues;// 状态
	private String ordertype;
	private int gtype;//分组查询 例如1.广告2.时间
	
	
	private String ydprovince;//移动要求的省份
	private String ltprovince;//联通要求的省份
	private String dxprovince;//电信要求的省份
	private int ydputtype;//移动推行要求（0：全国推行 1：屏蔽 2：投放）
	private int ltputtype;//联通推行要求 0：全国推行 1：屏蔽 2：投放
	private int dxputtype;//电信推行要求 0：全国推行 1：屏蔽 3：投放
	

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getGtype() {
		return gtype;
	}

	public void setGtype(int gtype) {
		this.gtype = gtype;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getYdprovince() {
		return ydprovince;
	}

	public void setYdprovince(String ydprovince) {
		this.ydprovince = ydprovince;
	}

	public String getLtprovince() {
		return ltprovince;
	}

	public void setLtprovince(String ltprovince) {
		this.ltprovince = ltprovince;
	}

	public String getDxprovince() {
		return dxprovince;
	}

	public void setDxprovince(String dxprovince) {
		this.dxprovince = dxprovince;
	}

	public int getYdputtype() {
		return ydputtype;
	}

	public void setYdputtype(int ydputtype) {
		this.ydputtype = ydputtype;
	}

	public int getLtputtype() {
		return ltputtype;
	}

	public void setLtputtype(int ltputtype) {
		this.ltputtype = ltputtype;
	}

	public int getDxputtype() {
		return dxputtype;
	}

	public void setDxputtype(int dxputtype) {
		this.dxputtype = dxputtype;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getLasttime() {
		return lasttime;
	}

	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getOrdertype() {
		return ordertype;
	}

	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}

	public String getStatues() {
		return statues;
	}

	public void setStatues(String statues) {
		this.statues = statues;
	}

}
