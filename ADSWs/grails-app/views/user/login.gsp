<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 13/11/2015
  Time: 10:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User List</title>
</head>
<body>
<g:if test="${flash.message}">
    <div class="message">
        ${flash.message}
    </div>
</g:if>
<p>
    Welcome, Enter your login and password.
</p>
<g:form method="post" action="handleLogin">
    <span class='nameClear'>
        <label for="userName">Sign In</label>
    </span>
    <input type="text" id="userName" name="userName"/>
    <br />
    <span class='nameClear'>
        <label for="password">Password</label>
    </span>
    <input type="password" id="password" name="password"/>
    <br />
    <div class="buttons">
        <span class="button">

            <g:actionSubmit class ="login" value="Sign in!" action="handleLogin"/>
        </span>
    </div>
</g:form>
</body></html>