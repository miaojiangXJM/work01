<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>喵酱的小窝</title>
</head>
<script type="text/javascript">
	//获取是否自动登录
	var cookieRememberLoginInfo = $.cookie('rememberLoginInfo');
	
	
	$(function(){
		if(cookieRememberLoginInfo == 1){
			$.ajax({  
	            type: "POST",  
	            async: false,  
	            url: '/theTest2/tUser/loginUser?userLoginName='+$.cookie('userLoginName')+'&userLoginPassword='+$.cookie('userLoginPassword')+"&rememberLoginInfo="+cookieRememberLoginInfo, 
	            contentType:"application/json",
	            dataType : "json", 
	            success: function (result) { 
	            	if(result.length != 1){
	            		alert("denglushibai");
	            	}else{
	            		var url = '../firstPage/FirstPage.jsp';
	            		window.location.href = url ;
	            	}
	            }
	        });
		}
	})
	
	function logon(){
		var url = '<%=basePath%>login.jsp';
		window.location.href = url ;
	}
</script>

<body style="margin: 0;padding: 0">
	<div>
		<form>
			<img alt="" src="<%=basePath%>img/b1_31p4.jpg" style="width: 100%">
			<div>
				<!-- <span>
					<span id = "a" style="color: #ffffff; position: absolute;top: 10px;left: 40%">qwe</span>
				</span> -->
			</div>
			<div>
				<a href="#" class="easyui-linkbutton"  onclick="logon()" style="color: #ffffff; position: absolute;top: 10px;left: 40%"  onclick="logon()">登录</a>
			</div>
		</form>
	</div>
</body>
</html>