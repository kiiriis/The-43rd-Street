package com.project.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class UrlManager {

	public boolean checkURL(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("sessionCustomer") != null || session.getAttribute("admin") != null)
			return true;
		return false;
	}

	public boolean adminCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("admin") != null)
			return true;
		return false;
	}
}
