package com.jhl.cms.service.impl;

import com.jhl.cms.entity.SysUser;
import com.jhl.cms.login.vo.UserVo;
import com.jhl.cms.repository.SysUserRepository;
import com.jhl.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户服务类
 *
 * @author
 */
@Service("userService")
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
    @Autowired
    private SysUserRepository userRepository;

    /**
     * 获取用户登录信息
     *
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser user = userRepository.findFirstByUsername(username);
        if (user != null) {
            List<SimpleGrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(user.getRole()));
            return new User(username, user.getPassword(), authorities);
        }
        throw new UsernameNotFoundException("未找到对应的用户");
    }


    /**
     * 根据用户登录token获取用户详细信息
     *
     * @param token
     * @return
     */
    @Override
    public UserVo getUserInfo(String token) {
        SysUser user = userRepository.findFirstByUsername(token);
        if (user == null) {
            return UserVo.newInstance();
        }
        return user.toUserVo();
    }
}
