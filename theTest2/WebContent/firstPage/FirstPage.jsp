<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.cookie\jquery.cookie.js"></script>

<link href="<%=basePath%>js/jquery-easyui-1.7.0/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>js/jquery-easyui-1.7.0/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/FirstPang.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
</head>
<script type="text/javascript">

	//退出登录
	function exit(){
		$.ajax({  
	        type: "POST",  
	        async: false,  
	        url: '/theTest2/tUser/exit', 
	        contentType:"application/json",
	        dataType : "json",
	        success: function (result) { 
	           	if(result == 1){
	           		var url = '<%=basePath%>HomeThis.jsp';
	           		window.location.href = url ;
	            }
	        }
	    });
	}
	
	function ceshi(){
		$.ajax({  
            type: "POST",  
            async: false,  
            url: '/theTest2/tUser/ceshi', 
            contentType:"application/json",
            dataType : "json"
		});
	}
	function ceshi1(){
		$.ajax({  
            type: "POST",  
            async: false,  
            url: '/theTest2/tUser/ceshi1', 
            contentType:"application/json",
            dataType : "json"
		});
	}
</script>

<body style="margin:0;padding:0;">

	<div style="height: 50px;width: 50px;background-color:#459df5;">
	
	</div>
	<div style="top: 50px;position: absolute;">
		<form>
			<p>进来了</p>
			<a href="#" class="" style='text-decoration:none;font-size: 12px' onclick="exit()">退出登录</a>
			<a href="#" class="" style='text-decoration:none;font-size: 12px' onclick="ceshi()">ceshi</a>
			<a href="#" class="" style='text-decoration:none;font-size: 12px' onclick="ceshi1()">ceshi1</a>
		</form>
	</div>
</body>
</html>