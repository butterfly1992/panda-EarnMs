package com.earn.ms.po;

/**
 * 实体广告
 * 
 * @author Link
 *
 */
public class EntityAds extends Common {

	// 实体广告
	private int adsindex;// 广告索引
	private String url;// 路径
	private String imgurl;// 图片路径
	private double adsprice;// 广告价格

	public int getAdsindex() {
		return adsindex;
	}

	public void setAdsindex(int adsindex) {
		this.adsindex = adsindex;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public double getAdsprice() {
		return adsprice;
	}

	public void setAdsprice(double adsprice) {
		this.adsprice = adsprice;
	}

 

}
