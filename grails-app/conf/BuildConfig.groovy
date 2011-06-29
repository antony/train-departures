grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.plugin.repos.discovery.sky= 'http://plugins.id.bskyb.com/svn'
grails.plugin.repos.distribution.sky = 'http://plugins.id.bskyb.com/svn'

//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()
        grailsRepo('http://plugins.id.bskyb.com/svn', 'sky')

        mavenLocal()
        mavenCentral()
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'net.sourceforge.htmlcleaner:htmlcleaner:2.2'
    }
    plugins {
        runtime ':jquery:1.6.1.1', ':jquery-ui:1.8.11'
        runtime ':maven-publisher:latest.integration'
    }
}
