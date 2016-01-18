<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 13/11/2015
  Time: 10:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>User home</title>


</head>
<body>
<g:if test="${!(session.user)}">
    <%
        String link = "/"
        response.sendRedirect(link);
    %>
</g:if>
<div class="boxo" >
<div class="body;">
    <div style="float:left; width:80%;">
        <h1>Hi ${session.user} !</h1>

        <br />

        <h1>Upload New Publication</h1>
        <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
        <g:uploadForm controller="publication" action="upload">
            <li><input value="Authors" name = "authors" >
                <input value="Magazine" name = "magazine" >
                <input value="Keywords" name = "keywords" >
                <input value="ISBN" name = "isbn" >
                <input value="Editorial" name = "Editorial" >

            <fieldset class="form">
                <input type="file" name="file" />
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="upload" class="save" value="Upload" />
            </fieldset>
            </li>

        </g:uploadForm>


<a href="/ADSW/user/profile" class="button"> Perfil </a>

</div>
</div>
</div>
</body>
</html>