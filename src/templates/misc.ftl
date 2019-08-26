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
