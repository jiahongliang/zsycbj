package com.jhl.cms.configuration.security;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;

@Component
public class AdminAuthenticationProcessingFilter extends AbstractAuthenticationProcessingFilter {
    public AdminAuthenticationProcessingFilter(CusAuthenticationManager authenticationManager, AdminAuthenticationSuccessHandler authenticationSuccessHandler, AdminAuthenticationFailureHandler authenticationFailureHandler) {
        super(new AntPathRequestMatcher("/login", "POST"));
        this.setAuthenticationManager(authenticationManager);
        this.setAuthenticationSuccessHandler(authenticationSuccessHandler);
        this.setAuthenticationFailureHandler(authenticationFailureHandler);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {
        String loginToken = request.getParameter("loginToken");
        String str = new String(Base64.getDecoder().decode(loginToken), "utf-8");
        JSONObject obj = JSON.parseObject(str);
        String username = obj.getString("userName");
        String password = obj.getString("password");
        String verifyCode = obj.getString("verifyCode");

        UsernamePasswordAuthenticationToken errorToken = new UsernamePasswordAuthenticationToken("", "");

        Object objCode = request.getSession().getAttribute("VerifyCode");
        if (objCode == null) {
            errorToken.setDetails("验证码不正确");
            return errorToken;
        }
        String savedVerifyCode = (String) objCode;
        if (!savedVerifyCode.equals(verifyCode)) {
            errorToken.setDetails("验证码不正确");
            return errorToken;
        }
        Authentication result = null;
        try {
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
            result = this.getAuthenticationManager().authenticate(token);
        } catch (AuthenticationException ex) {
            errorToken.setDetails("用户名或密码不正确");
            return errorToken;
        }
        return result;
    }
}
