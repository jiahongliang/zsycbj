package com.jhl.cms.configuration.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;

import javax.persistence.EntityManagerFactory;
import javax.persistence.metamodel.EntityType;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.function.Consumer;

/**
 * @author jiahongliang
 */
@Configuration
public class DataRestConfiguration {

    @Bean
    public RepositoryRestConfigurer repositoryRestConfigurer() {
        return RepositoryRestConfigurer.withConfig((configuration, registry) -> {
            forEachEntityClass(configuration::exposeIdsFor);
        });
    }

    private void forEachEntityClass(final Consumer<? super Class<?>> consumer) {
        Arrays.stream(DataRestConfiguration.class.getDeclaredFields())
                .filter(f -> {
                    final int modifiers = f.getModifiers();
                    return !Modifier.isStatic(modifiers);
                })
                .filter(f -> EntityManagerFactory.class.isAssignableFrom(f.getType()))
                .map(f -> {
                    f.setAccessible(true);
                    try {
                        return (EntityManagerFactory) f.get(this);
                    } catch (final ReflectiveOperationException roe) {
                        throw new RuntimeException(roe);
                    }
                })
                .flatMap(emf -> emf.getMetamodel().getEntities().stream().map(EntityType::getJavaType))
                .forEach(consumer);
    }

    @Autowired
    EntityManagerFactory entityManagerFactory;
}
