<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/page.js"></script>

</head>
<body>
	<div>
		<form class="form-inline definewidth m20" action="userM_list"
			method="post" id="form_page">
			<table class="searchtable">
				<tr>
					<td>筛选：<input type="text" name="user.name"
						placeholder="姓名/用户名/QQ" class="abc input-default">&nbsp;&nbsp;
					</td>
					<td>
						<button type="submit" class="btn btn-primary search">查询</button>&nbsp;&nbsp;
						<c:if test="${loginU.role eq 0}">
							<button type="button" class="btn btn-success"
								name="changebelongs" onclick="location.href='userM_add'">新增
							</button>
						</c:if>
					</td>
				</tr>
			</table>
			<div>
				<table id="table"
					class="table table-bordered table-hover definewidth m10">
					<thead>
						<tr>
							<th>姓名</th>
							<th>用户名</th>
							<th>部门</th>
							<th>权限</th>
							<th>操作</th>
						</tr>
					</thead>
					<s:iterator value="list">
						<tr>
							<td><s:property value="name" /></td>
							<td><s:property value="username" /></td>
							<td>${dept}</td>
							<td><s:if test="role==0">管理员</s:if> 
							<s:elseif test="role==1">普通用户</s:elseif>
							</td>
							<td><a href="userM_query.action?user.id=<s:property value="id"/>">编辑</a>
								<c:if test="${loginU.role eq 0}">
									<a style="cursor: pointer;"
										onclick="if(confirm('确定要删除吗？'))location.href='userM_delete.action?user.id=<s:property value='id'/>'">删除</a>
								</c:if></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			${pageInfo.pageFooter }
		</form>
	</div>
</body>
</html>