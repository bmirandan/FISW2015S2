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
    <title>Contype List</title>
</head>
<body>
<g:render template="/contype/template/navigation" />
<div class="body">
    <h1>Contype List</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" />

                <g:sortableColumn property="name" title="Name" />

                <g:sortableColumn property="description" title="Description" />

                <g:sortableColumn property="mask" title="Mask" />

                <g:sortableColumn property="useMask" title="Use Mask" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${contypeInstanceList}" status="i" var="contypeInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${contypeInstance.id}">${fieldValue(bean:contypeInstance, field:'id')}</g:link></td>

                    <td>${fieldValue(bean:contypeInstance, field:'name')}</td>

                    <td>${fieldValue(bean:contypeInstance, field:'description')}</td>

                    <td>${fieldValue(bean:contypeInstance, field:'mask')}</td>

                    <td>${fieldValue(bean:contypeInstance, field:'useMask')}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${contypeInstanceTotal}" />
    </div>
</div>
</body>
</html>