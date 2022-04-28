package com.jhl.cms.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 会员注册单位
 * @author
 */
@Entity
@Table(name = "mem_registration")
@Data
public class MemRegistration extends JpaAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private String orgname;

    private String linkman;

    private String phone;

    private String ip;

    private Boolean completeFlag = false;
}
