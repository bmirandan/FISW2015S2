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
    <title>Show Contact</title>
</head>
<body>
<g:render template="/contact/template/navigation" />
<div class="body">
    <h1>Show Contact</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>


            <tr class="prop">
                <td valign="top" class="name">Id:</td>

                <td valign="top" class="value">${fieldValue(bean:contactInstance, field:'id')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Value:</td>

                <td valign="top" class="value">${fieldValue(bean:contactInstance, field:'value')}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Contype:</td>

                <td valign="top" class="value"><g:link controller="contype" action="show" id="${contactInstance?.contype?.id}">${contactInstance?.contype?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name">Owner:</td>

                <td valign="top" class="value"><g:link controller="user" action="show" id="${contactInstance?.owner?.id}">${contactInstance?.owner?.encodeAsHTML()}</g:link></td>

            </tr>

            </tbody>
        </table>
    </div>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${contactInstance?.id}" />
            <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </g:form>
    </div>
</div>
</body>
</html>