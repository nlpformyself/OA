<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path%>/css/main.css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
	<script type="text/javascript" src="<%=path%>/js/main.js"></script>

	<script>

        var jsonStr ='{"salary.salaryId":"_salaryId",' +
			'"salary.empId":"_empId",' +
			'"salary.extraSalary":"_extraSalary",' +
			'"salary.subSalary":"_subSalary",' +
			'"salary.salaryDay":"_salaryDay",' +
			'"salary.totalSalary":"_totalSalary","salary.emp":"_empName"}'
	    	
			
    $(function () {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }


        function showEditProductWin() {
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的支出情况", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_salaryId", row.salaryId)
                    .replace("_empId", row.empId)
                    .replace("_extraSalary", row.extraSalary)
                    .replace("_subSalary", row.subSalary)
                    .replace("_salaryDay", row.salaryDay)
                    .replace("_totalSalary", row.totalSalary)
					.replace("_empName", row.emp.name);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的工资情况", "info");
            }
        }

        function addSalary() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path%>/salary/save",
                    $("#addForm").serialize(),
                    function (data) {
                        if (data.result.result == "success") {
                            $("#addWin").window("close"); // 关闭指定的窗口
                            $("#list").datagrid("reload"); // 重新加载指定数据网格数据
                            $.messager.alert("提示", data.result.message, "info");
                        } else if (data.result.result == "fail") {
                            $.messager.alert("提示", data.result.message, "info");
                        }
                    }, "json"
                );
            } else {
                $.messager.alert("提示", "请输入正确的数据", "info");
            }
        }
        
        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
            } else if (row.status == 0) {
                return "<b>已禁用</b>"
            }
        }
        
        //赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        
        function editSalary() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path%>/salary/update",
                    $("#editForm").serialize(),
                    function (data) {
                        if (data.result.result == "success") {
                            $("#editWin").window("close"); // 关闭指定的窗口
                            $("#list").datagrid("reload"); // 重新加载指定数据网格数据
                            $.messager.alert("提示", data.result.message, "info");
                        } else if (data.result.result == "fail") {
                            $.messager.alert("提示", data.result.message, "info");
                        }
                    }, "json"
                );
            } else {
                $.messager.alert("提示", "请输入正确的表单数据", "info");
            }
        }

//添加
     function showempAll(){
   		 $("#empDiv").form("clear"); // 清除表单里的所有数据
   		 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
   		 $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
   	}
   	function getemp(){
   		var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
   		 $("#empInput").textbox('setValue',rows[0].name);
   		 $("#emp").textbox('setValue',rows[0].empId);
   		 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
   	}
   	
   	//修改
   	function showempAll1(){
   		 $("#empDiv1").form("clear"); // 清除表单里的所有数据
   		 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
   		 $("#empTable1").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载宿舍信息
   	}
   	function getemp1(){
   		var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
   		 $("#empInput1").textbox('setValue',rows[0].name);
   		 $("#emp1").textbox('setValue',rows[0].empId);
   		 $("#empDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
   	}

	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/salary/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'salaryId',checkbox:true">工资发放编号</th>
		<th data-options="field:'emp',width:100" formatter="formatterOpt2">员工</th>
		<th data-options="field:'extraSalary',width:80">奖励工资</th>
		<th data-options="field:'subSalary',width:80">扣罚工资</th>
		<th data-options="field:'salaryDay',width:80">发放时间</th>
		<th data-options="field:'totalSalary',width:80">总结余</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加学生" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工</td>
				<td>
					<a href="javascript:;" onclick="showempAll();"> 
							<input id="empInput" class="easyui-textbox" name="empName" /> 
							<input type="hidden" id="emp" class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>奖励工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salary.extraSalary" data-options="required:false"/></td>
			</tr>
			<tr>
				<td>扣罚工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salary.subSalary" data-options="required:false"/></td>
			</tr>
			<tr>
				<td>发放时间</td>
				<td><input id="dd" type="text" class="easyui-datetimebox" name="salary.salaryDay" data-options="required:true,showSeconds:false" value="3/4/2010 2:3"></td>
			</tr>
			<tr>
				<td>总结余</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salary.totalSalary" data-options="required:false"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addSalary();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">添加</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改基本工资信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="salary.salaryId" />
		<table>
			<tr>
				<td>员工</td>
				<td>
					<a href="javascript:;" onclick="showempAll1();"> 
							<input id="empInput1" class="easyui-textbox" name="empName" /> 
							<input type="hidden" id="emp1" class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>奖励工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salary.extraSalary" data-options="required:false"/></td>
			</tr>
			<tr>
				<td>扣罚工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salary.subSalary" data-options="required:false"/></td>
			</tr>
			<tr>
				<td>发放时间</td>
				<td><input type="text" class="easyui-datetimebox" name="salary.salaryDay" data-options="required:true,showSeconds:false" value="3/4/2010 2:3"></td>
			</tr>
			<tr>
				<td>总结余</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salary.totalSalary" data-options="required:false"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editSalary();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">修改</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 添加 員工-->
<div id="empDiv" class="easyui-window" title="员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getemp,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'empId',checkbox:true">员工</th>
			<th data-options="field:'name',width:60">姓名</th>
			<th data-options="field:'nation',width:100">介绍</th>
		</tr>
	</thead>
</table>
</div>
<!-- 添加 員工-->
<!-- 修改 員工-->
<div id="empDiv1" class="easyui-window" title="员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getemp1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'empId',checkbox:true">员工</th>
			<th data-options="field:'name',width:60">员工姓名</th>
			<th data-options="field:'nation',width:100">员工介绍</th>
		</tr>
	</thead>
</table>
</div>
<!-- 修改 員工-->
</body>
</html>