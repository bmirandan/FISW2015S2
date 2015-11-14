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
    <title>Show User</title>
</head>
<body>
<g:render template="/user/template/navigation" />
<div class="body">
    <h1>Show User</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>


            <tr class="prop">
                <td valign="top" class="name">Id:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'id')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">User Name:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'userName')}</td>

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
                <td valign="top" class="name">Contacts:</td>

                <td  valign="top" style="text-align:left;" class="value">
                    <ul>
                        <g:each var="c" in="${userInstance.contacts}">
                            <li><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Password:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'password')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Role:</td>

                <td valign="top" class="value"><g:link controller="role" action="show" id="${userInstance?.role?.id}">${userInstance?.role?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Confirm Password:</td>

                <td valign="top" class="value">${fieldValue(bean:userInstance, field:'confirmPassword')}</td>

            </tr>

            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${userInstance?.id}" />
            <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </g:form>
    </div>
    <g:if test="${userInstance?.avatar}">
        <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:userInstance?.ident())}" />
    </g:if>
</div>
</body>
</html>