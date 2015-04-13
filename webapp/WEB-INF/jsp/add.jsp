<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/report.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<%@ include file="/common/global.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript" src="${ctx }/js/common/jquery-1.8.3.js"></script>

<script type="text/javascript">
	$(function() {
		$(".submitBtn").click(function() {
			var url = ctx + '/addStudent';
			var para=$('#stuForm').serialize();
			$.post(url, para, function(data) {
				if(data == "yes"){
    				alert("添加成功！");
    			} else if(data == "no"){
    				alert("添加失败！");
    			} else {
    				alert("系统出错！");
    			}
				window.close();
				dialogArguments.location.reload(true);
			});
		});
	});
</script>
<style type="text/css">
.td1 {
	padding-right: 12px;
	text-align: right;
	width: 80px;
}

</style>
</head>
<div>
	<h3 style="text-align: center;">Add Student</h3>
	<hr>
	<form:form name="issue" method="post" id="stuForm">
		<table>
			<tr style="height: 50px;">
				<td class="td1">姓名</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">年龄</td>
				<td><input type="text" name="age" /></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">登录密码</td>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">地址</td>
				<td><input type="text" name="address" /></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">是否管理员</td>
				<td><input type="radio" name="isadmin" value="1" />是 <input
					type="radio" name="isadmin" value="0" checked="checked" />否</td>
			</tr>
		</table><hr>
		<input type="button" class="submitBtn pointer" value="提交" />
		<input type="reset" class="pointer" value="重置" />
	</form:form>
</div>
</html>