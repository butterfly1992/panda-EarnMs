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
<title>添加精品广告</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
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
				$(this).attr("placeholder", "不能为空");
			}
		});
		if(isOk==1){
			$("#form-page").submit();
		}else{
			alert("数据填写不完整！");
		}
	});
	$(".notnull").blur(function(){
		if($(this).val().length>0){
			$(this).css("border", "1px solid green");
		}else{
			$(this).css("border", "1px solid red");
			$(this).attr("placeholder", "不能为空");
		}
	});
	$(".change").change(function(){
		var type="."+$(this).attr("id");
		if($(this).val()==0||$(this).val()==3){
			$(type).val("");
			$(type).attr("class",$(this).attr("id"));
			$(type).hide();
		}else{
			$(type).attr("class","notnull "+$(this).attr("id"));
			$(type).show();
		}
		
	});
});
</script>
 
</head>
<body>
	<div style="margin: 1em 10em 1em 10em;">
		<form action="jpadsM_add" method="post" enctype="multipart/form-data" id="form-page">
			<table id="devinfo" class="table table-bordered">
				<tr>
					<td class="tablecenter" colspan="4" style="height: 40px;">添加精品广告<s:actionerror cssStyle="color:red;list-style: none;"  theme="simple"/>
						<input type="hidden" name="bou.devicetype" value="${bou.devicetype }">
						<input type="hidden" name="bou.ordertype" value="${bou.ordertype }">
						</td>
				</tr>
				<tr style="height: 40px;">
					<td class="tablecenter" style="width: 15%;">广告名称</td>
					<td style="width: 35%;">
					<input type="text" name="bou.name" value="${bou.name }" class="notnull" style="width: 100%;">
					</td>
					
					<td class="tablecenter" style="width: 15%;">广告包名</td>
					<td style="width: 35%;">
					<input type="text" name="bou.packagename" value="${bou.packagename }" class="notnull"  style="width: 100%;">
					</td>
				</tr>
				
				<tr style="height: 40px;">
				<td class="tablecenter">价格</td>
					<td>
					  <input type="text" name="bou.price" value="${bou.price }" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" class="notnull"  style="width: 100%;">
					</td>
					<td class="tablecenter">关键词</td>
					<td>
					  <input type="text" name="bou.keyword" value="${bou.keyword }" class="notnull"  style="width: 100%;"> 
					</td>
				</tr>
				
				
				
				
				<tr style="height: 40px;">
					<td class="tablecenter" style="width: 15%;">移动推行要求</td>
					<td style="width: 35%;">
					<s:select class="change" id="yd" name="bou.ydputtype" list="#{'0':'全国推行 ','1':'屏蔽','2':'投放','3':'全国屏蔽 '}" value="bou.ydputtype" theme="simple"></s:select>
					</td>
					
					<td class="tablecenter" style="width: 15%;">移动要求省份</td>
					<td style="width: 35%;">
					<input type="text" name="bou.ydprovince" value="${bou.ydprovince }" class="yd"  style="width: 100%;">
					</td>
				</tr>
				
				<tr style="height: 40px;">
					<td class="tablecenter">联通推行要求</td>
					<td>
					<s:select class="change" id="lt" name="bou.ltputtype" list="#{'0':'全国推行 ','1':'屏蔽','2':'投放','3':'全国屏蔽 '}" value="bou.ltputtype" theme="simple"></s:select>
					</td>
					
					<td class="tablecenter">联通要求省份</td>
					<td>
					  <input type="text" name="bou.ltprovince" value="${bou.ltprovince }" class="lt"  style="width: 100%;">
					</td>
				</tr>
				 
				<tr style="height: 40px;">
				<td class="tablecenter">电信推行要求</td>
					<td>
					<s:select class="change" id="dx" name="bou.dxputtype" list="#{'0':'全国推行 ','1':'屏蔽','2':'投放','3':'全国屏蔽 '}" value="bou.dxputtype" theme="simple"></s:select>
					</td>
					<td class="tablecenter">电信要求省份</td>
					<td>
					  <input type="text" name="bou.dxprovince" value="${bou.dxprovince }" class="dx" style="width: 100%;"> 
					</td>
				</tr>
				
				
				
				
				
				
				
			 <c:if test="${bou.devicetype eq 'ios'}">
				<tr style="height: 40px;">
					<td class="tablecenter">跳转路径</td>
					<td colspan="3">
					  <input type="text" name="bou.jumpurl" value="${bou.jumpurl }" class="notnull"  style="width: 100%;"> 
					</td>
				</tr></c:if>
				
				<tr class="and" style="height: 40px;">
					<td class="tablecenter">LOGO</td>
					<td>
					<input type="file" name="filelogo" class="file">
					</td>
					<td class="tablecenter">图片</td>
					<td>
					<input type="file" name="fileimg" class="file">
					</td>
				</tr>
				<tr style="height: 40px;">
					<td class="tableleft" colspan="8" style="text-align: center;">
						<input type="button" class="btn btn-sm btn-success submit" value="提交">
						<input type="button" class="btn btn-sm btn-info" onclick="location.href='javascript:history.go(-1)'" value="返回">
					</td>
				</tr>

			</table>
		</form>
	</div>
	<script type="text/javascript">
$(function(){
$(".yd").hide();
$(".lt").hide();
$(".dx").hide();
});
</script>
</body>
</html>