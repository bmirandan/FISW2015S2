dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    username = "root"
    password = "1!2B3e.4"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings

        environments {
            development {
                dataSource {
                    dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
                    url = "jdbc:mysql://localhost/sec_treasurer?useUnicode=yes&characterEncoding=UTF-8"
                    username = "root"
                    password = "1!2B3e.4"
                }
            }
            test {
                dataSource {
                    dbCreate = "update"
                    url = "jdbc:mysql://localhost/sec_treasurer_prod?useUnicode=yes&characterEncoding=UTF-8"
                    username = "root"
                    password = "1!2B3e.4"
                }
            }
            production {
                dataSource {
                    dbCreate = "update"
                    url = "jdbc:mysql://localhost/sec_treasurer_prod?useUnicode=yes&characterEncoding=UTF-8"
                    username = "root"
                    password = "1!2B3e.4r"
                }
            }

    }

