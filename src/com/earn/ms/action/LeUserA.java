package com.earn.ms.action;

import java.util.Map;

import com.earn.ms.interceptor.LoginInterceptor;
import com.earn.ms.po.Income;
import com.earn.ms.po.LeUser;
import com.earn.ms.po.PageAction;
import com.earn.ms.po.User;
import com.earn.ms.util.Util;

/**
 * 用户Action
 * 
 * @author Administrator
 * 
 */
public class LeUserA extends PageAction {
	private static final long serialVersionUID = 1L;
	private LeUser leu;
	private Income inc;
	final String table = "LeUser";
	
	/**
	 * 用户列表
	 * 
	 * @return
	 */
	public String list() {
		Map<String, Object> search = Util.getSearch(table);
		if (leu == null) {
			leu = new LeUser();
			leu.setStartTime("");
		}
		if (!Util.isNULL(leu.getSearch())) {
			search.put("search", leu.getSearch());
		}
		if (!Util.isNULL(leu.getStartTime())) {
			search.put("startTime", leu.getStartTime());
		}
		if (!Util.isNULL(leu.getEndTime())) {
			search.put("endTime", leu.getEndTime());
		}
 
		list = service.list(search, pageInfo, "list");
		pageInfo.setTotalitems(service.listCount(search, "listCount"));
		return "list";
	}
	/**
	 * 查询用户信息
	 * @return
	 */
	public String info() {
		Map<String, Object> search = Util.getSearch(table);
		pageInfo.setPageSize(10);
		if (leu == null) {
			leu = new LeUser();
		}
		search.put("uid", leu.getUid());
        leu=(LeUser) service.query(search, "userInfo");
        inc=(Income) service.query(search, "userIncome");
		list = service.list(search, pageInfo, "incInfo");
		pageInfo.setTotalitems(service.listCount(search, "incInfoCount"));
		return "info";
	}
	/**
	 * 修改 用户信息
	 * 
	 * @return
	 */
	public String update() {
		if (leu == null) {
			addActionError("修改失败！请重试！");
			return info();
		}
		 
		if (service.update(leu)) {
			leu=null;
			return list();
		} else{
			addActionError("修改失败！请重试！");
			return info();
		}
			
	}

	/**
	 * 用户详细信息
	 * 
	 * @return
	 */
	public String query() {
		Map<String, Object> search = Util.getSearch(table);
		search.put("id", leu.getPuid());
		list = service.list(search, pageInfo, "list");
		if (list != null) {
			setLeu((LeUser) list.get(0));
		}
		return "userM_info";
	}

	/**
	 * 收入详细列表
	 * 
	 * @return
	 */
	public String incomelist() {
		Map<String, Object> search = Util.getSearch(table);
		User u = (User) request.getSession().getAttribute(
				LoginInterceptor.USER_SESSION_KEY);
		if (leu == null) {
			leu = new LeUser();
		}
		if (u.getRole() != 0) {
			search.put("id", u.getId());
		}
		if (!Util.isNULL(leu.getPhone())) {
			search.put("phone", leu.getPhone());
		}
	 
		list = service.list(search, pageInfo, "list");
		pageInfo.setTotalitems(service.listCount(search, "listCount"));
		return "userM_list";
	}

	/**
	 * 师徒关系列表
	 * 
	 * @return
	 */
	public String masterlist() {
		Map<String, Object> search = Util.getSearch(table);
		User u = (User) request.getSession().getAttribute(
				LoginInterceptor.USER_SESSION_KEY);
		if (leu == null) {
			leu = new LeUser();
		}
		if (u.getRole() != 0) {
			search.put("id", u.getId());
		}
		if (!Util.isNULL(leu.getPhone())) {
			search.put("phone", leu.getPhone());
		}
 
		list = service.list(search, pageInfo, "list");
		pageInfo.setTotalitems(service.listCount(search, "listCount"));
		return "userM_list";
	}

	/**
	 * 取款历史记录
	 * 
	 * @return
	 */
	public String remitlist() {
		Map<String, Object> search = Util.getSearch(table);
		User u = (User) request.getSession().getAttribute(
				LoginInterceptor.USER_SESSION_KEY);
		if (leu == null) {
			leu = new LeUser();
		}
		if (u.getRole() != 0) {
			search.put("id", u.getId());
		}
		if (!Util.isNULL(leu.getPhone())) {
			search.put("phone", leu.getPhone());
		}
	 
		list = service.list(search, pageInfo, "list");
		pageInfo.setTotalitems(service.listCount(search, "listCount"));
		return "userM_list";
	}
	public LeUser getLeu() {
		return leu;
	}
	public void setLeu(LeUser leu) {
		this.leu = leu;
	}
	public Income getInc() {
		return inc;
	}
	public void setInc(Income inc) {
		this.inc = inc;
	}
}
