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
    <title>Edit Role</title>
</head>
<body>
<g:render template="/role/template/navigation" />
<div class="body">
    <h1>Edit Role</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${roleInstance}">
        <div class="errors">
            <g:renderErrors bean="${roleInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form method="post" >
        <input type="hidden" name="id" value="${roleInstance?.id}" />
        <input type="hidden" name="version" value="${roleInstance?.version}" />
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name">Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:roleInstance,field:'name','errors')}">
                        <input type="text" id="name" name="name" value="${fieldValue(bean:roleInstance,field:'name')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="isAdmin">Is Admin:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:roleInstance,field:'isAdmin','errors')}">
                        <g:checkBox name="isAdmin" value="${roleInstance?.isAdmin}" ></g:checkBox>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" value="Update" /></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </div>
    </g:form>
</div>
</body>
</html>