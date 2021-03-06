<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath()
			+ "/";
%>
<base href="<%=path%>" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<form action="userM_add.action" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tableleft">登录名</td>
				<td><input type="text" name="user.username" /></td>
			</tr>
			<tr>
				<td class="tableleft">姓名</td>
				<td><input type="text" name="user.name" /></td>
			</tr>
			<tr>
				<td class="tableleft">密码</td>
				<td><input type="password" name="user.password" /></td>
			</tr>
			<tr>
				<td class="tableleft">部门</td>
				<td> 
				<s:select name="user.department" list="list" listKey="id" listValue="dept" theme="simple"></s:select>
				</td>
			</tr>
			<tr>
				<td class="tableleft">权限</td>
				<td><select name="user.role" class="select">
						<option value="1">普通用户</option>
						<option value="0">管理员</option>
				</select></td>
			</tr>
			
			<tr>
				<td class="tableleft"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="返回" onclick="location.href='javascript:history.go(-1)'" class="btn btn-success">
					<button type="submit" class="btn btn-primary" type="button">新增</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>