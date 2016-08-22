package com.earn.ms.po;

import java.math.BigDecimal;

/**
 * 精品广告类
 * 
 * @author Link
 *
 */
public class BoutiqueAds extends Common {
	
	private BigDecimal price;// 价格
	private String devicetype;// 设备类型
	private String keyword;// 关键词
	private String icon;// logo
	private String packagename;// 包名
	private String jumpurl;// 跳转路径(下载还是链接)
	private String imgurl;//图片路径
	private int adsindex;// 索引
	
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getDevicetype() {
		return devicetype;
	}
	public void setDevicetype(String devicetype) {
		this.devicetype = devicetype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getPackagename() {
		return packagename;
	}
	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}
 
	public String getJumpurl() {
		return jumpurl;
	}
	public void setJumpurl(String jumpurl) {
		this.jumpurl = jumpurl;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public int getAdsindex() {
		return adsindex;
	}
	public void setAdsindex(int adsindex) {
		this.adsindex = adsindex;
	}
	@Override
	public String toString() {
		return "Boutique [price=" + price + ", devicetype=" + devicetype
				+ ", keyword=" + keyword + ", icon=" + icon + ", packagename="
				+ packagename + ", jumpurl=" + jumpurl + ", imgurl=" + imgurl
				+ ", adsindex=" + adsindex + "]";
	}
}
