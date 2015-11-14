<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:56 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show Contype</title>
</head>
<body>
<g:render template="/contype/template/navigation" />
<div class="body">
    <h1>Show Contype</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>


            <tr class="prop">
                <td valign="top" class="name">Id:</td>

                <td valign="top" class="value">${fieldValue(bean:contypeInstance, field:'id')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Name:</td>

                <td valign="top" class="value">${fieldValue(bean:contypeInstance, field:'name')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Description:</td>

                <td valign="top" class="value">${fieldValue(bean:contypeInstance, field:'description')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Mask:</td>

                <td valign="top" class="value">${fieldValue(bean:contypeInstance, field:'mask')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Use Mask:</td>

                <td valign="top" class="value">${fieldValue(bean:contypeInstance, field:'useMask')}</td>

            </tr>

            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${contypeInstance?.id}" />
            <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </g:form>
    </div>
    <g:if test="${contypeInstance?.avatar}">
        <img class="avatar" src="${createLink(controller:'contype', action:'avatar_image', id:contypeInstance?.ident())}" />
    </g:if>
</div>
</body>
</html>