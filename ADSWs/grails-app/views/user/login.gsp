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
<section >
<div>

</div>
<div style="padding-top:50px " id="container1">

<div id="login" >

    <h1 style="align-content: center">Login</h1>

       <g:if test="${flash.message}">
    <div class="message">
        ${flash.message}
    </div>
</g:if>

<g:form method="post" action="handleLogin">


    <table class="tg-wrap">
        <tr>
            <th >   <span class='nameClear'>
                <label for="userName">User Name</label>
            </span>
                <input id="userName" name="userName"/>
                <br /> </th>
            <th rowspan="2"><a class="icon fa-user fa-5x"> </a> </th>
        </tr>
        <tr>
            <td  <span class='nameClear'>
                <label for="password">Password</label>
            </span>
                <input id="password" name="password"/></td>
        </tr>
    </table>




    <br />
    <div class="buttons">
            <g:actionSubmit class ="login" value="Sign in!" action="handleLogin"/>

    </div>

</g:form>

</section>
   </html>