package com.jhl.cms.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 信息发布-附件
 *
 * @author
 */
@Entity
@Table(name = "cms_attachment")
@Data
public class CmsAttachment extends JpaAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "increment", strategy = "increment")
    private Long id;

    private String fileName;

    private String filePath;

    private String contentType;

    private String extName;

    private String originName;
}
