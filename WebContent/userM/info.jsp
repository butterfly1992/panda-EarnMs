<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/devupdate.js?v=1001"></script>
<script type="text/javascript" src="js/page.js"></script>
<style type="text/css">
#tdc{
text-align: center;
}

#size{
font-size: 14px;
line-height: 1px;
}
</style>
</head>
<body>
	<div style="margin: 1em 3em 1em 3em;text-shadow: blue;" id="size">
	
	 <form action="leuserM_update" method="post" class="updateLeu">
		<table id="devinfo" class="table table-bordered "  height="240">
			<tr>
				<td class="tableleft" colspan="8" style="text-align: center;">用户详细信息 <s:actionerror cssStyle="color:red;"/> <input type="hidden" name="leu.uid" value="${leu.uid }"></td>
			</tr>
			<tr>
				<td id="tdc" class="tableleft" style="width: 10%; ">支付宝姓名:</td>
				<td style="width: 15%; "><span id="outvalue" ><s:property value="leu.alipayname"/></span>
				<input id="invalue" class="notnull" placeholder="请输入支付宝姓名……" type="text" name="leu.alipayname" value="${leu.alipayname }">
				</td>
				
				<td id="tdc" class="tableleft" style="width: 10%; ">支付宝账号:</td>
				<td style="width: 15%; "><span id="outvalue" ><s:property value="leu.alipay"/></span>
				<input id="invalue" class="notnull" placeholder="请输入支付宝账号……" type="text" name="leu.alipay" value="${leu.alipay }">
				</td>
				
				<td id="tdc" class="tableleft" style="width: 10%; ">手机号码:</td>
				<td style="width: 15%; "><span id="outvalue" ><s:property value="leu.phone"/></span>
				<input id="invalue" class="notnull" placeholder="请输入手机号码……" type="text" name="leu.phone" value="${leu.phone }">
				</td>
				
				<td id="tdc" class="tableleft" style="width: 10%; ">取款密码:</td>
				<td><span id="outvalue" ><font color="green"><s:property value="leu.passwd"/></font></span>
				<input id="invalue" class="notnull" placeholder="请输入取款密码……" type="text" name="leu.passwd" value="${leu.passwd }">
				</td>
			</tr>
			<tr>
				<td id="tdc" class="tableleft">微信ID:</td>
				<td><span id="outvalue" style="font-size: xx-small;"><s:property value="leu.wechatid"/></span>
				<input id="invalue" class="notnull" placeholder="请输入微信ID……" type="text" name="leu.wechatid" value="${leu.wechatid }">
				</td>
				
				<td id="tdc" class="tableleft">父账号:</td>
				<td><span id="outvalue" ><s:property value="leu.puid"/></span>
				<input id="invalue" class="notnull" placeholder="请输入微信ID……" type="text" name="leu.puid" value="${leu.puid }">
				</td>
				
				<td id="tdc" class="tableleft">群组账号:</td>
				<td><span id="outvalue" ><s:property value="leu.groupuid"/>	</span>			
				<input id="invalue" class="notnull" placeholder="请输入群组账号……" type="text" name="leu.groupuid" value="${leu.groupuid }">
				</td>
				
				<td id="tdc" class="tableleft">注册日期:</td>
				<td><s:property value="leu.singdate"/>
				</td>
			</tr>
			<tr>
				<td id="tdc"class="tableleft">全部收入:</td>
				<td><s:property value="inc.totalincome"/></td>
				<td id="tdc"class="tableleft">全部支出:</td>
				<td><s:property value="inc.totalpay"/></td>
				<td id="tdc"class="tableleft">邀请收入:</td>
				<td><s:property value="inc.inviteincme"/></td>
				<td id="tdc" class="tableleft">任务收入:</td>
				<td><s:property value="inc.misincom"/></td>
			</tr>
			 <tr>
				<td id="tdc"class="tableleft">年收入:</td>
				<td><s:property value="inc.yearicm"/></td>
				<td id="tdc"class="tableleft">月收入:</td>
				<td><s:property value="inc.monthicm"/></td>
				<td id="tdc"class="tableleft">日收入:</td>
				<td><s:property value="inc.dayicm"/></td>
				<td id="tdc" class="tableleft">红包收入:</td>
				<td><s:property value="inc.redpackage"/></td>
			</tr>
			<tr>
				<td id="tdc" class="tableleft" colspan="8" align="left">&nbsp;
				<input type="button" class="btn btn-primary" id="update" value="修改">
				<input type="button" class="btn btn-primary" id="save" value="保存">
				<input type="button" class="btn btn-success" id="back" onclick="location.href='javascript:history.go(-1)'" value="返回">
				<input type="button" class="btn btn-info" id="quit" value="取消">
				</td>
			</tr>
		</table></form></div>
		<div style="margin: 1em;text-shadow: blue;" id="size">
		
		<form class="form-inline" action="leuserM_info"
			method="post" id="form_page">
			<div>
				<table id="tablecenter"
					class="table table-bordered table-hover definewidth m10">
					<thead>
						<tr>
						<td class="tableleft" colspan="4">${pageInfo.pageFooter }
						<input type="hidden" name="leu.uid" value="${leu.uid }">
						</td>
					    </tr>
						<tr>
							<th class="tableleft">明细日期</th>
						    <th class="tableleft">明细时间</th>
							<th>明细描述</th>
							<th>收入</th>
						</tr>
					</thead>
					<s:iterator value="list">
						<tr>
						<td>${dedate}</td>
						<td>${detime}</td>
						<td>${dedesc}</td>
						<td>${deincome}</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</form>
	</div>
</body>
</html>