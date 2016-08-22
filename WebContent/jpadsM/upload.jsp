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
<title>上传APK</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
		$(".protype").click(function() {
			if ($(this).val() == "ios") {
				$(".type").val("ios");
				$(".and").hide();
				$("file").val("");
			} else {
				$(".type").val("android");
				$(".and").show();
			}
		});

		$(".submit").click(function() {
			if($(".type").val()=="ios"){
				$("#form-page").submit();
			}else{
				if ($(".file").val().lastIndexOf(".apk") > 0) {
					$("#form-page").submit();
				} else {
					alert("请上传正确的APK文件！");
				}
			}
			
		});
	});
</script>
</head>
<body>
	<div style="margin: 3em 16em 4em 16em;">
		<form action="jpadsM_upload" method="post"
			enctype="multipart/form-data" id="form-page">
			<table id="devinfo" class="table table-bordered">
			
				<tr>
					<td class="tableleft" colspan="8"
						style="text-align: center; height: 40px;">添加精品广告<s:actionerror cssStyle="color:red;"/> </td>
				</tr>
				<tr style="height: 40px;">
					<td class="tableright" style="width: 10%;">设备类型</td>
					<td style="width: 15%;">
					<input type="radio" class="protype" name="bou.devicetype" value="android" checked="checked">安卓&nbsp;
					<input type="radio" class="protype" name="bou.devicetype" value="ios">IOS
					<input type="hidden" class="type" value="android">
					</td>
				</tr>
				<tr class="and" style="height: 40px;">
					<td id="tdc" class="tableright" style="width: 10%;">文件上传</td>
					<td style="width: 15%;"><input type="file" name="fileapk"
						class="file"></td>
				</tr>
				<tr style="height: 40px;">
					<td class="tableleft" colspan="8" style="text-align: center;">
						<input type="button" class="btn btn-sm btn-success submit"
						value="提交"> <input type="button"
						class="btn btn-sm btn-info"
						onclick="location.href='javascript:history.go(-1)'" value="返回">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>