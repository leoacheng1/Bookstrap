package com.bookstrap.harry.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


//https://www.codejava.net/frameworks/spring-boot/multiple-login-pages-examples

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	 //因為@configuration的關係，在建立起本class時間上不同的問題
	private UserService uService;
	
	   @Autowired
	    public WebSecurityConfig(UserService uService) {
	        this.uService = uService;
	    }
	   
	   
	   
	
    @Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/index/");
	}




	@Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.headers().frameOptions().sameOrigin();
    	
    	
    	http.httpBasic().and().csrf().disable().authorizeRequests()
            .antMatchers("/", "/oauth/**", "/**").permitAll()
            
            .and()
            .formLogin()
            .permitAll()
            
            .and()
            .oauth2Login()
                .loginPage("/guest/signin")
                .userInfoEndpoint()
                    .userService(oauthUserService).and()
                    .successHandler(new AuthenticationSuccessHandler() {
                    	 
                        @Override 
                        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                Authentication authentication) throws IOException, ServletException {
                 
                            CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();
                 
                            System.out.println("Email: " + oauthUser.getEmail());
                            uService.processOAuthPostLogin(oauthUser.getEmail());
                           
                            
                            String mName = oauthUser.getName();
                            String mEmail = oauthUser.getEmail();
                            
//                          request.setAttribute("mName", mName);
                            request.getRequestDispatcher("/google/get?mEmail="+ mEmail).forward(request, response);
                //讓gmail帳號進入之後再新曾基本資料
//                            response.sendRedirect("/Bookstrap/index");
                        }
                    });
    	
//    	
    }
    
	
	
//	http.authorizeRequests().antMatchers("/").permitAll();
//	
//	http
//    .antMatcher("/member/**")
//    .authorizeRequests()
//    .anyRequest()
//    .hasAuthority("USER")
//	
//	  .and()
//      .formLogin()
//      		.loginPage("/guest/signin")
//	            .usernameParameter("memberEmail")
//	            .loginProcessingUrl("/member/checklogin")
//	            .defaultSuccessUrl("/member/main")
//      .and()
//      .logout()
//      	.logoutUrl("/member/logout")
//      	.logoutSuccessUrl("/index")
     



	@Autowired
    private CustomOAuth2UserService oauthUserService;
     
 
	
}

