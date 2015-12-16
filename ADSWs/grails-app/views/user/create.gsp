<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:45 AM
--%>

<%@ page import="sec.treasurer.Role" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create User</title>
</head>
<body>
<g:render template="/user/template/navigation" />
<div class="body">
    <h1>Create User</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userName">User Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'userName','errors')}">
                        <input type="text" id="userName" name="userName" value="${fieldValue(bean:userInstance,field:'userName')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName">First Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'firstName','errors')}">
                        <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:userInstance,field:'firstName')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lastName">Last Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'lastName','errors')}">
                        <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:userInstance,field:'lastName')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description">Description:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'description','errors')}">
                        <input type="text" id="description" name="description" value="${fieldValue(bean:userInstance,field:'description')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="password">Password:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                        <input type="text" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="role" >Role:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'role','errors')}">
                        <select name="role.id" id="role.id">
                            <option value="2">UsuarioTest</option>

                        </select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="confirmPassword">Confirm Password:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'confirmPassword','errors')}">
                        <input type="text" name="confirmPassword" id="confirmPassword" value="${fieldValue(bean:userInstance,field:'confirmPassword')}" />
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Create" /></span>
        </div>
    </g:form>
</div>
</body>
</html>
