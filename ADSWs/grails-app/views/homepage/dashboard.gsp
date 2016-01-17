<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 15/12/2015
  Time: 05:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin dashboard</title>
</head>

<body>
<a href="/ADSW/role/create">Create rol  </a>
<h3>Usuarios activar </h3>


    <table>
    <tbody>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>User name</th>
        <th>Autorice</th>
    </tr>
    <g:each in="${userList}" var="p">
        <tr>
        <td>${p.firstName}</td>
        <td>${p.lastName}</td>
        <td>${p.email}</td>
        <td> <g:form  >
            <input value="Enter user name to assign" name="userName">
            <input type="hidden" value = "${p.email}" name = "email" >
        <g:actionSubmit value = "Autorizar" action="setEnable"/>
        </g:form></td>
    </g:each>
    </tr>
    </tbody>
    </table>






</body>
</html>