<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 13/11/2015
  Time: 10:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User home</title>


</head>
<body>
<g:if test="${!(session.user)}">
    <%
        String link = "/"
        response.sendRedirect(link);
    %>
</g:if>
<div class="body;">
    <div style="float:left; width:80%;">
        <h1>Hi ${session.user} !</h1>

        <br />

        <g:if test ="${session.user?.role.isAdmin}">
            <g:render template="/common/admin" />
        </g:if>
    </div>

    <div style="float:right; width:20%; text-align:right;">
        <g:if test="${session.user.avatar}">
            <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:session.user.id)}" />
        </g:if>
    </div>




</div>
</body>
</html>