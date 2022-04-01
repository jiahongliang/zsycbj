package com.jhl.cms.service;

import com.jhl.cms.login.vo.UserVo;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @author
 */
public interface UserService extends UserDetailsService {
    /**
     * 根据用户登录token获取用户详细信息
     *
     * @param token
     * @return
     */
    UserVo getUserInfo(String token);
}
