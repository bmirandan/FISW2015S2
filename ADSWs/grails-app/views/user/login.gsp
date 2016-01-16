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
    <title>Log in</title>
</head>
<div id="container1">

<h1 style="align-content: center">Ingresa tus datos</h1>
<section >

<div id="login">
<g:if test="${flash.message}">
    <div class="message">
        ${flash.message}
    </div>
</g:if>

<g:form method="post" action="handleLogin">



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
            <g:actionSubmit class ="login" value="Sign in!" action="handleLogin"/>

    </div>

</g:form>

</section>
   </html>