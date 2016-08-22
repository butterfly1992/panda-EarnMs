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
<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css" media="screen" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 98px) {
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
<form class="form-inline definewidth m10" action="leuserM_list"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">用户名</td>
				<td>&nbsp;&nbsp;
				 <input type="text" name="leu.search" 
						placeholder="支付宝姓名/手机" value="${leu.search}" class="input-default"
						>
					</td>
			</tr>
			<tr>
				<td class="tablecenter">时间</td>
				<td>&nbsp;&nbsp;
					<div class="form-group">
						<div class="input-group date form_date" data-date=""
							data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text"
								name="leu.startTime" value="${leu.startTime }">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /><br />
					</div>&nbsp;&nbsp; 到&nbsp;&nbsp;
					<div class="form-group">
						<div class="input-group date form_date" data-date=""
							data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text"
								name="leu.endTime" value="${leu.endTime }">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /><br />
					</div>
				</td>
			</tr>
			 
			<tr>
				<td  class="tablecenter"></td>
				<td>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary search" type="button">查询</button>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-hover definewidth m10" id="tablecenter">
			<thead>
				<tr>
				<th>支付宝姓名</th>
				<th>支付宝账号</th>
				<th>手机号码</th>
				<th>取款密码</th>
				
				<th>微信ID</th>
				<th>群组账号</th>
				<th>父账号</th> 
				<th>注册时间</th>
				<th>状态</th>
				<th>操作</th>
				</tr>
			</thead>
		 
			<tbody>
				<s:iterator value="list" id="id">
					<tr onmousemove="this.style.background='#fdc98c'"
						onmouseout="this.style.background='#ffffff'" bgColor="#ffffff">
						 <td><s:property value="alipayname" /></td>
						<td><s:property value="alipay" /></td>
						<td><s:property value="phone" /></td>
						<td><s:property value="passwd" /></td>
						<td><s:property value="wechatid" /></td>
						<td><s:property value="groupuid" /></td>
						<td><s:property value="puid" /></td>
						<td><s:property value="singdate" /></td>
						 <td><s:property value="status" /></td>
						<td>
						<a href="leuserM_info?leu.uid=<s:property value="uid" />">
						<button type="button" class="btn btn-sm btn-primary">财务信息</button></a>
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
	<script type="text/javascript">
		$(function() {
			$('.form_date').datetimepicker({
				language : 'zh-CN',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0
			});
		});
	</script>
</body>
</html>
