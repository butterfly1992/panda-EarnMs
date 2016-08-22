package com.earn.ms.po;

import java.math.BigDecimal;

/**
 * 文章实体类
 * @author Link
 *
 */
public class Article extends Common {
	private int adsindex;//文章索引
	private String title;//标题
	private String article;//内容
	private String shareimg;//分享图片
	private String shareworld;//分享内容
	private BigDecimal price;//价格
	public int getAdsindex() {
		return adsindex;
	}
	public void setAdsindex(int adsindex) {
		this.adsindex = adsindex;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getShareimg() {
		return shareimg;
	}
	public void setShareimg(String shareimg) {
		this.shareimg = shareimg;
	}
	public String getShareworld() {
		return shareworld;
	}
	public void setShareworld(String shareworld) {
		this.shareworld = shareworld;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Article [adsindex=" + adsindex + ", title=" + title
				+ ", article=" + article + ", shareimg=" + shareimg
				+ ", shareworld=" + shareworld + ", price=" + price + "]";
	}
}
