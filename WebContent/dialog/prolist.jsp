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
<title>产品列表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/page.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('input').placeholder();
	});
	function select(sel){
	sel.bgcolor="gray";
	sel.childNodes[1].childNodes[0].checked="checked";
	}
	function sendTo() { 
		 var names = document.getElementsByName("select")
	 	 for (var i=0; i<names.length; i++){
	 		 if(names[i].checked){
	 			returnValue = names[i].value.split(",");
	 			if(navigator.userAgent.indexOf("MSIE") != -1) {//IE浏览器
	            if (window.opener != undefined) {
					window.opener.returnValue = returnValue;
				 } else {
					window.returnValue = returnValue;
				 }
				 }else{//其他浏览器
	 			 window.opener.document.getElementById("proname").value=returnValue[1];
				 window.opener.document.getElementById("misid").value=returnValue[0];
				 }
				window.close();
				return ;
	 		 }
	 	 }
	 	alert('请选择');
	} 
</script>
</head>
<body>
	<div>
		<form class="form-inline definewidth m20" action="proadsM_dialog"
			method="post" id="form_page">
			<table class="searchtable">
				<tr>
					<td>筛选：<input type="text" name="ad.search" 
						placeholder="产品名" value="${ad.search}" class="input-default">&nbsp;&nbsp;
					</td>
					<td>
						<button type="submit" class="btn btn-primary search">查询</button>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			<table id="tablecenter"
				class="table table-bordered table-hover definewidth m10">
				<thead>
					<tr>
						<th></th>
						<th>产品名</th>
						<th>包名</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list">
						<tr onclick="javaScript:select(this);">
							<td><input type="radio" name="select" value="${id},${proname}" /></td>
							<td><s:property value="proname" /></td>
							<td><s:property value="packagename" /></td>
						</tr>
					</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3"><button type="button" class="btn btn-success" onclick="sendTo()">确定</button></td>
					</tr>
				</tfoot>
			</table>
			${pageInfo.pageFooter }
		</form>
	</div>
</body>
</html>
