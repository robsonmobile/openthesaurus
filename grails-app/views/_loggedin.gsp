<g:if test="${session.user}">
    <g:message code="user.successful.login" args="${[session.user.userId.toString()?.encodeAsHTML()]}"/>
    <span class="d">&middot;</span>
    <g:link controller="user" action="logout">Logout</g:link>
</g:if>