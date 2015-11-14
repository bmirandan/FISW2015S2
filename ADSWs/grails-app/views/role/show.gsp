<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:51 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show Role</title>
</head>
<body>
<g:render template="/role/template/navigation" />
<div class="body">
    <h1>Show Role</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>


            <tr class="prop">
                <td valign="top" class="name">Id:</td>

                <td valign="top" class="value">${fieldValue(bean:roleInstance, field:'id')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Name:</td>

                <td valign="top" class="value">${fieldValue(bean:roleInstance, field:'name')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Is Admin:</td>

                <td valign="top" class="value">${fieldValue(bean:roleInstance, field:'isAdmin')}</td>

            </tr>

            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${roleInstance?.id}" />
            <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </g:form>
    </div>
</div>
</body>
</html>