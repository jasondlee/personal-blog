    <div class="pagination">
        <div class="previous" style="width:50%; float: left">
            <#if (previousFileName??)>
                <a href="${content.rootpath}${previousFileName!'#'}">Previous</a>
            <#else>
                <p>Previous</p>
            </#if>
        </div>
        <div class="next" style="width:50%; float: right; text-align: right">
            <#if (nextFileName??)>
                <a href="${content.rootpath}${nextFileName!'#'}">Next</a>
            <#else>
                <p>Next</p>
            </#if>
        </div>
    </div>