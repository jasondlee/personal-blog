<#function wanted tags>
    <#assign wanted_tags = [
        "Arquillian",
<#--        "CDI",-->
        "Hibernate",
<#--        "JAX-RS",-->
<#--        "JPA",-->
        "Jakarta EE",
        "Jakarta",
        "Java 8",
        "Java 9",
        "Java EE",
        "Java",
        "Keycloak",
        "MicroProfile",
        "OpenTelemetry",
        "Quarkus",
        "WildFly"
    ]>
    <#assign found=false/>
    <#list wanted_tags as tag>
        <#if tags?seq_contains(tag)>
            <#assign found=true/>
        </#if>
    </#list>
    <#return found>
</#function>
<?xml version="1.0" encoding="utf-8" ?>
<#include "misc.ftl">
<#assign updatedTime = .now>
<feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom">
    <id>${config.site_host}</id>
    <title>${config.site_name}</title>
    <author>
        <name>${config.site_author}</name>
    </author>
    <updated>${updatedTime?iso_local}</updated>
    <link href="${config.site_host}/feed.atom" rel="self" type="application/atom+xml" />
    <link href="${config.site_host}" rel="alternate" type="text/html" />
    <#list published_posts as post>
        <#if wanted (post.tags) >
            <@feed_item_atom post />
        </#if>
    </#list>
</feed>
