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
<link rel="stylesheet" type="text/css" href="css/ui-dialog.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/sea.js"></script>
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
<script>
	seajs.config({
		alias : {
			"jquery" : "jquery-1.10.2.js"
		}
	});
</script>
</head>
<body>
<form class="form-inline definewidth m10" action="artM_list"
		id="form_page" method="post">
		<table class="table table-bordered table-hover definewidth m10">
			<tr>
				<td width="10%" class="tablecenter">标题</td>
				<td>&nbsp;&nbsp;
				 <input type="text" name="art.search" value="${art.search}" class="input-default">
					</td>
			</tr>
			<tr>
				<td width="10%" class="tablecenter">状态</td>
				<td>&nbsp;&nbsp;
				     <s:radio name="art.statues" list="#{'default':'默认','on':'上线','off':'下线'}" value="art.statues" theme="simple"></s:radio>
				</td>
			</tr>
			<tr>
				<td  class="tablecenter"></td>
				<td>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-sm btn-primary search" type="button">查询</button>&nbsp;&nbsp;
				 <button type="button" onclick="location.href='articleM/add.jsp'" class="btn btn-sm btn-success" type="button">添加</button>&nbsp;&nbsp; 
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-hover definewidth m10" id="tablecenter">
			<thead>
				<tr>
				<th>标题</th>
				<th>索引</th>
				<th>价格</th>
				<th>内容</th> 
				<th>分享内容</th>
				<th>图片链接</th>
				<th>状态</th>
				<th>操作</th>
				</tr>
			</thead>
		 
			<tbody>
				<s:iterator value="list" status="status">
					<tr onmousemove="this.style.background='#fdc98c'"
						onmouseout="this.style.background='#ffffff'" bgColor="#ffffff">
						 <td><s:property value="title" /></td>
						<td><s:property value="adsindex" /></td>
						<td><s:property value="price" /></td>
						
						<td style="text-align: left;"><span id="substr"><s:property value="article" /></span>
						<a id="info<s:property value='%{#status.index}'/>_look" style="text-decoration: underline;">查看</a> 
							<input type="hidden" id="info<s:property value='%{#status.index}'/>" value="<s:property value='article'/>" /></td>
						
						<td style="text-align: left;"><span id="substr2"><s:property value="shareworld" /></span>
						<a id="info<s:property value='%{#status.index}'/>1_look" style="text-decoration: underline;">查看</a> 
							<input type="hidden" id="info<s:property value='%{#status.index}'/>1" value="<s:property value='shareworld'/>" /></td>
						
						<%-- <td><s:property value="article" /></td> --%>
						<%-- <td><s:property value="shareworld" /></td> --%>
						<td><a href="<s:property value='shareimg'/>" target="_blank">
						<button type="button" class="btn btn-sm btn-success">查看图片</button></a> 
						</td>
						<td><s:if test="statues == 'on' "><strong style="color:green">上线</strong></s:if><s:else><strong style="color:red">下线</strong></s:else></td>
						<td>
						<a href="artM_query?art.id=<s:property value="id" />">
						<button type="button" class="btn btn-sm btn-primary">修改</button></a>
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
		seajs.use([ 'jquery', 'dialog' ], function($, dialog) {
			$("[id$='_look']").on(
					'click',
					function() {
						var my_id = this.id;
						var content = $("#" + my_id.substring(0, my_id.indexOf("_"))).val();
						var d = dialog({
							title : '详细内容',
							content : '暂无内容！'
						});
						d.content(content);
						d.showModal();
					});
		});
	</script>
	<script type="text/javascript">
		 $(function() {
			 var shortstr=$("#substr").html().substring(0,15);
			 $("#substr").html(shortstr+"...")
			 var shortstr2=$("#substr2").html().substring(0,15);
			 $("#substr2").html(shortstr2+"...")
		});
	</script>
</body>
</html>
