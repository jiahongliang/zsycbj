package com.jhl.cms.repository;

import com.jhl.cms.entity.CmsColumn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.List;

/**
 * @author
 */
@RepositoryRestResource(path = "column") //, excerptProjection = ColumnInfo.class
public interface CmsColumnRepository extends JpaRepository<CmsColumn, Long> {
    /**
     * 根据栏目属性查找最上层栏目
     *
     * @param property
     * @return
     */
    @RestResource(path="top-column")
    public List<CmsColumn> findAllByParentIsNullAndPropertyOrderByOrderValue(@Param("property") Integer property);
}
