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
<form class="form-inline definewidth m10" action="statiM_redlist"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">产品名</td>
				<td>&nbsp;&nbsp;
				  <input type="text" name="rs.search"  placeholder="产品名" value="${rs.search}" class="input-default">
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
								name="rs.startTime" value="${rs.startTime }">
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
								name="rs.endTime" value="${rs.endTime }">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /><br />
					</div>
				</td>
			</tr>
			<%--  <tr>
				<td width="10%" class="tablecenter">类型</td>
				<td>&nbsp;&nbsp;
				<s:radio name="gtype" list="#{'1':'精品广告','2':'实体广告','3':'文章分享 '}" value="gtype" theme="simple"></s:radio>
				</td>
			</tr> --%>
			<tr>
				<td width="10%" class="tablecenter">分组查询</td>
				<td>&nbsp;&nbsp;
				<s:radio name="rs.gtype" list="#{'0':'默认','1':'广告/文章','2':'时间'}" value="rs.gtype" theme="simple"></s:radio>
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
				<tr><c:if test="${rs.gtype eq 0 or rs.gtype eq 2}">
				<th>日期</th>
				</c:if><c:if test="${rs.gtype eq 0 or rs.gtype eq 1}">
				<th>产品名/文章标题</th></c:if>
				<th>展示量</th>
				<th>点击量</th>
				</tr>
			</thead>
		    <s:set name="show" value="0" />
			<s:set name="click" value="0" />
			<tbody>
			<s:iterator value="list" id="id">
					<s:set name="show" value="#show+showcounts" />
					<s:set name="click" value="#click+clickdown" />
					<tr><c:if test="${rs.gtype eq 0 or rs.gtype eq 2}">
						 <td>${date}</td>
						 </c:if><c:if test="${rs.gtype eq 0 or rs.gtype eq 1}">
						 <td>${name}</td></c:if>
						 <td>${showcounts}</td>
						 <td>${clickdown}
						 <span style="color: red;">
						 (<c:if test="${clickdown eq 0 }">0%</c:if>
						  <c:if test="${clickdown gt 0 }">
						   <fmt:formatNumber type='percent' value="${clickdown/showcounts}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
						 </td>
					</tr>
				</s:iterator>
			</tbody>
			<tfoot>
				<tr>
					<td class="tablecenter text-danger"
					<c:if test="${rs.gtype eq 0}">colspan="2"</c:if>
					>小计</td>
					<td class="tablecenter text-success">${show }</td>
					<td class="tablecenter text-success">${click }
					<span style="color: red;">
						 (<c:if test="${click eq 0 }">0%</c:if>
						  <c:if test="${click gt 0 }">
						   <fmt:formatNumber type='percent' value="${click/show}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
					</td>
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
