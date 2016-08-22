package com.earn.ms.po;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.earn.ms.service.Service;
import com.earn.ms.util.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 公共服务类
 * @author Link
 *
 */
public class PageAction extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware {
 
	private static final long serialVersionUID = 1L;
	protected Service service;
	protected List<Object> list = new ArrayList<Object>();
	protected List<Object> listMap;
	protected PageInfo pageInfo = new PageInfo();
	protected Map<String, Object> search=new HashMap<String, Object>();
	protected Map<String, Object> dlist=new HashMap<String, Object>();
	protected Map<String, Object> session;

	protected HttpServletRequest request;
	protected HttpServletResponse response;

	
	public Map<String, Object> getDlist() {
		return dlist;
	}

	public void setDlist(Map<String, Object> dlist) {
		this.dlist = dlist;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public List<Object> getList() {
		return list;
	}

	public List<Object> getListMap() {
		return listMap;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public Map<String, Object> getSearch() {
		return search;
	}

	public void setSearch(Map<String, Object> search) {
		this.search = search;
	}
}
