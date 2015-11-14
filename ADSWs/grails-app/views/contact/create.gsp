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
    <title>Create Contact</title>
</head>
<body>
<g:render template="/contact/template/navigation" />
<div class="body">
    <h1>Create Contact</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${contactInstance}">
        <div class="errors">
            <g:renderErrors bean="${contactInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="value">Value:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'value','errors')}">
                        <input type="text" id="value" name="value" value="${fieldValue(bean:contactInstance,field:'value')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="contype">Contype:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'contype','errors')}">
                        <g:select optionKey="id" from="${Contype.list()}" name="contype.id" value="${contactInstance?.contype?.id}" ></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="owner">Owner:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contactInstance,field:'owner','errors')}">
                        <g:select optionKey="id" from="${User.list()}" name="owner.id" value="${contactInstance?.owner?.id}" ></g:select>
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
