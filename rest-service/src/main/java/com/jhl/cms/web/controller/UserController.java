package com.jhl.cms.web.controller;

import com.jhl.cms.entity.SysUser;
import com.jhl.cms.login.vo.UserVo;
import com.jhl.cms.repository.SysUserRepository;
import com.jhl.cms.service.UserService;
import com.jhl.cms.web.msg.WebResp;
import com.jhl.cms.web.vo.PasswordVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author
 */
@Slf4j
@RestController
@RequestMapping(value = "user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SysUserRepository userRepository;

    @GetMapping("get/{username}")
    public UserVo getUserInfo(@PathVariable(value = "username") String username) {
        UserVo vo = userService.getUserInfo(username);
        return vo;
    }

    @PostMapping("updpwd/{username}")
    public WebResp<String,String> updatePassword(@PathVariable(value = "username") String username, @RequestBody PasswordVo vo) throws Exception {
        SysUser user = userRepository.findFirstByUsername(username);
        if (!user.getPassword().equals(vo.getPrepass())) {
            throw new Exception("用户原密码不正确");
        }
        user.setPassword(vo.getNewpass());
        userRepository.save(user);
        return new WebResp<>();
    }
}
