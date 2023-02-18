package com.bookstrap.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {
    
//	@Bean
//    public UserDetailsService userDetailsService() {
//        return new ShopmeUserDetailsService();
//    } 
	
	
	    @Bean
	    public BCryptPasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	
//	    @Bean 
//	    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//	       http.authorizeRequests()
//	         .anyRequest().authenticated()
//	         .and().httpBasic();
//	       return http.build();
//	   }
//	@Bean
//    public SecurityFilterChain  filterChain(HttpSecurity http) throws Exception {
//		http.authorizeRequests()
//	      .anyRequest().authenticated()
//	      .and().httpBasic();
//	    return http.build();
//         
//
//		
		//		http.csrf()
//		 .disable()
//		 .authorizeRequests()
//		 .antMatchers(HttpMethod.DELETE)
//		 .hasRole("ADMIN")
//		 .antMatchers("/admin/**")
//		 .hasAnyRole("ADMIN")
//		 .antMatchers("/user/**")
//		 .hasAnyRole("USER", "ADMIN")
//		 .antMatchers("/login/**")
//		 .anonymous()
//		 .anyRequest()
//		 .authenticated()
//		 .and()
//		 .httpBasic()
//		 .and()
//		 .sessionManagement()
//		 .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
//		
//		 http
//	        .authorizeRequests()
//	        .anyRequest()
//	        .authenticated()
//	        .and().formLogin().disable()  // <-- 停用預設登入頁面
//	        .httpBasic(); // <--保留HTTP Basic驗證
//
//		 return http.build();
//		 
//    }
     
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
    	  return (web) -> web.ignoring().antMatchers("/images/**", "/js/**", "/webjars/**");
    }
}
