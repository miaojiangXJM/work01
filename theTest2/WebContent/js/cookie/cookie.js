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