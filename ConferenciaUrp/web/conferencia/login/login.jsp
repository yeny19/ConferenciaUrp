<%-- 
    Document   : login
    Created on : 21/04/2019, 12:42:54 PM
    Author     : Lenovo
--%>

<%@page import="comun.Parametros"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);

    String alerta = "";
    if (request.getAttribute("mensaje") != null) {
        alerta = (String) request.getAttribute("mensaje");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Conferencias URP</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/componentes/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/componentes/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/componentes/Ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/componentes/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/componentes/dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Javascript -->
        <script src="<%=request.getContextPath()%>/componentes/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/componentes/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/componentes/dist/js/adminlte.min.js"></script>
        <script src="<%=request.getContextPath()%>/conferencia/login/loginJS.js" type="text/javascript"></script>
        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-green-light sidebar-mini">
        <div id="navegador">
            <div class="container-fluid" >
                <header class="main-header">
                    <a class="logo">
                        <span class="logo-mini"><b class="fa fa-address-book-o"></b>URP</span>
                        <span class="logo-lg"><b>Conferencias </b> URP </span>
                    </a>
                    <nav class="navbar navbar-static-top">
                        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                            <span class="sr-only">Toggle navigation</span>
                        </a>
                        <div class="navbar-custom-menu">
                            <ul class="nav navbar-nav">
                                <li class="dropdown user user-menu" onclick="javascript:abrirLogin();">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <img src="<%=request.getContextPath()%>/componentes/dist/img/urp.png" class="user-image" alt="User Image">
                                        <span class="hidden-xs">Iniciar Sesión</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
            </div>
        </div>

        <!---modal login-->
        <div class="modal modal-success fade" id="modal-success">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Bienvenidos:</h4>
                    </div>
                    <div class="modal-body">
                        <div class="user-header text-center">
                            <img src="<%=request.getContextPath()%>/componentes/dist/img/urp.png" class="img-circle" alt="User Image" style="width: 100px;">
                            <p class="text-center">Universidad  Ricardo Palma

                            </p>
                            <p class="text-center">
                                <small class="text-center">Autentificación</small>
                            </p>
                        </div>
                        <div class="user-body">
                            <div class="row">
                                <form class="form-group" name="frm_acceso" method="post" accept-charset="UTF-8" action="/login">
                                    <div class="col-xs-12 text-center">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input type="text" value="admin" name="txtUsuario" class="form-control text-center" placeholder="Usuario">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 text-center " style="margin-top: 5px;">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                            <input type="password" value="329149900" name="txtClave" class="form-control text-center" placeholder="Contraseña">
                                        </div>
                                    </div>
                                    <div class="col-xs-12 text-center" style="margin-top: 5px;" id="">
                                        <div class="pull-left">
                                            <button type="button" class="btn btn-default btn-flat" onclick="javascript:f_session();">Iniciar Sesión</button>
                                        </div>
                                        <div class="pull-right">
                                            <button type="button" class="btn btn-default btn-flat">Cerrar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer small text-center">
                        <div align="center"><h3><span id="miAlerta"><%=alerta%></span></h3></div> 
                        <small class="text-center">Derechos Reservados &COPY; CBDLC</small>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
    </body>
</html>
