package com.earn.ms.po;
/**
 * 产品 统计
 * @author Link
 *
 */
public class Prostatistics extends Common{
 
	private int viewcount;//查看数量
	private int downloadcount;//下载数量
	private int downcomplate;//下载完成数量
	private int installcount;//安装数量
	private int fristmission;//第一次完成任务量
	
	
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getDownloadcount() {
		return downloadcount;
	}
	public void setDownloadcount(int downloadcount) {
		this.downloadcount = downloadcount;
	}
	public int getDowncomplate() {
		return downcomplate;
	}
	public void setDowncomplate(int downcomplate) {
		this.downcomplate = downcomplate;
	}
	public int getInstallcount() {
		return installcount;
	}
	public void setInstallcount(int installcount) {
		this.installcount = installcount;
	}
	public int getFristmission() {
		return fristmission;
	}
	public void setFristmission(int fristmission) {
		this.fristmission = fristmission;
	}
 
}
