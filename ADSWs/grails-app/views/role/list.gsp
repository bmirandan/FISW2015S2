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
    <title>Role List</title>
</head>
<body>
<g:render template="/role/template/navigation" />
<div class="body">
    <h1>Role List</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" />

                <g:sortableColumn property="name" title="Name" />

                <g:sortableColumn property="isAdmin" title="Is Admin" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${roleInstanceList}" status="i" var="roleInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${roleInstance.id}">${fieldValue(bean:roleInstance, field:'id')}</g:link></td>

                    <td>${fieldValue(bean:roleInstance, field:'name')}</td>

                    <td>${fieldValue(bean:roleInstance, field:'isAdmin')}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${roleInstanceTotal}" />
    </div>
</div>
</body>
</html>