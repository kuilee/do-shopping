<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<%@ include file="/common/global.jsp"%>
	<title>登录页</title>
	<script>
		var logon = ${not empty currentUser};
		if (logon) {
			var isadmin = ${currentUser.isadmin};
			if(isadmin == '0') {
				location.href = '${ctx}/welcome';
			} else {
				location.href = '${ctx}/studentlist';
			}
		}
	</script>
	<%@ include file="/common/meta.jsp" %>
    <script type="text/javascript" src="${ctx }/js/common/jquery-1.8.3.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$('.submitBtn').click(function() {
	    		var username = $('#username').val();
	    		var pwd = $('#password').val();
	    		if(username == '') {
	    			alert("请输入用户名！");
	    			return false;
	    		}
	    		if(pwd == '') {
	    			alert("请输入密码！");
	    			return false;
	    		} 
	    		
	    		$.post(ctx + "/login",{
	    			username:username,
	    			pwd:pwd
	    		},function(data) {
	    			if(data.result == "no_user"){
	    				alert("用户名不存在");
	    				return false;
	    			} else if(data.result == "error_pwd"){
	    				alert("密码错误");
	    				return false;
	    			} else if(data.result == "ok"){
	    				window.location.href = ctx +'/studentlist';
	    			} else {
	    				alert("系统出错！");
	    				return false;
	    			}
	    		});
    			
    		});
    		
    		
    		
    	});
    </script>
</head>

<body style="margin-top: 3em;">
	<center>
	<c:if test="${not empty param.error}">
		<h2 id="error" class="alert alert-error">用户名或密码错误！！！</h2>
	</c:if>
	<c:if test="${not empty param.timeout}">
		<h2 id="error" class="alert alert-error">未登陆或超时！！！</h2>
	</c:if>
	<div style="width: 350px">
		<h2>Jxx-Framework-Demo</h2>
		<hr />
		<form action="javascript:return false;">
			<table>
				<tr>
					<td width="80">用户名：</td>
					<td><input id="username" name="username" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password" name="password" type="password" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<button type="submit" class="submitBtn">登录</button>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>



