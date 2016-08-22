package com.earn.ms.interceptor;

import java.util.Map;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 登录拦截器
 * @author Administrator
 *
 */
public class LoginInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = 1L;
	public static final String USER_SESSION_KEY = "loginU";
	public static final String GOING_TO_URL_KEY = "GOING_TO";


	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub

		ActionContext actionContext = invocation.getInvocationContext();

		Map<String, Object> session = actionContext.getSession();
		if (session.get(USER_SESSION_KEY) != null) {
			System.err.println();
			return invocation.invoke();// 递归调用拦截器
		} else {
			return "login";
		}
	}

}