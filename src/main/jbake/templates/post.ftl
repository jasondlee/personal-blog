<#include "header.ftl">
    <div class="page-header">
        <h1><#escape x as x?xml>${content.title}</#escape></h1>
    </div>

    <p><em>${content.date?string("dd MMMM yyyy")}</em></p>

    <p>${content.body?replace("&lt;!-- Read More -&#8594;", "")}</p>

    <hr />
<#include "footer.ftl">
