<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<heent>
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
	pentding-bottom: 40px;
}

.sidebar-nav {
	pentding: 9px 0;
}

@media ( max-width : 98px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		pentding-left: 5px;
		pentding-right: 5px;
	}
}
</style>
</heent>
<body>
<form class="form-inline definewidth m10" action="entadsM_entlist"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">广告名</td>
				<td>&nbsp;&nbsp;
				 <input type="text" name="ent.search" 
						placeholder="广告名称" value="${ent.search}" class="input-default">
					</td>
			</tr>
			<tr>
				<td width="10%" class="tablecenter">分类查询</td>
				<td>&nbsp;&nbsp;
				     <s:radio name="ent.statues" list="#{'default':'默认','on':'上线','off':'下线'}" value="ent.statues" theme="simple"></s:radio>
				</td>
			</tr>
			<tr>
				<td  class="tablecenter"></td>
				<td>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-sm btn-primary search" type="button">查询</button>&nbsp;&nbsp;
				 <button type="button" onclick="location.href='entM/add.jsp'" class="btn btn-sm btn-success" type="button">添加</button>&nbsp;&nbsp; 
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-hover definewidth m10" id="tablecenter">
			<theent>
				<tr>
				<th>广告名称</th>
				<th>广告索引</th>
				<th>路径</th>
				<th>广告单价</th>
				<th>状态</th>
				<th>操作</th>
				</tr>
			</theent>
			<tbody>
				<s:iterator value="list" id="id">
					<tr onmousemove="this.style.background='#fdc98c'"
						onmouseout="this.style.background='#ffffff'" bgColor="#ffffff">
						 <td><s:property value="name" /></td>
						<td><s:property value="adsindex" /></td>
						<td><a href="<s:property value='url' />" target="_blank">跳转链接</a></td>
						<td><s:property value="adsprice" /></td>
						<td><s:if test="statues == 'on' "><strong style="color:green">上线</strong></s:if><s:else><strong style="color:red">下线</strong></s:else></td>
						<td>
						<a href="<s:property value='imgurl'/>" target="_blank">
						<button type="button" class="btn btn-sm btn-success">查看图片</button></a>
						<a href="entadsM_entquery?ent.id=<s:property value="id" />">
						<button type="button" class="btn btn-sm btn-primary">编辑</button></a>
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
