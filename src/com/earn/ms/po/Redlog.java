package com.earn.ms.po;
/**
 * 红包描述实体类
 * @author Link
 *
 */
public class Redlog extends Common{
	
	private String packagedesc;
	private String  packageprice;
    private String  packagetype;
    private String alipayname;
	public String getPackagedesc() {
		return packagedesc;
	}
	public void setPackagedesc(String packagedesc) {
		this.packagedesc = packagedesc;
	}
	public String getPackageprice() {
		return packageprice;
	}
	public void setPackageprice(String packageprice) {
		this.packageprice = packageprice;
	}
	public String getPackagetype() {
		return packagetype;
	}
	public void setPackagetype(String packagetype) {
		this.packagetype = packagetype;
	}
	public String getAlipayname() {
		return alipayname;
	}
	public void setAlipayname(String alipayname) {
		this.alipayname = alipayname;
	}
}
