<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <@l.logout />
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <label>
                <input type="text" name="text" placeholder="Enter message">
                <input type="text" name="tag" placeholder="Tag">
                <input type="file" name="file">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit">Add</button>
            </label>
        </form>
    </div>
    <div>List of messages</div>
    <form method="get" action="/main">
        <label>
            <input type="text" name="filter" value="${filter!}">
            <button type="submit">Find</button>
        </label>
    </form>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}" alt="">
                </#if>
            </div>
        </div>
    <#else>
        No messages
    </#list>
</@c.page>
