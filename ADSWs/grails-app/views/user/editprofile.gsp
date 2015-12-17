<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 12/11/2015
  Time: 10:46 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit User</title>
</head>
<body>
<script type="text/javascript">
    // wait for dom to load
    $(function(){
        // set onblur event handler
        $("#save").click(function(){
            // if some username was entered - this == #username
            if ($('#firstName').val() == ""){
                if (document.getElementById){
                    var empt = document.getElementById('header_error');
                    empt.style.visibility = "inherit";
                    empt.style.height = "auto";
                    empt.innerHTML = "<font color='red'>Enter your first name please</font>";
                }
                return false;
            }
            if ($('#lastName').val() == ""){
                if (document.getElementById){
                    var empt = document.getElementById('header_error');
                    empt.style.visibility = "inherit";
                    empt.style.height = "auto";
                    empt.innerHTML = "<font color='red'>Enter your last name please</font>";
                }
                return false;
            }
            // use create link so we don't have to hardcode context
            var fn =  $('#firstName').val();
            var ln =  $('#lastName').val();
            var desc =  $('#description').val();
            window.location="saveprofile?firstName="+fn+"&lastName="+ln+"&description="+desc;
        });



        $("#cancel").click(function(){
            window.history.back();
        });

        $("#upload").click(function(){
            if ($('#avatar').val()=="") {
                return false;
            }
            return true;
        });
    });
</script>
<div class="body">
    <h1>Edit profile</h1>
    <g:set var="user" value="${session.user}" />
    <div class="dialog">
        <div id ="header_error" class="message" style="visibility: hidden;height:0px;">

        </div>

        <table>
            <tbody>
            <tr >
                <td >
                    <label for="firstName">First Name:</label>
                </td>
                <td >
                    <input type="text" id="firstName" name="firstName" value="${user.firstName}"/>
                </td>
            </tr>

            <tr >
                <td >
                    <label for="lastName">Last Name:</label>
                </td>
                <td >
                    <input type="text" id="lastName" name="lastName" value="${user.lastName}"/>
                </td>
            </tr>

            <tr>
                <td >
                    <label for="description">Description:</label>
                </td>
                <td >
                    <textarea id="description" name="description"  >
                        ${user.description} </textarea>
                </td>
            </tr>


            </tbody>
        </table>

        <div class="buttons">
            <span class="button"><input class="save" type="button" value="Save" id="save"></span>
            <span class="button"><input class="delete" type="button" value="Cancel" id="cancel"></span>
        </div>
        <h1>Upload avatar</h1>
        <g:if test="${flash.message}">
            <div class="message">
                ${flash.message}
            </div>
        </g:if>
        <table><tbody><tr><td>
            <g:form action="upload_avatar" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${user.id}" />
                <input type="hidden" name="version" value="${user.version}" />
                <label for="avatar">Avatar (56K)</label>
                <input type="file" name="avatar" id="avatar" />
                <div style="font-size:0.8em; margin: 1.0em;">
                    For best results, your avatar should have a width-to-height ratio of 4:5. <br />
                    For example, if your image is 80 pixels wide, it should be 100 pixels high.
                </div>
                <input type="submit" class="buttons" value="Upload" id="upload" />
            </g:form>
        </td></tr></tbody></table>
    </div>


</body>
</html>