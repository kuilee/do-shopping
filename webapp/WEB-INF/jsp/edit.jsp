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
		//编辑学生信息
		$(".editBtn").click(function() {
			var url = ctx + '/editStudent';
			var para=$('#editForm').serialize();
			$.post(url, para, function(data) {
				if(data == "yes"){
    				alert("修改成功！");
    			} else if(data == "no"){
    				alert("修改失败！");
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
	width: 90px;
}

</style>
</head>
<div>
	<h3 style="text-align: center;">Edit Student</h3>
	<hr>
	<form:form name="issue" method="post" id="editForm">
		<table>
			<tr style="height: 50px;">
				<td class="td1">姓名:</td>
				<td>
					<input type="text" name="name" value="${student.name }"/>
					<input type="hidden" name="id" value="${student.id }"> 
				</td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">年龄:</td>
				<td><input type="text" name="age" value="${student.age }"/></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">登录密码:</td>
				<td><input type="text" name="pwd" value="${student.pwd }"/></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">地址:</td>
				<td><input type="text" name="address" value="${student.address }"/></td>
			</tr>
			<tr style="height: 50px;">
				<td class="td1">是否管理员:</td>
				<td>
					<c:if test="${student.isadmin == 1}">
						<input type="radio" name="isadmin" value="1" checked="checked"/>是
						<input type="radio" name="isadmin" value="0" />否
					</c:if>
					<c:if test="${student.isadmin == 0}">
						<input type="radio" name="isadmin" value="1" />是
						<input type="radio" name="isadmin" value="0" checked="checked"/>否
					</c:if>
				</td>
			</tr>
		</table><hr>
		<input type="button" class="editBtn" value="提交" />
	</form:form>
</div>
</html>