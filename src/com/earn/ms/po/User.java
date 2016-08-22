package com.earn.ms.po;

/**
 * 后台登录用户类
 * 
 * @author Administrator
 * 
 */
public class User extends Common {
	private String image;
	private String password;
	private int role;//角色
	private int department;
	private int sign;//标识，（区分在职和离职或其他）
	private String lasttime;//最近登录时间
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLasttime() {
		return lasttime;
	}
	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public int getSign() {
		return sign;
	}
	public void setSign(int sign) {
		this.sign = sign;
	}
	
}
