package com.jhl.cms.configuration.security;

import org.springframework.data.domain.AuditorAware;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * 审计信息获取类
 *
 * @author
 */
@Component
public class SpringSecurityAuditorAware implements AuditorAware<String> {
    @Override
    public Optional<String> getCurrentAuditor() {
        String username = "admin";
        return Optional.of(username);
    }
}
