package com.jhl.cms.repository;

import com.jhl.cms.entity.SysUser;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 用户实体存取类
 *
 * @author jiahongliang
 */
public interface SysUserRepository extends JpaRepository<SysUser, Long> {
    /**
     * 根据登录名查找用户
     *
     * @param username
     * @return
     */
    SysUser findFirstByUsername(String username);
}
