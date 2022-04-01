package com.jhl.cms.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 字典
 *
 * @author
 */
@Entity
@Table(name = "sys_dict")
@Data
public class SysDict extends JpaAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private String code;

    private String name;

    private Integer orderValue;

    private String memo;
}
