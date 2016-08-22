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
	$(".notnull").blur(function(){
		if($(this).val().length>0){
			$(this).css("border", "1px solid green");
		}else{
			$(this).css("border", "1px solid red");
		}
	});
	$(".first").blur(function(){
		var num=$(".number").val();
		if($(this).val()==0){
			if(num!=1){
				$(this).css("border", "1px solid red");
				$(this).val("");
				alert("非第一个任务不得为0");
			}
		}
       
	});
	
});
 
function selectApp() {
if(navigator.userAgent.indexOf("MSIE") != -1) {
var arr = showModalDialog("proadsM_dialog", "搜索产品",
			"dialogWidth:450px;dialogHeight:550px;scroll:no;");
	if (arr == undefined) {
		arr = window.returnValue;
	}
	if (arr != null) {
		jQuery("#misid").val(arr[0]);
		jQuery("#proname").val(arr[1]);
	}
}else{ 
  var url="proadsM_dialog";                                 //转向网页的地址;
  var name="搜索产品";                           //网页名称，可为空;
  var iWidth=450;                          //弹出窗口的宽度;
  var iHeight=550;                        //弹出窗口的高度;
  var iTop = (window.screen.availHeight-30-iHeight)/2;       //获得窗口的垂直位置;
  var iLeft = (window.screen.availWidth-10-iWidth)/2;           //获得窗口的水平位置;
  window.open(url,name,'height='+iHeight+',innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}
}
</script>
</head>
<form   action="misM_add" method="post" id="form_page">
	<table class="table table-bordered table-hover definewidth m10">
	    <tr>
		   <td class="tablecenter" colspan="2">增加任务<s:actionerror cssStyle="color:red;"/> </td>
		<tr>
		<tr>
			<td width="10%" class="tablecenter">产品名</td>
			<td>
				<input name="mis.name" value="<s:property value="mis.name" />" placeholder="不能为空" onfocus="this.blur()" type="text" id="proname"  class="notnull"/>
				<button type="button" class="btn btn-ms btn-info" type="button"
					onclick="selectApp()">选择产品</button>
				<input type="hidden" id="misid" name="mis.proid" value="<s:property value="mis.proid" />"></td>
		</tr>
		<tr>
			<td class="tablecenter">任务编号</td>
			<td><input type="text" name="mis.misindex" class="notnull number" value="<s:property value="mis.misindex" />" /></td>
		</tr>
		<tr>
			<td class="tablecenter">任务价格</td>
			<td><input type="text" name="mis.misprice" class="notnull" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')"  value="<s:property value="mis.misprice" />" /></td>
		</tr>
		<tr>
			<td class="tablecenter">验证URL</td>
			<td><input type="text" name="mis.misverify" class="notnull" value="<s:property value="mis.misverify" />" /></td>
		</tr>
		<tr>
			<td class="tablecenter">任务触发日期</td>
			<td><input type="text" name="mis.misdate" class="notnull first" value="<s:property value="mis.misdate" />" />
			<font color="red"><b>(非第一个任务不得为0)</b>&nbsp;&nbsp;&nbsp;0.表示安装当天，1.表示安装下一天，一次类推</font></td>
		<tr>
			<td class="tablecenter">任务触发时间</td>
			<td><input type="text" name="mis.mistime" class="notnull" value="<s:property value="mis.mistime" />" />
			<font color="red">5.表示试玩5分钟，在线五分钟，也可能表示其他，如升2级，玩2局之类的</font>
			</td>
		</tr>
		<tr>
			<td class="tablecenter">任务类型</td>
			<td><input type="text" name="mis.mistype" class="notnull" value="<s:property value="mis.mistype" />" />
			<font color="red">0.表示在线时长、1.玩的局数、2.升级书、3.累计积分数，4.注册等</font>
			</td>
		</tr>
		<tr>
			<td class="tablecenter">任务描述</td>
			<td><textarea rows="50" cols="50" name="mis.misdesc" class="notnull"
				style="width: 80%; height: 80px; resize: none;"><s:property value="mis.misdesc" /></textarea></td>
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