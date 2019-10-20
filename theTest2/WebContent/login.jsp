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
<%-- <script type="text/javascript" src="<%=basePath%>js/cookie/cookie.js"></script> --%>

<link href="<%=basePath%>js/jquery-easyui-1.7.0/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>js/jquery-easyui-1.7.0/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/login.css" rel="stylesheet" type="text/css" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>登录</title>
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
	            		var url = '<%=basePath%>firstPage/FirstPage.jsp';
	            		window.location.href = url ;
	            	}
	            }
	        });
		}
	}) 



	function errors(event){
		//键盘敲击事件
		var thisId =$(":text:focus").attr("id");
		if(thisId == 'userLoginName'){
			document.getElementById("errors1").style.display="none";
		}else if(thisId == 'userLoginPassword'){
			document.getElementById("errors2").style.display="none";
		}
	}	
	//登录
	function login(){
		var rememberLoginInfo = '0';
		if ($("#rememberLoginInfo").get(0).checked) {
			rememberLoginInfo = '1';
		}
		var userLoginName = $('#userLoginName').val();
		var userLoginPassword = $('#userLoginPassword').val();
		if(userLoginName == null || userLoginName == "" ){
			document.getElementById("errors1").style.display="inline";
			return;
		}
		if(userLoginPassword == null || userLoginPassword == "" ){
			document.getElementById("errors2").style.display="inline";
			return;
		}
		$.ajax({  
            type: "POST",  
            async: false,  
            url: '/theTest2/tUser/loginUser?userLoginName='+userLoginName+'&userLoginPassword='+userLoginPassword+"&rememberLoginInfo="+rememberLoginInfo, 
            contentType:"application/json",
            dataType : "json", 
            success: function (result) { 
            		console.log(result);
            		console.log(result[0].USERLOGINNAME);
            	if(result.length != 1){
            		$.messager.alert('提示', '该账号发生异常，请联系管理员处理 ！', 'info');
            	}else{
            		var url = '<%=basePath%>firstPage/FirstPage.jsp';
            		window.location.href = url ;
            	}
            }
        }); 
	}
	
	function logon(){
		var url = '<%=basePath%>registered.jsp';
		window.location.href = url ;
	}
</script>
<body>
	<form action="userFrom">
		<div>
			<div style="height: 20px">
				<table>
					<tr>
						<td><p id="errors0"> </p></td>
						<td><p id="errors1">请输入正确的账号名。</p></td>
						<td><p id="errors2">请输入正确的密码。</p></td>
						<td><p id="errors3">用户账户或密码错误，请重新输入。</p></td>
					</tr>
				</table>
			</div>
			<div style="top: 50px;">
				<table>	
					<tr>
						<td>账号：</td>
						<td><input type="text" name="userLoginName" id="userLoginName" tabindex="1" autocomplete="off" onkeydown='return errors(event)' placeholder="用户账号"/></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="text" name="userLoginPassword" id="userLoginPassword" tabindex="2" autocomplete="off" onkeydown='return errors(event)' placeholder="密码"/></td>
					</tr>
					<tr>
						<td><a href="#" class="easyui-linkbutton" tabindex="3" onclick="login()">确认</a></td>
					</tr>
					<tr>
						<td style="font-size: 12px">
							<label style="vertical-align:middle;float:left;">
								<input type="checkbox"  tabindex="4" name="rememberLoginInfo" id="rememberLoginInfo" value="1" style="vertical-align:middle"/>&nbsp;一周内自动登录
							</label>
						</td>
					</tr>
					
					<tr>
						<td><a href="#" class="" style='text-decoration:none;font-size: 12px' onclick="logon()">没有账号,立即注册</a></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>