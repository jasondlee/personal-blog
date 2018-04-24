<#include "header.ftl">
        <div style="float: clear"></div>
        <article class="post" style="border: none;">
          <header class="entry-header">
            <h1 class="title">
              ${content.title}
            </h1>
            <span>
              <time class="pubdate" datetime="${content.date?date?string('dd MMMM yyyy')}">${content.date?date?string.full}</time> 
            </span>
          <div class="entry-content">${content.body?replace(splitter, "")}</div>
          <footer class="entry-footer">
              <div class="tags">
                <span class="title">tags: </span>
                <#if content.tags??>
                    <#list content.tags as tag>
                        <a href="${content.rootpath}tags/${tag}.html">${tag}</a>
                    </#list>
                </#if>
              </div>
            <div id="disqus_thread"></div>
            <script type="text/javascript">
                var disqus_shortname = 'steeplesoft';

                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
          </footer>
        </article>
<#include "footer.ftl">
