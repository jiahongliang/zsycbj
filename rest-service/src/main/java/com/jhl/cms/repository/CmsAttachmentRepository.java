package com.jhl.cms.repository;

import com.jhl.cms.entity.CmsAttachment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 附件存取类
 *
 * @author
 */
//@RepositoryRestResource(path = "attachment")
public interface CmsAttachmentRepository extends JpaRepository<CmsAttachment, Long> {
}
