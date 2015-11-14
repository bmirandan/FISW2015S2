
<h1>ADMIN ZONE</h1>
<p style="margin-left:20px;">Please, think what are you doing!</p>
<br />
<table><tbody><tr><td>
    <div class="dialog" style="margin-left:20px;width:60%;">
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses}">
                <li class="controller" style="padding:4px;"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
    </div>
</td></tr></tbody></table>