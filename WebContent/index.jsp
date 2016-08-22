<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>生活赚管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
   <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
html{
font-family: tahoma,arial,"SimSun","Helvetica Neue",Helvetica,sans-serif;
    font-size: 12px
}
</style>
 </head>
 <body>

  <div class="header">
    
      <div class="dl-title">
          
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${loginU.name} </span>
    <a href="userM_exit" title="退出系统" class="dl-log-quit">[退出]
    <input type="hidden" value="${loginU.role}" id="sign"></a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">基本管理</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">广告管理</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-product">数据管理</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-inventory">系统管理</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
   </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="./assets/js/bui.js"></script>
  <script type="text/javascript" src="./assets/js/config.js"></script>

  <script>
  var menu1={
          id:'search',
          homePage : 'UserM',
          menu:[{
              text:'系统管理',
              items:[
                {id:'UserM',text:'个人信息管理',href:'userM_list'}  
              ]
          } ]
        };
  var menu2={
          id:'search',
          homePage : 'UserM',
          menu:[{
              text:'系统管理',
              items:[
                {id:'UserM',text:'登录帐号管理',href:'userM_list'}  
              ]
          } ]
        };
  var sign = $("#sign").val();
  var menu = menu1;
	if (sign==0)
		menu = menu2;
	else
		menu = menu1;
    BUI.use('common/main',function(){
      var config = [{
          id:'baseM', 
          homePage : 'notice',
          menu:[{
              text:'基本管理',
              items:[
                {id :'notice',text : '系统通知',href : 'noticeM/notice.jsp',closeable : true},
                {id:'userM',text:'赚用户管理',href:'leuserM_list'},
                {id:'userIncome',text:'赚用户收入',href:'incomeM_list'},
                {id:'masterM',text:'师徒关系管理',href:'mastM_list'},
                {id:'remintM',text:'赚用户取款记录',href:'remitM/list.jsp'}
              ]
            }]},{
                id:'adsM',
                homePage : 'softAdM',
                menu:[{
                    text:'广告管理',
                    items:[
                      {id:'softAdM',text:'产品广告',href:'proadsM_list'},
                      {id:'misM',text:'任务明细',href:'misM_list'},
                      {id:'entityAdM',text:'实体广告',href:'entadsM_entlist'},
                      {id:'competitiveAdM',text:'精品广告',href:'jpadsM_list'},
                      {id:'PageM',text:'文章分享',href:'artM_list'}  
                    ]
                  } ]
              },{
                  id:'statM',
                  homePage : 'proM',
                  menu:[{
                      text:'统计管理',
                      items:[
                        {id:'proM',text:'产品数据统计',href:'statiM_prolist'},
                        {id:'redpckM',text:'红包数据统计',href:'statiM_redlist'},
                        {id:'redlogpckM',text:'红包日志',href:'statiM_redloglist'}
                      ]
                    } ]
                },menu];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
 </body>
</html>
