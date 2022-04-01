package com.jhl.cms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * 信息发布-文章
 *
 * @author
 */
@Entity
@Table(name = "cms_article")
@Data
@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
public class CmsArticle extends JpaAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private Long columnId;

    private Long iconId;

    private String title;

    private String subTitle;

    private String author;

    private String source;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date pubDate;

    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name = "resume", columnDefinition = "Text")
    private String resume;

    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name = "content", columnDefinition = "Text")
    private String content;

    private String url;

    private Integer orderValue;

    /**
     * 栏目的类别，见常量对象
     */
    private Integer columnProperty;
}
