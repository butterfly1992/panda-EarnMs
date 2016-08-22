package com.earn.ms.action;

import java.util.Map;

import com.earn.ms.po.Income;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;

/**
 * 赚用户收入Action
 * @author Administrator
 *
 */
public class IncomeA  extends PageAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Income inc;
	final String table = "Income";
	
	//查询列表
	public String list() {
		Map<String, Object> search = Util.getSearch(table);
		if (inc == null) {
			inc = new Income();
		}
		if (!Util.isNULL(inc.getSearch())) {
			search.put("searchs", inc.getSearch());
		}
		if (!Util.isNULL(inc.getStartTime())) {
			search.put("startTime", inc.getStartTime());
		}
		if (!Util.isNULL(inc.getEndTime())) {
			search.put("endTime", inc.getEndTime());
		}
        
		list = service.list(search, pageInfo, "list");
		pageInfo.setTotalitems(service.listCount(search, "listCount"));
		return "list";
	}
	
	
	
	
	public Income getInc() {
		return inc;
	}
	public void setInc(Income inc) {
		this.inc = inc;
	}
	
	
	
}
