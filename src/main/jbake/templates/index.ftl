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
        <div style="clear: both"></div>
        <div id="content">
            <#list posts as post>
                <#if (post.status == "published")>
                    <a href="${post.uri}">
                        <h1>${post.title}</h1>
                    </a>
                    <p>${post.date?string("dd MMMM yyyy")}</p>
                    <p>${post.body?keep_before("&lt;!-- Read More -&#8594;")}</p>
                </#if>
            </#list>
        </div>
<#include "footer.ftl">