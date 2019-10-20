package com.tgb.web.controller.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tgb.web.controller.entity.User;

public interface IUserDao {
	
	public void addUser(HttpServletRequest request,User user);

	public List loginUser(HttpServletRequest request, User user);

}
