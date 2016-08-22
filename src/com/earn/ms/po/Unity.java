package com.earn.ms.po;

/**
 * 临时参数类
 * 
 * @author Link
 *上下线产品，更新产品优先级的时候，需要更新 临时参数表对应的数据参数如下：
 *a_productlist_update ：android产品列表更新
 *i_productlist_update ：ios 产品列表更新
 *offline_ads_time：   实体广告更新列表
 *Boutique_ads_time_android： 精品广告安卓端更新列表
 *boutique_ads_time_ios： 精品广告ios广告列表
 */
public class Unity extends Common {
	private String keyname;//触发名称
	private String keyvalue;//值,不变
	private int createtimestp;//时间戳System.currentTimeMillis()/1000
	public String getKeyname() {
		return keyname;
	}
	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}
	public String getKeyvalue() {
		return keyvalue;
	}
	public void setKeyvalue(String keyvalue) {
		this.keyvalue = keyvalue;
	}
	public int getCreatetimestp() {
		return createtimestp;
	}
	public void setCreatetimestp(int createtimestp) {
		this.createtimestp = createtimestp;
	}

	
}
