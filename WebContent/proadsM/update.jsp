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
		<form action="proadsM_update" method="post" enctype="multipart/form-data" id="form-page">
			<table class="table table-bordered">
				<tr>
					<td class="tablecenter" colspan="4" style="height: 40px;">修改产品<s:actionerror cssStyle="color:red;list-style: none;" theme="simple"/>
						<input type="hidden" name="ad.id" value="${ad.id }">
						<input type="hidden" name="ad.protype" value="${ad.protype }">
						<input type="hidden" name="ad.proindex" value="${ad.proindex }">
						</td>
				</tr>
				<tr style="height: 40px;">
					<td class="tablecenter" style="width: 15%;">产品名称</td>
					<td style="width: 35%;">
					<input type="text" name="ad.proname" value="${ad.proname }" class="notnull" style="width: 100%;">
					</td>
					
					<td class="tablecenter" style="width: 15%;">产品包名</td>
					<td style="width: 35%;">
					<input type="text" name="ad.packagename" value="${ad.packagename }" class="notnull"  style="width: 100%;">
					</td>
				</tr>
				<tr style="height: 40px;">
					<td class="tablecenter">产品优先级</td>
					<td><input type="hidden" name="oldPri" value="${ad.propri }">
					  <input type="text" name="ad.propri" value="${ad.propri }" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" class="notnull" style="width: 100%;">
					</td>
					
					<td class="tablecenter">产品状态</td>
					<td>
					 <s:radio name="ad.prostatues" list="#{'on':'上线','off':'下线'}" value="ad.prostatues" theme="simple"></s:radio>
 					</td>
				</tr>
				<tr style="height: 40px;">
					<td class="tablecenter">产品大小</td>
					<td>
					  <input type="text" name="ad.prosize" value="${ad.prosize }" class="notnull" style="width: 100%;">
					</td>
					
					<td class="tablecenter">奖励总金额</td>
					<td>
					  <input type="text" name="ad.proprice" value="${ad.proprice }" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" class="notnull"  style="width: 100%;">
					</td>
				</tr>
				
				<tr style="height: 40px;">
				<td class="tablecenter">限制推广量</td>
					<td>
					  <input type="text" name="ad.puplimit" value="${ad.puplimit }" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" class="notnull"  style="width: 100%;">
					</td>
					<td class="tablecenter">应用接口</td>
					<td>
					  <input type="text" name="ad.openappinter" value="${ad.openappinter }" style="width: 100%;"> 
					</td>
				</tr>
			 <c:if test="${ad.protype eq 'ios'}">
				<tr style="height: 40px;">
					<td class="tablecenter text-danger">跳转路径</td>
					<td>
					  <input type="text" name="ad.jumpurl" value="${ad.jumpurl }" class="notnull"  style="width: 100%;"> 
					</td>
					<td class="tablecenter">IOS排名</td>
					<td>
					  <input type="text" name="ad.iosrank" value="${ad.iosrank }" class="notnull"  style="width: 100%;"> 
					</td>
				</tr></c:if>
				
				<tr style="height: 40px;">
					<td class="tablecenter" style="width: 15%;">移动推行要求</td>
					<td style="width: 35%;">
					<s:select class="change" id="yd" name="ad.ydputtype" list="#{'0':'全国推行 ','1':'屏蔽','2':'投放','3':'全国屏蔽 '}" value="ad.ydputtype" theme="simple"></s:select>
					</td>
					
					<td class="tablecenter" style="width: 15%;">移动要求省份</td>
					<td style="width: 35%;">
					<input type="text" name="ad.ydprovince" value="${ad.ydprovince }" class="yd"  style="width: 100%;">
					</td>
				</tr>
				
				<tr style="height: 40px;">
					<td class="tablecenter">联通推行要求</td>
					<td>
					<s:select class="change" id="lt" name="ad.ltputtype" list="#{'0':'全国推行 ','1':'屏蔽','2':'投放','3':'全国屏蔽 '}" value="ad.ltputtype" theme="simple"></s:select>
					</td>
					
					<td class="tablecenter">联通要求省份</td>
					<td>
					  <input type="text" name="ad.ltprovince" value="${ad.ltprovince }" class="lt"  style="width: 100%;">
					</td>
				</tr>
				 
				<tr style="height: 40px;">
				<td class="tablecenter">电信推行要求</td>
					<td>
					<s:select class="change" id="dx" name="ad.dxputtype" list="#{'0':'全国推行 ','1':'屏蔽','2':'投放','3':'全国屏蔽 '}" value="ad.dxputtype" theme="simple"></s:select>
					</td>
					<td class="tablecenter">电信要求省份</td>
					<td>
					  <input type="text" name="ad.dxprovince" value="${ad.dxprovince }" class="dx" style="width: 100%;"> 
					</td>
				</tr> 
				<tr style="height: 40px;">
					<td class="tablecenter">关键字</td>
					<td>
					<textarea style="width: 100%;height: 80px;" name="ad.prokeyworld" class="notnull">${ad.prokeyworld }</textarea>
 					</td>
					
					<td class="tablecenter">注意事项</td>
					<td>
					<textarea style="width: 100%;height: 80px;" name="ad.pronotice" class="notnull">${ad.pronotice }</textarea>
 					</td>
				</tr>
				<tr style="height: 40px;">
					<td class="tablecenter">产品描述</td>
					<td>
					<textarea style="width: 100%;height: 80px;" name="ad.prodesc" class="notnull">${ad.prodesc }</textarea>
 					</td>
					
					<td class="tablecenter">任务描述</td>
					<td>
					<textarea style="width: 100%;height: 80px;" name="ad.missiondesc" class="notnull">${ad.missiondesc }</textarea>
 					</td>
				</tr>
				
				<tr class="and" style="height: 40px;">
				<c:if test="${ad.protype eq 'android'}">
				    <td class="tablecenter">产品APK</td>
					<td>
					<input type="file" name="fileapk" class="file">
					</td>
					</c:if>
					<td class="tablecenter">产品logo</td>
					<td>
					<input type="file" name="filelogo" class="file">
					</td>
				</tr>
				<tr class="and" style="height: 40px;">
					<td class="tablecenter">应用截图1</td>
					<td>
					<input type="file" name="fileimg" class="file">
					</td>
					<td class="tablecenter">应用截图2</td>
					<td>
					<input type="file" name="fileimg1" class="file">
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
	<c:if test="${ ad.ydputtype eq 0 or ad.ydputtype eq 3}">
		<script type="text/javascript">
			$(function(){
			$(".yd").hide();
			});
		</script>
	</c:if>
	<c:if test="${ ad.ltputtype eq 0 or ad.ltputtype eq 3}">
		<script type="text/javascript">
			$(function(){
			$(".lt").hide();
			});
</script>
	</c:if>
	<c:if test="${ ad.dxputtype eq 0 or ad.dxputtype eq 3}">
		<script type="text/javascript">
			$(function(){
			$(".dx").hide();
			});
</script>
	</c:if>

</body>
</html>