package com.jhl.cms.login.vo;

import lombok.Data;
import org.springframework.security.core.userdetails.User;

/**
 * @author
 */
@Data
public class UserVo {
    private Long user_id;
    private String name;
    private String[] access;
    private String token;
    private String avator;

    private UserVo() {
    }

    public static UserVo newInstance() {
        return new UserVo();
    }

    public UserVo userId(Long userId){
        this.user_id = userId;
        return this;
    }

    public UserVo name(String name) {
        this.name = name;
        return this;
    }

    public UserVo access(String[] access) {
        this.access = access;
        return this;
    }

    public UserVo token(String token) {
        this.token = token;
        return this;
    }

    public UserVo avator(String avator) {
        this.avator = avator;
        return this;
    }
}
