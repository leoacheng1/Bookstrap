package com.bookstrap.harry.config;

import java.io.IOException;
import java.security.AuthProvider;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.bookstrap.harry.security.MemberUserDetailService;



@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	 //因為@configuration的關係，在建立起本class時間上不同的問題
	private UserService uService;
	
	   @Autowired
	    public WebSecurityConfig(UserService uService) {
	        this.uService = uService;
	    }
	   
	   @Bean
	   public BCryptPasswordEncoder passwoedEncoder() {
		   return new BCryptPasswordEncoder();
	   }
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.httpBasic().and().csrf().disable().authorizeRequests()
        .antMatchers("/","/login","/oauth/**").authenticated()
//        .antMatchers("/member/**").hasAnyAuthority("USER")
        .anyRequest()
        .permitAll()
        
        .and()
        	.formLogin()
//        		.defaultSuccessUrl("/member/main")
//        		.loginPage("/guest/signin")
//        		.failureUrl("/guest/signinerror")
//        .permitAll()
        
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
    }
     
    @Autowired
    private CustomOAuth2UserService oauthUserService;
    
    @Resource
    private MemberUserDetailService userDetailServer;
     
    @Bean
    public DaoAuthenticationProvider authProvider() {
    	DaoAuthenticationProvider authenicationProvider = new DaoAuthenticationProvider();
//    	authenicationProvider.setPasswordEncoder();
    	authenicationProvider.setUserDetailsService(userDetailServer);
    	return authenicationProvider;
    }

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider());
	}
    
    
    
//    private BeforeAuthenticationFilter getMemberFilter() throws Exception {
//    	BeforeAuthenticationFilter filter = new BeforeAuthenticationFilter();
//    	filter.setAuthenticationManager(authenticationManager());
//    	
//    	
//    	
//    	
//    return filter;
//    }
	
}
