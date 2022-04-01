package com.jhl.cms.repository;

import com.jhl.cms.entity.SysDict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * 字典数据存取类
 *
 * @author
 */
@RepositoryRestResource(path = "dict")
public interface SysDictRepository extends JpaRepository<SysDict, Long> {
}
