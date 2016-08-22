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
<form class="form-inline definewidth m10" action="proadsM_list"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">产品名</td>
				<td>&nbsp;&nbsp;
				 <input type="text" name="ad.search" 
						placeholder="产品名" value="${ad.search}" class="input-default">
					</td>
			</tr>
			<tr>
				<td width="10%" class="tablecenter">平台类型</td>
				<td>&nbsp;&nbsp;
				     <s:radio name="ad.protype" list="#{'default':'默认','ios':'苹果','android':'安卓'}" value="ad.protype" theme="simple"></s:radio>
				</td>
			</tr>
			<tr>
				<td width="10%" class="tablecenter">状态</td>
				<td>&nbsp;&nbsp;
				     <s:radio name="ad.prostatues" list="#{'default':'默认','on':'上线','off':'下线'}" value="ad.prostatues" theme="simple"></s:radio>
				</td>
			</tr>
			<tr>
				<td  class="tablecenter"></td>
				<td>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-sm btn-primary search" type="button">查询</button>&nbsp;&nbsp;
				 <button type="button" onclick="location.href='proadsM/upload.jsp'" class="btn btn-sm btn-success" type="button">添加</button>&nbsp;&nbsp; 
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-hover definewidth m10" id="tablecenter">
			<thead>
				<tr>
				<th>产品名称</th>
				<th>产品大小</th>
				<th>产品索引</th>
				<th>优先级</th>
				<th>总金额</th>
				<th>限制推广量</th> 
				<th>平台类型</th>
				<th>状态</th>
				<th>操作</th>
				</tr>
			</thead>
		 
			<tbody>
				<s:iterator value="list" id="id">
					<tr onmousemove="this.style.background='#fdc98c'"
						onmouseout="this.style.background='#ffffff'" bgColor="#ffffff">
						 <td><s:property value="proname" /></td>
						<td><s:property value="prosize" /></td>
						<td><s:property value="proindex" /></td>
						<td><s:property value="propri" /></td>
						<td><s:property value="proprice" /></td>
						<td><s:property value="puplimit" /></td>
						<td><s:property value="protype" /></td>
						<td><s:if test="prostatues == 'on' "><strong style="color:green">上线</strong></s:if><s:else><strong style="color:red">下线</strong></s:else></td>
						<td>
						<a href="proadsM_addMiss?ad.id=<s:property value="id" />">
						<button type="button" class="btn btn-sm btn-success">添加任务</button></a>
						<a href="proadsM_query?ad.id=<s:property value="id" />">
						<button type="button" class="btn btn-sm btn-primary">产品修改</button></a>
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
