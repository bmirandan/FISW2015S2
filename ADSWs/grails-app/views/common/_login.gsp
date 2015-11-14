<script>
    var yesHandler = function(o) {
        // use create link so we don't have to hardcode context
        var url = "${createLink(controller:'user', action:'loginSuccess')}";
        // async ajax request pass username entered as id parameter
        $.getJSON(url, {userName:$("#userName").val(),password:$('#password').val()}, function(json){
            if(!json.available) {
                if (document.getElementById){
                    var empt = document.getElementById('header_login_error');
                    empt.style.visibility = "inherit";
                    empt.style.height = "auto";
                    $('#password').val("");
                }
                // populate a hidden div on page and fill and display it..
                //$("#somehiddendiv").html("This ID is already taken").show();
            }
            else{
                var pxass =  $('#password').val();
                var un = $('#userName').val();
                window.location="user/handleLogin?userName="+un+"&password="+pxass;
            }

        });
    }
</script>

<gui:dialog
        title="Sign in"
        draggable="true"
        modal="true"
        buttons="[
                [text:'OK', handler: 'yesHandler', isDefault: 'true']
        ]"
        triggers="[show:[type:'link', text:'Sign in!', on:'click']]"
>
    <div id ="header_login_error" class="message" style="visibility: hidden;height:0px;">
        <font color="red">Wrong login or password!</font>
    </div>
    <table>
        <tbody>
        <tr>
            <td>
                <span class='nameClear'>
                    <label for="userName">Login</label>
                </span>
            </td>
            <td>
                <input type="text" id="userName" name="userName"/>
            </td>
        </tr>
        <tr><td>
            <span class='nameClear'>
                <label for="password">Password</label>
            </span>
        </td><td>
            <input type="password" id="password" name="password"/>
        </td></tr>
        </tbody>
    </table>
</gui:dialog>