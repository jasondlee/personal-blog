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
    <entry>
        <id>${config.site_host}/${post.uri}</id>
        <title><#escape x as x?xml>${post.title}</#escape></title>
        <updated>${post.date?datetime?iso_local}</updated>
        <published>${post.date?datetime?iso_local}</published>
        <link href="${config.site_host}/${post.uri}" rel="alternate" type="text/html" />
        <author>
            <name><#if post.author??>${post.author}<#else>${config.site_author}</#if></name>
        </author>
        <#if post.tags??>
        <#list post.tags as tag>
        <category term="${tag}"></category>
        </#list>
        </#if>
        <summary>
            <![CDATA[
                ${post.body?keep_before(splitter)}
            ]]>
        </summary>
        <content type="html">
        </content>
    </entry>
    </#list>
</feed>