package com.jhl.cms.repository;

import com.jhl.cms.entity.MemRegistration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

/**
 * 会员单位数据存储类
 * @author
 */
@RepositoryRestResource(path = "mem-registration")
public interface MemRegistrationRepository extends JpaRepository<MemRegistration, Long> {
    /**
     * 根据完成标记分页查询
     *
     * @param completeFlag
     * @param pageable
     * @return
     */
    @RestResource(path = "complete-flag_page")
    public Page<MemRegistration> findAllByCompleteFlag(@Param("completeFlag") Boolean completeFlag, Pageable pageable);
}
