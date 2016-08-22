package com.earn.ms.action;

import com.earn.ms.po.PageAction;
import com.earn.ms.po.Prostatistics;
import com.earn.ms.po.Redlog;
import com.earn.ms.po.Redstatistics;
import com.earn.ms.util.Util;

/**
 * 产品统计Action
 * @author Administrator
 *
 */
public class StatisticsA extends PageAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Prostatistics ps;
	private Redstatistics rs;
	private Redlog rls;
	final String table = "Statistics";

	// 产品统计
	public String prolist() {
		pageInfo.setPageSize(15);
		search = Util.getSearch(table);
		if (ps == null) {
			ps = new Prostatistics();
			ps.setStartTime("");
		}
		if (!Util.isNULL(ps.getSearch())) {
			search.put("search", ps.getSearch());
		}
		if (!Util.isNULL(ps.getStartTime())) {
			search.put("startTime", ps.getStartTime());
		}
		if (!Util.isNULL(ps.getEndTime())) {
			search.put("endTime", ps.getEndTime());
		}
		search.put("type", ps.getGtype());
		list = service.list(search, pageInfo, "prolist");
		pageInfo.setTotalitems(service.listCount(search, "prolistCount"));
		return "prolist";
	}

	// 红包统计
	public String redlist() {
		search = Util.getSearch(table);
		pageInfo.setPageSize(15);
		if (rs == null) {
			rs = new Redstatistics();
			rs.setStartTime("");
		}
		if (!Util.isNULL(rs.getSearch())) {
			search.put("search", rs.getSearch());
		}
		if (!Util.isNULL(rs.getStartTime())) {
			search.put("startTime", rs.getStartTime());
		}
		if (!Util.isNULL(rs.getEndTime())) {
			search.put("endTime", rs.getEndTime());
		}

		search.put("type", rs.getGtype());
		
		list = service.list(search, pageInfo, "redlist");
		pageInfo.setTotalitems(service.listCount(search, "redlistCount"));
		return "redlist";
	}
	// 红包日志统计
	public String redloglist() {
		search = Util.getSearch(table);
		pageInfo.setPageSize(15);
		if (rls == null) {
			rls = new Redlog();
			rls.setStartTime("");
		}
		if (!Util.isNULL(rls.getSearch())) {
			search.put("search", rls.getSearch());
		}
		if (!Util.isNULL(rls.getStartTime())) {
			search.put("startTime", rls.getStartTime());
		}
		if (!Util.isNULL(rls.getEndTime())) {
			search.put("endTime", rls.getEndTime());
		}
 
		list = service.list(search, pageInfo, "redloglist");
		pageInfo.setTotalitems(service.listCount(search, "redloglistCount"));
		return "redloglist";
	}
	public Prostatistics getPs() {
		return ps;
	}

	public void setPs(Prostatistics ps) {
		this.ps = ps;
	}

	public Redstatistics getRs() {
		return rs;
	}

	public void setRs(Redstatistics rs) {
		this.rs = rs;
	}

	public Redlog getRls() {
		return rls;
	}

	public void setRls(Redlog rls) {
		this.rls = rls;
	}
	
}
