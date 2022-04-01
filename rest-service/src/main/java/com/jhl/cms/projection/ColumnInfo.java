package com.jhl.cms.projection;

import com.jhl.cms.entity.CmsColumn;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

/**
 * @author
 */
@Projection(name = "columnInfo", types = {CmsColumn.class})
public interface ColumnInfo {
    /**
     * 映射实体id属性
     * @return
     */
    Long getId();

    /**
     * 映射实体code属性
     * @return
     */
    String getCode();

    /**
     * 映射实体name属性
     * @return
     */
    String getName();

    /**
     * 映射实体parent属性
     * @return
     */
    CmsColumn getParent();

    /**
     * 映射实体children属性
     * @return
     */
    List<CmsColumn> getChildren();

    /**
     * 映射实体iconId属性
     * @return
     */
    Long getIconId();

    /**
     * 映射实体orderValue属性
     * @return
     */
    Integer getOrderValue();

    /**
     * 映射实体memo属性
     * @return
     */
    String getMemo();

    /**
     * 映射实体displayFlag属性
     * @return
     */
    Boolean getDisplayFlag();

    /**
     * 映射实体property属性
     * @return
     */
    Integer getProperty();

}
