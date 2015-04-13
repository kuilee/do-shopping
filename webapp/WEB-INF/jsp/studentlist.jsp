<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/report.css" type="text/css" rel="stylesheet"/>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<%@ include file="/common/global.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript" src="${ctx }/js/common/jquery-1.8.3.js"></script>
<style type="text/css">
table.altrowstable {
    font-family: verdana,arial,sans-serif;
    font-size:11px;
    color:#333333;
    border-width: 1px;
    border-color: #a9c6c9;
    border-collapse: collapse;
    
}
table.altrowstable th {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
}
table.altrowstable td {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
    border-color: #a9c6c9;
    font-size: 17px;
}
.oddrowcolor{
    background-color:#d4e3e5;
}
.evenrowcolor{
    background-color:#c3dde0;
}
</style>

<script type="text/javascript">
	$(function() {
		//隔行变色
		$('.altrowstable tr:odd').addClass("oddrowcolor");
		$('.altrowstable tr:even').addClass("evenrowcolor");
		
		//添加学生事件
		$('#add').click(add);
		
		//删除学生，无刷新删除，动画效果实现
		$('.del').click(function() {
			//获取tr属性id
			var stuid = $(this).parent().parent().attr("id");
			$.post(ctx + '/del?stuid=' + stuid,function(data) {
				if(data.result == "ok"){
					$("#" + stuid).fadeOut("slow", function (){
						//删除行
					    $(this).remove();
					});
    			} else if(data.result == "error"){
    				alert("删除出错！");
    			} 
			});
		});
		
		//修改学生
		$('.edit').click(function() {
			//获取tr属性id
			var stuid = $(this).parent().parent().attr("id");
			var url = ctx + "/edit?stuid="+stuid;
		    var winArgs="dialogWidth=470px;dialogHeight=450px;status=0;help=0;";
		    window.showModalDialog(url,window,winArgs);
		});
		
		//关键字查找
		$('#search').click(function() {
			var key = $('.keyInput').val();
			location.href = ctx + '/search?key=' + key;
			
		});
		
		
		//安全退出
		$(".logout").click(function() {
			if (confirm('系统提示，您确定要退出本次登录吗?')) {
				location.href = ctx + '/logout';
			}
		});
	});
	
	function add() {
		var url = ctx + "/add";
	    var winArgs="dialogWidth=470px;dialogHeight=450px;status=0;help=0;";
	    window.showModalDialog(url,window,winArgs);
	}
</script>
</head>
<body>
	<div style="text-align: right;">
		欢迎您, ${currentUser.name } !
		<a href="#" class="logout">安全退出</a>
	</div>
	<h2 align="center">学生列表</h2><hr>
	<div align="center">
		<div align="center" >
			<input type="text" class="keyInput">&nbsp;<button id="search">查找</button>&nbsp;&nbsp;&nbsp;
			<button id="add">添加</button>
		</div><br>
		<table class="altrowstable" id="alternatecolor">
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>年龄</th>
				<th>地址</th>
				<th>管理员</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${stuList}" var="stu" varStatus="st">
				<tr id="${stu.id }">
					<td>${st.index+1 }</td>
					<td><a href="" class="edit" title="修改">${stu.name }</a></td>
					<td>${stu.age }</td>
					<td>${stu.address }</td>
					<td>
						<c:if test="${stu.isadmin == '0' }">
							否
						</c:if>
						<c:if test="${stu.isadmin == '1' }">
							是
						</c:if>
					</td>
					<td><a href="#" class="del">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>