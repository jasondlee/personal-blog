<#include "header.ftl">
    <div class="pagination">
        <div class="previous" style="width:50%; float: left">
            <#if (previousFileName??)>
                <a href="${previousFileName}">Previous</a>
            <#else>
                <p>Previous</p>
            </#if>
        </div>
        <div class="next" style="width:50%; float: right; text-align: right">
            <#if (nextFileName??)>
                <a href="${nextFileName}">Next</a>
            <#else>
                <p>Next</p>
            </#if>
        </div>
    </div>
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
                            <a href="${content.rootpath}/posts/tags/${tag}">${tag}</a>
                        </#list>
                    </#if>
                  </div>
              </footer>
            </article>
        </#if>
    </#list>
<#include "footer.ftl">