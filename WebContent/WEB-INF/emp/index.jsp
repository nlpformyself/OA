<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon-hamburg.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/themes/jeasyui.icons.hamburg.js"></script>

<script>
$(document).ready(function() {
	tabCloseEven();
});

function aa() {
	if ('${sessionScope.emp.name}' == null) {
		alert("请登录之后再来访问");
		$.post("<%=path %>/emp/loginPage",
				$("#editForm").serialize(),
				function(data){
			},"json");
	}
}




</script>
<%if(request.getSession().getAttribute("emp")==null)
{%>
 	 <script>
		window.location.href="<%=path%>/emp/outSession";
	</script>

<%}%>

</head>


<body onclick="aa()" class="easyui-layout">

		<div data-options="region:'north'" style="height:60px">
			<img src="<%=path %>/images/logo.png" class="logo"/>
			<div id="wel">
				<a href="javascript:;">欢迎您：${sessionScope.emp.name}</a>
				<a href="<%=path%>/emp/outSession">安全退出</a>
			</div>
		</div>
		<div data-options="region:'west',split:true" title="菜单" style="width:200px;">
			<div class="easyui-accordion menu" style="width:200px;">
				<div title="考勤管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('我的考勤','<%=path%>/stu/skipPage');">我的考勤</a></li>
					</ul>
				</div>
				<div title="员工管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('员工管理', '<%=path%>/emp/skipPage');">员工管理</a>
						<li><a href="javascript:;" onclick="addTab('员工教育背景', '<%=path%>/edu/skipPage');">员工教育背景</a>
						<li><a href="javascript:;" onclick="addTab('员工工作经历', '<%=path%>/exp/skipPage');">员工工作经历</a>
						<li><a href="javascript:;" onclick="addTab('员工工作日志', '<%=path%>/report/skipPage');">员工工作日志</a>
						<li><a href="javascript:;" onclick="addTab('员工值班', '<%=path%>/duty/skipPage');">员工值班</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤信息', '<%=path%>/empCheckingInfo/skipPage');">员工考勤信息</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤', '<%=path%>/empChecking/skipPage');">员工考勤</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤申诉', '<%=path%>/empAppeal/skipPage');">员工考勤申诉</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤反馈', '<%=path%>/empFeedBack/skipPage');">员工考勤反馈</a>
						<li><a href="javascript:;" onclick="addTab('员工请假', '<%=path%>/empLeave/skipPage');">员工请假</a>
						<li><a href="javascript:;" onclick="addTab('员工巡查', '<%=path%>/check/skipPage');">员工巡查</a>
						
					</ul>
				</div>
				<div title="学生管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('正式学生管理','<%=path%>/stu/skipPage');">正式学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('宿舍管理','<%=path%>/room/skipPage');">宿舍管理</a></li>
						<li><a href="javascript:;" onclick="addTab('班级管理','<%=path%>/grade/skipPage');">班级管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生请假管理','<%=path%>/stuLeave/skipPage');">学生请假管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生反馈管理','<%=path%>/stuFeedback/skipPage');">学生反馈管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生就业管理','<%=path%>/job/skipPage');">学生就业管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生谈心管理','<%=path%>/talk/skipPage');">学生谈心管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生考勤管理','<%=path%>/stuChecking/skipPage');">学生考勤管理</a></li>
					</ul>
				</div>
				<div title="请假管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-hire-me'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('我的请假','<%=path%>/empLeave/empLeavePage');">我的请假</a></li>
					</ul>
				</div>
				<div title="市场管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-hire-me'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('意向学生','<%=path%>/intention/skipPage');">意向学生</a></li>
						<li><a href="javascript:;" onclick="addTab('预定学生','<%=path%>/predetermine/skipPage');">预定学生</a></li>
					</ul>
				</div>
				
					<div title="值班管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-hire-me'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('我的值班','<%=path%>/predetermine/skipPage');">我的值班</a></li>
					</ul>
				</div>
				<div title="公告管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-hire-me'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('公告类型','<%=path%>/noticeType/skipPage');">公告类型</a></li>
					</ul>
					<ul>
						<li><a href="javascript:;" onclick="addTab('公告管理','<%=path%>/notice/skipPage');">公告管理</a></li>
					</ul>
				</div>
				<div title="巡查管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-bank'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('我的巡查','<%=path%>/check/empCheckPage');">我的巡查</a></li>
					</ul>
				</div>
				
				 <!-- 此div为了让菜单不默认展开 -->
				 <div title="" selected style="padding:0px;"></div>
			</div>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">
				<div title="主页" style="padding:10px" data-options="plain: true, iconCls: 'icon-hamburg-home'">
					<jsp:include page="home.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div data-options="region:'south',split:false" style="height:50px; text-align:center;">Copyright&copy;15秋预科  2016-2020</div>
		
		<!-- 菜单窗口 -->
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseleft">关闭左边选项卡</div>
		<div id="mm-tabcloseright">关闭右边选项卡</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
</body>
</html>