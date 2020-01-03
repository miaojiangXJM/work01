package com.tgb.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tgb.web.controller.entity.User;
import com.tgb.web.controller.service.IUserManager;


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
		//登录
		List list = userManager.loginUser(request,user);
		List<Map<String, Object>> lists = new ArrayList<Map<String,Object>>();
		System.out.println("确认自动登录:"+request.getParameter("rememberLoginInfo"));
		long  a= System.currentTimeMillis();
		System.out.println(a);
		
		if(list!=null && !list.isEmpty()){
			
			Object[] obj = (Object[])list.get(0);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("USERID", obj[0]);
			map.put("USERLOGINNAME", obj[1]);
			lists.add(map);
			
			//判断是否增将用户信息加到cookie里
			if("1".equals(request.getParameter("rememberLoginInfo"))) {
				Cookie cookieNane = new Cookie("userLoginName", request.getParameter("userLoginName"));
				cookieNane.setPath("/");
				cookieNane.setMaxAge(3600*24*7);
				Cookie cookiePassword = new Cookie("userLoginPassword", request.getParameter("userLoginPassword"));
				cookiePassword.setPath("/");
				cookiePassword.setMaxAge(3600*24*7);
				Cookie cookieRememberLoginInfo = new Cookie("rememberLoginInfo", request.getParameter("rememberLoginInfo"));
				cookieRememberLoginInfo.setPath("/");
				cookieRememberLoginInfo.setMaxAge(3600*24*7);
				System.out.println("增加cookie信息--账号："+request.getParameter("userLoginName")+",密码："+
						request.getParameter("userLoginPassword")+"确认自动登录："+request.getParameter("rememberLoginInfo"));
				//Cookie添加账号
				response.addCookie(cookieNane);			
				response.addCookie(cookiePassword);
				response.addCookie(cookieRememberLoginInfo);
			}
		}
		return lists;
	}
	
	//退出登录
	@RequestMapping("/exit")
	public @ResponseBody String exit(HttpServletRequest request,User user,HttpSession session,HttpServletResponse response){
		//清除cookie中的账号密码等信息
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
	
	@RequestMapping("/ceshi1")
	public @ResponseBody List<List<Integer>> ceshi1(HttpServletRequest request){
		//三数之和新
		int[] nums = new int[]{-1, 0, 1, -2, -1, 2 , -3 , -3, 6};
		Arrays.sort(nums);
		List <List <Integer>> result = new ArrayList<>(); 
		for(int i= 0;i<nums.length-2;i++) {
			if (i>=1&&nums[i] == nums[i-1]) {
				continue;
			}
			int left = i+1;
			System.out.println("起始left:"+nums[left]);
			int right = nums.length-1;	
			System.out.println("起始right:"+nums[right]);
			while(left<right) {
				System.out.println("当前left:"+nums[left]);
				System.out.println("当前right:"+nums[right]);
				int sum=nums[i]+nums[right]+nums[left];
				System.out.println("nums[i]:"+nums[i] + ","+"nums[right]:"+nums[right] + ","+"nums[left]:"+nums[left] );
				if(sum == 0) {
					result.add(Arrays.asList(nums[i],nums[right],nums[left]));
					while(left+ 1< right && nums[left] == nums[left+1]) {
						left++;
					}
					while(left-1 > left && nums[left] == nums[left-1]) {
						right--;
					}
					left++;
					right--;
				}else if(sum > 0){
					right--;
				}else {
					left++;
				}
			}
		}
		System.out.println(result);
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
