 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.cookie/jquery.cookie.js"></script>
<link href="<%=basePath%>js/jquery-easyui-1.7.0/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>js/jquery-easyui-1.7.0/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/registered.css" rel="stylesheet" type="text/css" />

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>注册</title>
</head>
<script type="text/javascript">

	//键盘敲击事件
	function errors(event){
		//获取当前按键输入框的id
		var thisId =$(":text:focus").attr("id");
		if(thisId == 'userLoginName'){
			document.getElementById("error1").style.display="none";
		}else if(thisId == 'userLoginPassword'){
			document.getElementById("error2").style.display="none";
		}
	}	
	
	//返回登录页面
	function returns(){
		var url = "<%=basePath%>login.jsp";
		window.location.href = url ;
	}
	
	//确认注册按钮
	function logon(){
		//用户名
		var userLoginName = $('#userLoginName').val();
		//密码
		var userLoginPassword = $('#userLoginPassword').val();
	}
</script>

<body>
<form action="userFrom">
		<div>
			<div style="height: 20px">
				<table>
					<tr>
						<td><p id="error0"> </p></td>
						<td><p id="error1" style="display: none;">请输入账号。</p></td>
						<td><p id="error2" style="display: none;">请输入密码。</p></td>
					</tr>
				</table>
			</div>
			<table>	
				<tr>
					<td>账号：</td>
					<td><input type="text" name="userLoginName" id="userLoginName" onkeydown='return errors(event)' placeholder="用户账号"/></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="userLoginPassword" id="userLoginPassword" onkeydown='return errors(event)' placeholder="密码"/></td>
				</tr>
				<tr>
					<td><a href="#" style="text-decoration:none;font-size: 12px" onclick="logon()">确认注册</a></td>
				</tr>
				<tr>
					<td><a href="#" style="text-decoration:none;font-size: 12px" onclick="returns()">返回登录</a></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>