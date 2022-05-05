package com.jhl.cms.configuration.security;

import com.jhl.cms.login.vo.UserVo;
import com.jhl.cms.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class AdminAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    private UserServiceImpl userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        User user = (User) userService.loadUserByUsername(username);

        /*PasswordEncoder encoder = new BCryptPasswordEncoder();
        boolean isValid = encoder.matches(password, user.getPassword());*/
        boolean isValid = password.equals(user.getPassword());
        if (!isValid) {
            throw new BadCredentialsException("密码不正确！");
        }
        AbstractAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, "[protected]", user.getAuthorities());
        UserVo uvo = userService.getUserInfo(username);
        token.setDetails(uvo);
        return token;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }

    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println(encoder.encode("admin"));
    }
}
