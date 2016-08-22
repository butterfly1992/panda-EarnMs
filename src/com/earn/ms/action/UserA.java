package com.earn.ms.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.earn.ms.interceptor.LoginInterceptor;
import com.earn.ms.po.PageAction;
import com.earn.ms.po.User;
import com.earn.ms.util.MD5;
import com.earn.ms.util.Util;
import com.opensymphony.xwork2.Action;

/**
 * 用户Action
 * 
 * @author Administrator
 * 
 */
public class UserA extends PageAction {
	private static final long serialVersionUID = 1L;
	private User user;
	private String goingToURL;

	// 用户登录验证
	public String login() {
		search = Util.getSearch("User");
		search.put("username", user.getUsername());
		search.put("password", MD5.MD5Encode(user.getPassword()));
		if (session != null) {
			session.clear();// 清徐 session
		}
		try {
			User u = (User) service.validate(search);
			if (u == null) {
				addActionMessage("账号信息输入有误！或无管理权限！");
				return INPUT;
			}
			session.remove("ERROR");
			session.put(LoginInterceptor.USER_SESSION_KEY, u);
			String goingToURL = (String) session
					.get(LoginInterceptor.GOING_TO_URL_KEY);

			service.update(u);
			if (StringUtils.isNotBlank(goingToURL)) {
				setGoingToURL(goingToURL);
				session.remove(LoginInterceptor.GOING_TO_URL_KEY);
			} else {
				setGoingToURL("index.jsp");
			}
			return Action.SUCCESS;
		} catch (Exception e) {
			return INPUT;
		}
	}

	public String exit() {
		session.clear();
		return INPUT;
	}

	public String updInfo() {
		search = Util.getSearch("User");
		User u = (User) session.get(
				LoginInterceptor.USER_SESSION_KEY);
		if (user == null) {
			user = new User();
		}
		if (!Util.isNULL(user.getPassword())) {
			user.setPassword(MD5.MD5Encode(user.getPassword()));
		} else {
			user.setPassword(null);
		}
		if (u.getRole() != 0) {
			user.setRole(u.getRole());
			user.setDepartment(u.getDepartment());
		}

		if (service.update(user)) {
			if (u.getId().equals(user.getId())) {// 更新session
				search.put("id", u.getId());
				request.getSession().removeAttribute(
						LoginInterceptor.USER_SESSION_KEY);
				list = service.list(search, pageInfo, "list");
				if (list != null) {
					setUser((User) list.get(0));
				}
				session.put(LoginInterceptor.USER_SESSION_KEY, user);
			}
			return list();
		} else
			return "userM_info";
	}

	public String query() {
		search = Util.getSearch("User");
		search.put("id", user.getId());
		user = (User) service.list(search, pageInfo, "list").get(0);
		list = service.list(search, null, "deptlist");

		return "userM_info";
	}

	public String delete() {
		Map<String, Object> search = Util.getSearch("User");
		if (!Util.isNULL(user.getId())) {
			search.put("id", user.getId());
		}
		service.delete(search);
		return list();
	}

	public String add() {
		search = Util.getSearch("User");
		if (user == null) {
			list = service.list(search, null, "deptlist");
			return "userM_add";
		}
		user.setPassword(MD5.MD5Encode(user.getPassword()));
		if (service.insert(user)) {
			user = null;
			return list();
		}
		return "userM_add";
	}

	public String list() {
		search = Util.getSearch("User");
		User u = (User) request.getSession().getAttribute(
				LoginInterceptor.USER_SESSION_KEY);
		if (user == null) {
			user = new User();
		}
		if (u.getRole() != 0) {
			search.put("id", u.getId());
		}
		if (!Util.isNULL(user.getName())) {
			search.put("name", user.getName());
		}
		dlist.put("dept", service.list(search, null, "deptlist"));
		list = service.list(search, pageInfo, "list");
		pageInfo.setTotalitems(service.listCount(search, "listCount"));
		return "userM_list";
	}

	public String getGoingToURL() {
		return goingToURL;
	}

	public void setGoingToURL(String goingToURL) {
		this.goingToURL = goingToURL;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

}
