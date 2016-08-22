<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + request.getContextPath()
			+ "/";
%>
<base href="<%=path%>" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
$(function(){
	$(".submit").click(function(){
		var isOk=1;
		$(".notnull").each(function(){
			if($(this).val().length>0){
				$(this).css("border", "1px solid green");
			}else{
				isOk+=1;
				$(this).css("border", "1px solid red");
			}
		});
		if(isOk==1){
			$("#form_page").submit();
		}else{
			alert("数据填写不完整！");
		}
	});
	$(".notnull").onblur(function(){
		if($(this).val().length>0){
			$(this).css("border", "1px solid green");
		}else{
			$(this).css("border", "1px solid red");
		}
	});
});
</script>
</head>
<form   action="artM_update" method="post" enctype="multipart/form-data" id="form_page">
	<table class="table table-bordered table-hover definewidth m10">
	    <tr>
		   <td class="tablecenter" colspan="2">修改文章<s:actionerror cssStyle="color:red;"/> 
		   <input type="hidden" name="art.id" value="${art.id }">
		    <input type="hidden" name="art.adsindex" value="${art.adsindex }">
		   </td>
		<tr>
		<tr>
			<td class="tablecenter">文章标题</td>
			<td><input type="text" name="art.title" class="notnull" value="<s:property value="art.title" />" /></td>
		</tr>
		<tr>
			<td class="tablecenter">文章价格</td>
			<td><input type="text" name="art.price" class="notnull" value="<s:property value="art.price" />" /></td>
		</tr>
		<tr>
			<td class="tablecenter">文章状态</td>
			<td><s:radio name="art.statues" list="#{'on':'上线','off':'下线'}" value="art.statues" theme="simple"></s:radio>
            </td>
		</tr>
		<tr>
			<td class="tablecenter">内容</td>
			<td><textarea rows="50" cols="50" name="art.article" class="notnull"
				style="width: 80%; height: 80px; resize: none;"><s:property value="art.article" /></textarea></td>
		</tr>
		<tr>
			<td class="tablecenter">分享内容</td>
			<td><textarea rows="50" cols="50" name="art.shareworld" class="notnull"
				style="width: 80%; height: 100px; resize: none;"><s:property value="art.shareworld" /></textarea></td>
		</tr>
	  
		<tr>
			<td class="tablecenter">分享图片</td>
			<td><input type="file" multiple="true" name="fileimg"></td>
		</tr>
		<tr>
			<td class="tablecenter"></td>
			<td>
			<button class="btn btn-primary submit" type="button">保存</button>&nbsp;&nbsp;
			<button type="button" onclick="location.href='javascript:history.go(-1)'" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>