package com.bookstrap.config;

import java.io.IOException;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	 
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.httpBasic().and().csrf().disable().authorizeRequests()
            .antMatchers("/", "/login", "/oauth/**","/member/signin","/**").permitAll()
            
            
            
            .anyRequest()
            .authenticated()
            
            
            .and()
            .formLogin()
            .permitAll()
            
            .and()
            .oauth2Login()
                .loginPage("/member/signin")
                .userInfoEndpoint()
                    .userService(oauthUserService).and()
                    .successHandler(new AuthenticationSuccessHandler() {
                    	 
                        @Override //36:00
                        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                Authentication authentication) throws IOException, ServletException {
                 
                            CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();
                 
                            UserService uService = new UserService();
                            System.out.println("Email: " + oauthUser.getEmail());
                            uService.processOAuthPostLogin(oauthUser.getEmail());
//                            userService.processOAuthPostLogin(oauthUser.getEmail());
                           
                            
                            String mName = oauthUser.getName();
                            
//                          request.setAttribute("mName", mName);
                            request.getRequestDispatcher("/google/get?mName="+ mName).forward(request, response);
                //讓gmail帳號進入之後再新曾基本資料
//                            response.sendRedirect("/Bookstrap/index");
                        }
                    });
    }
     
    @Autowired
    private CustomOAuth2UserService oauthUserService;
     
 
	
}
