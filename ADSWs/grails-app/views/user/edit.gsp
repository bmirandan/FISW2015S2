<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:45 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit User</title>
</head>
<body>
<g:render template="/user/template/navigation" />
<div class="body">
    <h1>Edit User</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${userInstance?.id}" />
        <input type="hidden" name="version" value="${userInstance?.version}" />
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
                        <label for="contacts">Contacts:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'contacts','errors')}">
                        <g:select name="contacts"
                                  from="${Contact.list()}"
                                  size="5" multiple="yes" optionKey="id"
                                  value="${userInstance?.contacts}" />

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
                        <label for="role">Role:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'role','errors')}">
                        <g:select optionKey="id" from="${Role.list()}" name="role.id" value="${userInstance?.role?.id}" ></g:select>
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
            <span class="button"><g:actionSubmit class="save" value="Update" /></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
        </div>

    </g:form>
    <fieldset>
        <legend>Avatar Upload</legend>

        <g:form action="upload_avatar" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${userInstance?.id}" />
            <input type="hidden" name="version" value="${userInstance?.version}" />
            <label for="avatar">Avatar (16K)</label>
            <input type="file" name="avatar" id="avatar" />
            <div style="font-size:0.8em; margin: 1.0em;">
                For best results, your avatar should have a width-to-height ratio of 4:5.
                For example, if your image is 80 pixels wide, it should be 100 pixels high.
            </div>
            <input type="submit" class="buttons" value="Upload" />
        </g:form>
    </fieldset>
</div>
</body>
</html>
