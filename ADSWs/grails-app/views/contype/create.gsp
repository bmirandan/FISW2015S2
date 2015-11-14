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
    <title>Create Contype</title>
</head>
<body>
<g:render template="/contype/template/navigation" />
<div class="body">
    <h1>Create Contype</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${contypeInstance}">
        <div class="errors">
            <g:renderErrors bean="${contypeInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name">Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contypeInstance,field:'name','errors')}">
                        <input type="text" id="name" name="name" value="${fieldValue(bean:contypeInstance,field:'name')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description">Description:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contypeInstance,field:'description','errors')}">
                        <input type="text" id="description" name="description" value="${fieldValue(bean:contypeInstance,field:'description')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="mask">Mask:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contypeInstance,field:'mask','errors')}">
                        <input type="text" id="mask" name="mask" value="${fieldValue(bean:contypeInstance,field:'mask')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="useMask">Use Mask:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contypeInstance,field:'useMask','errors')}">
                        <g:checkBox name="useMask" value="${contypeInstance?.useMask}" ></g:checkBox>
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