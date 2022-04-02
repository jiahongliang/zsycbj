package com.jhl.cms.repository;

import com.jhl.cms.entity.CmsArticle;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.lang.Nullable;

import java.util.List;

/**
 * 文章实体存取类
 *
 * @author
 */
@RepositoryRestResource(path = "article")
public interface CmsArticleRepository extends JpaRepository<CmsArticle, Long> {
    /**
     * 根据columnProperty属性查询，不分页
     *
     * @param columnProperty
     * @return
     */
    @RestResource(path = "column-property")
    public List<CmsArticle> findAllByColumnPropertyOrderByIdDesc(@Param("value") Integer columnProperty);

    /**
     * 根据columnProperty属性查询，并根据title模糊搜索，分页
     *
     * @param title
     * @param columnProperty
     * @param pageable
     * @return
     */
    @RestResource(path = "title_column-property_page")
    public Page<CmsArticle> findByTitleLikeAndColumnProperty(@Param("title") String title, @Param("columnProperty") Integer columnProperty, Pageable pageable);

    /**
     * 根据columnProperty属性查询，分页
     *
     * @param columnProperty
     * @param pageable
     * @return
     */
    @RestResource(path = "column-property_page")
    public Page<CmsArticle> findByColumnProperty(@Param("columnProperty") Integer columnProperty, Pageable pageable);

    /**
     * 根据栏目id查询文章列表
     *
     * @param columnId
     * @param pageable
     * @return
     */
    @RestResource(path = "column-id_page")
    public Page<CmsArticle> findByColumnId(@Param("columnId") Long columnId, Pageable pageable);

    /**
     * 根据多个栏目id查询文章列表
     *
     * @param columnIds
     * @param pageable
     * @return
     */
    @RestResource(path = "column-ids_page")
    public Page<CmsArticle> findAllByColumnIdIn(@Param("columnIds") Long[] columnIds, Pageable pageable);

    /**
     * 根据栏目id和标题查询文章列表
     *
     * @param columnId
     * @param title
     * @param pageable
     * @return
     */
    @RestResource(path = "column-id_title_page")
    public Page<CmsArticle> findByColumnIdAndTitleLike(@Param("columnId") Long columnId, @Param("title") String title, Pageable pageable);

}
