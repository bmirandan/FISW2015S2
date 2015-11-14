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
    <title>Contact List</title>
</head>
<body>
<g:render template="/contact/template/navigation" />
<div class="body">
    <h1>Contact List</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" />

                <g:sortableColumn property="value" title="Value" />

                <th>Contype</th>

                <th>Owner</th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${contactInstanceList}" status="i" var="contactInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean:contactInstance, field:'id')}</g:link></td>

                    <td>${fieldValue(bean:contactInstance, field:'value')}</td>

                    <td>${fieldValue(bean:contactInstance, field:'contype')}</td>

                    <td>${fieldValue(bean:contactInstance, field:'owner')}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${contactInstanceTotal}" />
    </div>
</div>
</body>
</html>