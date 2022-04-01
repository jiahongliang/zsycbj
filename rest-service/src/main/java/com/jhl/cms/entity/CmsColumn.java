package com.jhl.cms.entity;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

/**
 * 信息发布-栏目
 *
 * @author
 */
@Entity
@Table(name = "cms_column")
@Data
public class CmsColumn extends JpaAudit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private String code;

    private String name;

    private String enName;

    private Long pid;

    @Formula("(select t.name from cms_column t where t.id = pid)")
    private String parentName;

    @ManyToOne(fetch = FetchType.EAGER,targetEntity = CmsColumn.class)
    @JoinColumn(name = "pid",insertable = false,updatable = false)
    private CmsColumn parent;


    @Fetch(FetchMode.SUBSELECT)
    @OneToMany(
            mappedBy = "parent",
            cascade = CascadeType.ALL,
            targetEntity = CmsColumn.class
    )
    @OrderBy("orderValue ASC")
    private List<CmsColumn> children;

    private Long iconId;

    private Integer orderValue;

    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name = "memo", columnDefinition = "Text")
    private String memo;

    /**
     * 如果属于普通栏目，是否显示
     */
    private Boolean displayFlag;

    /**
     * 栏目属于那种类别，见常量对象
     */
    private Integer property;
}
