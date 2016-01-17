<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:48 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title> Register </title>
</head>
<body>
<div class="body"style="margin: auto;  width: 60%;padding: 50px;
">
<h1>Register information </h1>
</div>
<div class="body" style="margin: auto;  width: 60%;
padding: 10px ; border: 2px crimson solid">

    <h1> information successfully sent !</h1>

    <p style="padding-top: 3px"> Wait until Administrator or Director confirms your entrance to the plataform, check your email ! </p>

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>




            <tr class="prop">
                <td valign="top" class="name">User Name:</td>

                <td valign="top" class="value">  </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">First Name:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'firstName')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Last Name:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'lastName')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Description:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'description')}</td>

            </tr>


            <tr class="prop">
                <td valign="top" class="name">Password:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'password')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Role:</td>

                <td valign="top" class="value"><g:link controller="role" action="show" id="${userInstance?.role?.id}">${userInstance?.role?.encodeAsHTML()}</g:link></td>

            </tr>


            </tbody>
        </table>
    </div>


</div>
</body>
</html>