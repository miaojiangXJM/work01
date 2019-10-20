package com.tgb.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tgb.web.controller.entity.User;
import com.tgb.web.controller.service.IUserManager;

import jdk.nashorn.internal.runtime.regexp.joni.encoding.ObjPtr;


@Controller
@RequestMapping(value="/tUser")
public class TUserController {

	@Resource(name="userManager")
	private IUserManager userManager;
	
	//注册
	@RequestMapping("/addUser")
	public String addUser(HttpServletRequest request,User user){
		userManager.addUser(request,user);
		return "/firstPage/FirstPage";
	}
	//登录
	@RequestMapping("/loginUser")
	public @ResponseBody List loginUser(HttpServletRequest request,User user,HttpSession session,HttpServletResponse response){
		List list = userManager.loginUser(request,user);
		List<Map<String, Object>> lists = new ArrayList<Map<String,Object>>();
		System.out.println(request.getParameter("rememberLoginInfo"));
		if(list!=null && !list.isEmpty()){
			
			Object[] obj = (Object[])list.get(0);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("USERID", obj[0]);
			map.put("USERLOGINNAME", obj[1]);
			lists.add(map);
			
			if("1".equals(request.getParameter("rememberLoginInfo"))) {
				System.out.println("增加cookie");
				Cookie cookieNane = new Cookie("userLoginName", request.getParameter("userLoginName"));
				cookieNane.setPath("/");
				cookieNane.setMaxAge(3600*24*7);
				Cookie cookiePassword = new Cookie("userLoginPassword", request.getParameter("userLoginPassword"));
				cookiePassword.setPath("/");
				cookiePassword.setMaxAge(3600*24*7);
				Cookie cookieRememberLoginInfo = new Cookie("rememberLoginInfo", request.getParameter("rememberLoginInfo"));
				cookieRememberLoginInfo.setPath("/");
				cookieRememberLoginInfo.setMaxAge(3600*24*7);
				response.addCookie(cookieNane);			//Cookie添加账号
				response.addCookie(cookiePassword);
				response.addCookie(cookieRememberLoginInfo);
			}
		}
		return lists;
	}
	
	@RequestMapping("/exit")
	public @ResponseBody String exit(HttpServletRequest request,User user,HttpSession session,HttpServletResponse response){
		Cookie cookieNane = new Cookie("userLoginName", null);
		cookieNane.setMaxAge(0);
		cookieNane.setPath("/");
		Cookie cookiePassword = new Cookie("userLoginPassword", null);
		cookiePassword.setPath("/");
		cookiePassword.setMaxAge(0);
		Cookie cookieRememberLoginInfo = new Cookie("rememberLoginInfo", null);
		cookieRememberLoginInfo.setPath("/");
		cookieRememberLoginInfo.setMaxAge(0);
		response.addCookie(cookieNane);			//Cookie添加账号
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberLoginInfo);
		String a = "1";
		return a;
	}
	
}
