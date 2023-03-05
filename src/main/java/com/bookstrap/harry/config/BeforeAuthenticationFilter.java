package com.bookstrap.harry.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public class BeforeAuthenticationFilter extends UsernamePasswordAuthenticationFilter{

	
	public BeforeAuthenticationFilter() {
		super.setUsernameParameter("memberEmail");  //登入頁面輸入帳號的name
		super.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/member/checklogin", "POST"));
	}

	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
			String memberEmail = request.getParameter("memberEmail");
			System.out.println("attemptAuthenication email" + memberEmail);
			
		return super.attemptAuthentication(request, response);
	}

	
}
