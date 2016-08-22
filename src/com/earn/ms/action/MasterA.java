package com.earn.ms.action;

import com.earn.ms.po.Master;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;

/**
 * 师徒关系Action
 * 
 * @author Link
 *
 */
public class MasterA extends PageAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Master ma;
	final String table = "Master";

	/*
	 * 查询列表
	 */
	public String list() {
		search = Util.getSearch(table);
		if (ma == null) {
			ma = new Master();
		}
		search.put("search", ma.getSearch());

		list = service.list(search, pageInfo);
		pageInfo.setTotalitems(service.listCount(search));
		return "list";
	}

	public Master getMa() {
		return ma;
	}

	public void setMa(Master ma) {
		this.ma = ma;
	}

}
