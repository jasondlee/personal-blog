<#include "../templates/header.thyme">
<#include "../templates/pagination.thyme">
<#list published_posts as post>
    <div style="float: clear"></div>
    <article class="post">
        <header class="entry-header">
            <h1 class="title">
                <a href="${content.rootpath}${post.uri}">${post.title}</a>
            </h1>
            <span>
              <time class="pubdate"
                    datetime="${post.date?date?string('dd MMMM yyyy')}">${post.date?date?string.full}</time>
            </span>
        </header>
        <@readmore post/>
        <footer class="entry-footer">
            <div class="tags">

                <span class="title">tags: </span>
                <#if post.tags??>
                    <#list post.tags as tag>
                        <a href="${content.rootpath}tags/${tag}.html">${tag}</a>
                    </#list>
                </#if>
            </div>
        </footer>
    </article>
</#list>
<div style="border-top: 2px solid #2BA6CB;"></div>
<#include "../templates/pagination.thyme">
<#include "../templates/footer.thyme">
