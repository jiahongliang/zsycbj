package com.jhl.cms.repository;

import com.jhl.cms.entity.SysDictItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * 字典数据项数据存取类
 *
 * @author
 */
@RepositoryRestResource(path = "dict_item")
public interface SysDictItemRepository extends JpaRepository<SysDictItem, Long> {
}
