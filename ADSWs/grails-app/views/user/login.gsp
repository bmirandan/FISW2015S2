<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 13/11/2015
  Time: 10:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <style>	#princ {
        width: 300px;
        margin: 300px;
        height: auto;
        text-align: center;
    } #princ2 {
                         width: 400px;
                         margin: 30px;
                         height: 300px;
                         text-align: center;
                     }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Log in</title>
</head>
<body>

<div>
<g:if test="${flash.message}">
    <div class="message">
        ${flash.message}
    </div>
</g:if>
<p>
    Welcome, Enter your login and password.
</p>
<g:form method="post" action="handleLogin">

    <span>
        <label for="userName">Sign In</label>
    </span>

    <div id="princ2">
        <span class='nameClear'>
            <label for="userName">User Name</label>
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
    </div>
</g:form>

</div>
</body></html>