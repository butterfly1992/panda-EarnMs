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
<title>Panda平台商务管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
	<table align="center">
		<tr>
			<td>
				<button type="button" class="btn btn-success" style="margin: 1.5em;">系统消息通知</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
	<div style="margin: 0em 6em 0 6em ">
		<table id="table" class="table table-bordered  definewidth m12">
			<tr>
				<th width="100%">&nbsp;</th>
			</tr>
			<tr>
				<td  style="height: 500px;background-color: #F5F5F5;">
				
				<h4 align="left" style="height: 411px;margin-left: 10em; ">
				<br/>
				
				</h4>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>