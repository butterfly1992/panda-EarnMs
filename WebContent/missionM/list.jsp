<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath()
			+ "/";
%>
<base href="<%=path%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<form class="form-inline definewidth m10" action="misM_list"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">产品名</td>
				<td>&nbsp;&nbsp;
				 <input type="text" name="mis.search" 
						placeholder="产品名" value="${mis.search}" class="input-default">
					</td>
			</tr>
			<tr>
				<td  class="tablecenter"></td>
				<td>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-sm btn-primary search" type="button">查询</button>&nbsp;&nbsp;
				 <button type="button" onclick="location.href='missionM/add.jsp'" class="btn btn-sm btn-success" type="button">添加</button>&nbsp;&nbsp; 
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-hover definewidth m10" id="tablecenter">
			<thead>
				<tr>
				<th>产品名</th>
				<th>任务编号</th>
				<th>任务价格</th>
				<th>任务触发日期</th>
				<th>任务触发时间</th>
				<th>任务类型</th>
				<th>操作</th>
	 
				</tr>
			</thead>
		 
			<tbody>
				<s:iterator value="list">
					<tr onmousemove="this.style.background='#fdc98c'"
						onmouseout="this.style.background='#ffffff'" bgColor="#ffffff">
						 <td>${name}</td>
						 <td>${misindex}</td>
						 <td>${misprice}</td>
						 <td>${misdate}</td>
						 <td>${mistime}</td>
						 <td>${mistype}</td>
						 <td> 
						 <a href="misM_query?mis.proid=<s:property value="proid" />&mis.id=<s:property value="id" />">
						<button type="button" class="btn btn-sm btn-primary">任务修改</button></a>
						 </td>
					</tr>
				</s:iterator>
			</tbody>
			<tfoot>
				<tr onmousemove="this.style.background='#fdc98c'"
					onmouseout="this.style.background='#ffffff'" bgColor="#ffffff">
				</tr>
			</tfoot>
		</table>
		<script type="text/javascript" src="js/page.js"></script>
		${pageInfo.pageFooter }
	</form>
</body>
</html>
