package com.jhl.cms.entity;

import com.jhl.cms.login.vo.UserVo;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 用户对象
 *
 * @author
 */
@Entity
@Table(name = "sys_user")
@Data
public class SysUser extends JpaAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private String username;
    private String password;
    private String name;
    private String role;

    public UserVo toUserVo() {
        String[] access = null;
        if (role.trim().length() > 0) {
            if (role.indexOf(",") > 0) {
                access = role.split(",");
            } else {
                access = new String[]{role};
            }
        }

        return UserVo.newInstance().userId(id)
                .name(name)
                .token(username)
                .access(access)
                .avator("/api/images/avator.png");
    }
}
