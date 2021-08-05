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
        <@feed_item_atom post />
    </#list>
</feed>
