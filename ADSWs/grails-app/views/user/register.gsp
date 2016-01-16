<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:45 AM
--%>

<%@ page import="sec.treasurer.Investigation_Area; sec.treasurer.Role" contentType="text/html;charset=UTF-8" %>
<html xmlns:http="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Sign Up</title>
</head>
<section>
<div style="background-image: url(..//images/dark_tint.png),
url( http://www.wallpaperup.com/uploads/wallpapers/2015/01/17/589865/f6ff54aa955b85c6717d114da115e66a.jpg);
background-size: cover;
background-position: center center;

padding: 1em 0em 1em;
text-align: center;" class="body">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list" />
        </div>
    </g:hasErrors>
<div id="login" class="dialog">
    <g:form action="save" method="post" >

            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="email" >email</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'email','errors')}">
                        <input type="text" id="email" name="email" value="${fieldValue(bean:userInstance,field:'email')}"/>
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
                        <label for="password">Password:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:userInstance,field:'password','errors')}">
                        <input type="text" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>
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
        <input type="hidden" name="userName" value="nulle">
        <input type="hidden" name="description" value="nulle">
        <input type="hidden" name="area.id" value="5">
        <input type="hidden" name="role.id" value="8">
        <div style="padding-top:10px; align:right">
            <input class="save" type="submit" value="Register" />

        </div>

    </g:form>



</divstyle>

</div>
    </section>
</body>
</html>
