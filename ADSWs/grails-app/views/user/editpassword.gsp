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
    <title>Show User</title>
</head>

<body>
<script type="text/javascript">
    // wait for dom to load
    $(function(){
        // set onblur event handler
        $("#save").click(function(){
            // if some username was entered - this == #username
            if ($('#newpassword').val() == ""){
                if (document.getElementById){
                    var empt = document.getElementById('header_error');
                    empt.style.visibility = "inherit";
                    empt.style.height = "auto";
                    empt.innerHTML = "<font color='red'>Enter new password please</font>";
                    return false;
                }
            }
            if (!($('#newpassword').val() == $('#retypepassword').val())){
                if (document.getElementById){
                    var empt = document.getElementById('header_error');
                    empt.style.visibility = "inherit";
                    empt.style.height = "auto";
                    empt.innerHTML = "<font color='red'>Enter and retype new password please</font>";
                    $('#newpassword').val("");
                    $('#retypepassword').val("");
                    return false;
                }
            }
            // use create link so we don't have to hardcode context
            var url = "${createLink(controller:'user', action:'loginSuccess')}";

            // async ajax request pass username entered as id parameter
            $.getJSON(url, {userName:"${session.user.userName}", password:$('#oldpassword').val()}, function(json){
                if(!json.available) {
                    // highlight field so user knows there's a problem
                    if (document.getElementById){
                        var empt = document.getElementById('header_error');
                        empt.style.visibility = "inherit";
                        empt.style.height = "auto";
                        empt.innerHTML = "<font color='red'>Old password is incorrect!</font>";
                        $('#oldpassword').val("");
                    }
                    return false;
                }
                else {
                    var pxass =  $('#newpassword').val();
                    window.location="savepassword?password="+pxass;
                }
            });

        });

        $("#cancel").click(function(){
            window.history.back();
        });
    });
</script>
<div class="body">
    <h1>Change your password</h1>
    <div id ="header_error" class="message" style="visibility: hidden;height:0px;">

    </div>
    <div class="dialog">
        <table >
            <tbody>
            <tr >
                <td ><span class='nameClear'>
                    <label for="oldPassword">Old password:</label></span>
                </td>
                <td>
                    <input type="password" name="oldPassword" id="oldpassword"/>
                </td>
            </tr>
            <tr >
                <td ><span class='nameClear'>
                    <label for="newPassword">New password:</label></span>
                </td>
                <td>
                    <input type="password" name="newPassword" id="newpassword"/>
                </td>
            </tr>
            <tr >
                <td ><span class='nameClear'>
                    <label for="retypePassword">Retype new password:</label></span>
                </td>
                <td>
                    <input type="password" name="retypePassword" id="retypepassword"/>
                </td>
            </tr>
            </tbody></table>
        <div class="buttons">
            <span class="button"><input class="save" type="button" value="Save" id="save"></span>
            <span class="button"><input class="delete" type="button" value="Cancel" id="cancel"></span>

        </div>

    </div>
</body>
</html>