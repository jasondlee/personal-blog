<#include "header.ftl">
    <article class="post" style="border: none;">
      <header class="entry-header">
        <h1 class="title">
          ${content.title}
        </h1>
        <span>
          <time class="pubdate" datetime="${content.date?date?string('dd MMMM yyyy')}">${content.date?date?string.full}</time> 
        </span>
      <div class="entry-content">${content.body?replace(splitter, "")}</div>
    </article>
<#include "footer.ftl">