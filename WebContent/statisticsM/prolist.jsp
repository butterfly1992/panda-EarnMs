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
<form class="form-inline definewidth m10" action="statiM_prolist"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">产品名</td>
				<td>&nbsp;&nbsp;
				  <input type="text" name="ps.search"  placeholder="产品名" value="${ps.search}" class="input-default">
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
								name="ps.startTime" value="${ps.startTime }">
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
								name="ps.endTime" value="${ps.endTime }">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /><br />
					</div>
				</td>
			</tr>
			 <tr>
				<td width="10%" class="tablecenter">分组查询</td>
				<td>&nbsp;&nbsp;
				<s:radio name="ps.gtype" list="#{'0':'默认','1':'产品','2':'时间'}" value="ps.gtype" theme="simple"></s:radio>
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
				<c:if test="${ps.gtype eq 0 or ps.gtype eq 2 }">
				<th>日期</th>
				</c:if><c:if test="${ps.gtype eq 0 or ps.gtype eq 1 }">
				<th>产品名</th></c:if>
				<th>查看量</th>
				<th>下载量</th>
				<th>下载完成量</th>
				<th>安装量</th>
				<th>第一次完成任务量</th>
				</tr>
			</thead>
			<s:set name="view" value="0" />
			<s:set name="down" value="0" />
			<s:set name="ins" value="0" />
			<s:set name="downc" value="0" />
			<s:set name="first" value="0" />
			<tbody>
				<s:iterator value="list" id="id">
					<s:set name="view" value="#view+viewcount" />
					<s:set name="down" value="#down+downloadcount" />
					<s:set name="ins" value="#ins+installcount" />
					<s:set name="downc" value="#downc+downcomplate" />
					<s:set name="first" value="#first+fristmission" />
					<tr><c:if test="${ps.gtype eq 0 or ps.gtype eq 2 }">
						 <td>${date}</td>
						 </c:if><c:if test="${ps.gtype eq 0 or ps.gtype eq 1 }">
						 <td>${name}</td></c:if>
						 <td>${viewcount}</td>
						 <td>${downloadcount}
						 <span style="color: red;">
						 (<c:if test="${downloadcount eq 0 }">0%</c:if>
						  <c:if test="${downloadcount gt 0 }">
						   <fmt:formatNumber type='percent' value="${downloadcount/viewcount}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
						 </td>
						 <td>${downcomplate}
						 <span style="color: red;">
						 (<c:if test="${downcomplate eq 0 }">0%</c:if>
						  <c:if test="${downcomplate gt 0 }">
						   <fmt:formatNumber type='percent' value="${downcomplate/downloadcount}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
						 </td>
						 <td>${installcount}
						 <span style="color: red;">
						 (<c:if test="${installcount eq 0 }">0%</c:if>
						  <c:if test="${installcount gt 0 }">
						   <fmt:formatNumber type='percent' value="${installcount/downcomplate}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
						 </td>
						 
						 <td>${fristmission}</td>
					</tr>
				</s:iterator>
			</tbody>
			<tfoot>
				<tr>
					<td class="tablecenter text-danger" 
					<c:if test="${ps.gtype eq 0}">colspan="2"</c:if>
					>小计</td>
					<td class="tablecenter text-success">${view }</td>
					<td class="tablecenter text-success">${down }
					<span style="color: red;">
						 (<c:if test="${down eq 0 }">0%</c:if>
						  <c:if test="${down gt 0 }">
						   <fmt:formatNumber type='percent' value="${down/view}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
					</td>
					<td class="tablecenter text-success">${downc }
					<span style="color: red;">
						 (<c:if test="${downc eq 0 }">0%</c:if>
						  <c:if test="${downc gt 0 }">
						   <fmt:formatNumber type='percent' value="${downc/down}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
					</td>
					<td class="tablecenter text-success">${ins }
					<span style="color: red;">
						 (<c:if test="${ins eq 0 }">0%</c:if>
						  <c:if test="${ins gt 0 }">
						   <fmt:formatNumber type='percent' value="${ins/downc}" 
						   maxFractionDigits="2"></fmt:formatNumber></c:if>)</span>
					</td>
					
					<td class="tablecenter text-success">${first }</td>
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
