<#assign splitter="// Read More">

<#macro readmore post>
<div class="entry-content">
	<#if post.body?contains(splitter)>
		${post.body?keep_before(splitter)}
		<p>
			<a href="${content.rootpath}${post.uri}" style="font-style: italic; font-weight: bold;">Read more...</a>
		</p>
	<#else>
		${post.body}
	</#if>
</div>
</#macro>

<#macro feed_item_atom post>
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
</#macro>

<#macro feed_item_rss post>
	<item>
		<title><#escape x as x?xml>${post.title}</#escape></title>
		<link>${config.site_host}/${post.uri}</link>
		<pubDate>${post.date?string("EEE, d MMM yyyy HH:mm:ss Z")}</pubDate>
		<guid isPermaLink="false">${post.uri}</guid>
		<description>
			<#escape x as x?xml>
				${post.body?keep_before(splitter)}
			</#escape>
		</description>
	</item>
</#macro>
