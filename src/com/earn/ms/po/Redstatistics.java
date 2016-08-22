package com.earn.ms.po;
/**
 * 红包 统计
 * @author Link
 *
 */
public class Redstatistics extends Common{
 
	private int showcounts;//展示量
	private int clickdown;//点击量
	
	public int getShowcounts() {
		return showcounts;
	}
	public void setShowcounts(int showcounts) {
		this.showcounts = showcounts;
	}
	public int getClickdown() {
		return clickdown;
	}
	public void setClickdown(int clickdown) {
		this.clickdown = clickdown;
	}
	
}
