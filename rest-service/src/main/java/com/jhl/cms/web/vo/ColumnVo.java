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

    /**
     * 祖先id，根据父子级关系为先后顺序排列
     */
    private List<Long> forefathersId;
    /**
     * 子孙Id，不包括自己
     */
    private List<Long> descendantsId;

    private List<ColumnVo> children;
}
