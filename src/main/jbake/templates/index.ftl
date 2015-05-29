<#include "header.ftl">
<#include "pagination.ftl">
    <#list posts as post>
        <#if (post.status == "published")>
            <div style="float: clear"></div>
            <article class="post"
              <header class="entry-header">
                <h1 class="title">
                  <a href="${post.uri}">${post.title}</a>
                </h1>
                <span>
                  <time class="pubdate" datetime="${post.date?date?string('dd MMMM yyyy')}">${post.date?date?string.full}</time> 
                </span>
              <div class="entry-content">${post.body?keep_before(splitter)}</div>
              <footer class="entry-footer">
                  <div class="tags">

                    <span class="title">tags: </span>
                    <#if post.tags??>
                        <#list post.tags as tag>
                            <a href="/posts/tags/${tag}">${tag}</a>
                        </#list>
                    </#if>
                  </div>
              </footer>
            </article>
        </#if>
    </#list>
    <div style="border-top: 2px solid #2BA6CB;"></div>
<#include "pagination.ftl">
<#include "footer.ftl">