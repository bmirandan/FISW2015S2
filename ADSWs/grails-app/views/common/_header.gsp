<script language="javascript" type="text/javascript">
    function menuhide(menunum)  {
        var currentmenu = document.getElementById("navbody" + menunum);
        currentmenu.style.visibility = 'hidden';
        currentmenu.style.height = '5px';
        currentmenu.style.transparent= 'true';  }
    function menushow(menunum)  {
        var currentmenu = document.getElementById("navbody" + menunum);
        currentmenu.style.visibility = 'visible';
        currentmenu.style.height = 'auto'; }
</script>


<div id="topbar">

    <g:if test="${session.user}">



        <b>${session.user}</b> |
        <g:link controller="user" action="logout">Sign out</g:link> <br />


    </g:if>
    <g:else>
        <g:render template="/common/login"/>
    </g:else>

</div>

<g:if test="${session.user}">
    <div style="float:right;">
        <g:link controller="homepage" action="home">Home</g:link>
    </div>

    <div onmouseover="menushow('1');" onmouseout="menuhide('1');" style="width:87px;float:right;"  >
        <div class="navhead"><a href="" onclick="return false;">Account</a></div>
        <div id="navbody1" style="float: right; width:inherit; text-align:left;">
            <a href="${createLink(controller: 'user', action: 'editprofile')}">Profile</a><br />
            <a href="/products.html">My contacts</a><br />
            <a href="${createLink(controller: 'user', action: 'editpassword')}">Password</a>
        </div>
    </div>

</g:if>