package com.bookstrap.harry.controller;

import javax.servlet.http.HttpServletRequest;

public class Utility {
//31:17
		public static String getSiteURL(HttpServletRequest request) {
			String siteURL = request.getRequestURI().toString();
			return siteURL.replace(request.getServletPath(), "");
		
		}
	
	
}
