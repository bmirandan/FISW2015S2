<%--
  Created by IntelliJ IDEA.
  User: pc-1
  Date: 16/12/2015
  Time: 04:54 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<!--

-->
<html>
<head>
    <title>Perfil Usuario</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}">
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->



</head>
<body>

<!-- Header -->
<div id="header">

    <div class="top">

        <!-- Logo -->
        <div id="logo">
            <span class="image avatar48"><img src= "${resource(dir: 'images', file: 'avatar.jpg')}" /></span>
            <h1 id="title">${session.user } </h1>
            <p> ${session.user.role.name}</p>
        </div>

        <!-- Nav -->
        <nav id="nav">

            <ul>
                <li><a href="#editProfile" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Editar perfil</span></a></li>
                <li><a href="#NOobligatorio" id="adcional" class="skel-layers-ignoreHref"><span class="icon fa-user">Información adicional</span></a></li>

            </ul>

        </nav>

    </div>

    <div class="bottom">

        <!-- Social Icons -->
        <ul class="icons">
            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
            <li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
        </ul>

    </div>

</div>

<!-- Main -->
<div id="main">

    <!-- Intro -->
    <section id="top" class="one dark cover">
        <div class="container">

            <header>
                <h2 class="alt">Bienvenido! a <strong>Labmmba</strong>, aquí puede  <strong>visualizar</strong> tu perfil, <strong>editar</strong> información.
            y <strong>subir</strong> documentos </h2>
            </header>



        </div>
    </section>

    <!-- Portfolio -->

    <!-- About Me -->

<section id="editProfile">

    <header>
        <h2>Editar Perfil Usuario</h2>
    </header>
<h2>Información Obligatoria</h2>
    <h3>Cargo en el laboratorio</h3>
    <g:form action="updateRol" method="post" >
        <div>
                <tbody>
                <g:select optionKey="id" from="${roles}" name="role" value="${roles.id}" >
                </g:select>


                </tbody>
        </div>
        <div class="buttons">
            <input  type="submit" value="update" />
        </div>
        <hr  hspace="20" >

        <h3>Nombre Completo</h3>
    </g:form>

     <div>
        <table>
            <tbody>
     <g:form  action="updateName" method="post"  >
        <li><input value="Nombres" name = "userName" >
         <input value="Apellidos" name = "userLast" >
        </li>
         </tbody>
</table>
         <div class="buttons">
             <input  type="submit" value="update" />
         </div>
     </g:form >

    </div>
<div>

<hr>

    <h3>Area de Investigación</h3>
    <g:form action="updateArea" method="post" >
        <div>
            <table>
                <tbody>
                <g:select optionKey="id" from="${areas}" name="harea" value="${areas.id}" >

                </g:select>


                </tbody>
            </table>
        </div>
        <div class="buttons">
            <input  type="submit" value="update" />
        </div>
        <hr  hspace="20" >

    </g:form>



</div>

</section>


    <section id="NOobligatorio">
        <h2> Información Adicional</h2>

        <h3>Publicaciones en revistas científicas</h3>


        <g:form action="setMagazine" method="post" >
            <div>
                <table>
                    <tbody>
                    <tr>
                    <h4> Elija Área</h4>
                    <tr class="prop">
                    <g:select optionKey="id" from="${areas}" name="harea" value="${areas.id}" >
                    </g:select>
                    </tr>

                    </td>

                    <li>
                        <input value="Nombre articulo" name = "Name" >
                        <input value="Nombre revista" name = "magaName" >
                        <input value="Autor1 Autor2" name = "autorNames" >

                    </li>
                    <li>
                        <input value="keyword1 keyword2" name = "keywords" >
                        <input value="Año" name = "year" >
                        <input value="Link" name = "magaLink" >
                    </li>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <input  type="submit" value="update" />
            </div>
            <hr  hspace="20" >

        </g:form>


</div>

    </section>

</div>

<!-- Footer -->
<div id="footer">

    <!-- Copyright -->
    <ul class="copyright">
        <li>&copy; Labmmba. All rights reserved.</li><li>Design: G02 FISW2015-2 </li>
    </ul>

</div>

<!-- Scripts -->
<script src=""${resource(dir: 'assets/js', file: 'jquery.min.js')}></script>
<script src=""${resource(dir: 'assets/js', file: 'jquery.scrolly.min.js')}></script>
<script src=""${resource(dir: 'assets/js', file: 'jquery.scrollzer.min.js')}></script>
<script src=""${resource(dir: 'assets/js', file: 'skel.min.js')}></script>
<script src=""${resource(dir: 'assets/js', file: 'main.js')}></script>

<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->


</body>
</html>