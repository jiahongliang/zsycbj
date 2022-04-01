package com.jhl.cms.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 字典项
 *
 * @author
 */
@Entity
@Table(name = "sys_dict")
@Data
public class SysDictItem extends JpaAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private String dictCode;

    private String code;

    private String name;

    private Integer orderValue;

    private String memo;
}
