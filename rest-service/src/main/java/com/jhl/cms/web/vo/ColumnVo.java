package com.jhl.cms.web.vo;

import lombok.Data;

import java.util.List;

/**
 * 对外发布时Column数据项
 *
 * @author
 */
@Data
public class ColumnVo {
    private Long id;
    private String code;
    private String name;
    private String enName;
    private Long parentId;
    private String parentName;
    private Long iconId;
    private Integer orderValue;
    private String memo;

    private List<ColumnVo> children;
}
