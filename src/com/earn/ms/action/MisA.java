package com.earn.ms.action;

import com.earn.ms.po.Mission;
import com.earn.ms.po.PageAction;
import com.earn.ms.util.Util;

/**
 * 任务Action
 * @author Administrator
 *
 */
public class MisA extends PageAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	final String table = "Mission";
	private Mission mis;
 
	
	//任务列表
	public String list() {
		search = Util.getSearch(table);
		if (mis == null) {
			mis = new Mission();
		}
		if (!Util.isNULL(mis.getSearch())) {
			search.put("search", mis.getSearch());
		}

		list = service.list(search, pageInfo);
		pageInfo.setTotalitems(service.listCount(search));
		return "list";

	}
 

	//增加任务
		public String add() {
			search = Util.getSearch(table);
			if (mis == null) {
				mis = new Mission();
			}
			mis.setId(Util.uuID());
			if(Util.isNULL(mis.getProid())){
				addActionError("产品ID为空！请重新填写！");
				return "add";
			}
			 if(!service.insert(mis)){
				 addActionError("任务添加失败！请重试！");
					return "add"; 
			 }
			return list();

		}
		
		//修改任务
		public String update() {
			search = Util.getSearch(table);
			if (mis == null) {
				mis = new Mission();
			}
			if(Util.isNULL(mis.getId())){
				addActionError("任务ID为空！请重新填写！");
				return "add";
			}
			if(Util.isNULL(mis.getProid())){
				addActionError("产品ID为空！请重新填写！");
				return "add";
			}
			 if(!service.update(mis)){
				 addActionError("任务修改失败！请重试！");
					return "update"; 
			 }
			return list();

		}
	//根据ID  查询任务
	public String query() {
		search = Util.getSearch(table);
		if (mis == null) {
			mis = new Mission();
		}
		if(Util.isNULL(mis.getProid())){
			return list();
		}
		if(Util.isNULL(mis.getId())){
			return list();
		}
		search.put("proid", mis.getProid());
		search.put("id", mis.getId());
		mis=(Mission) service.query(search, "query");
		return "update";
	}


	public Mission getMis() {
		return mis;
	}


	public void setMis(Mission mis) {
		this.mis = mis;
	}
}
