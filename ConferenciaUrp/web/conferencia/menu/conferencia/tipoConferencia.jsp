<%-- 
    Document   : login
    Created on : 21/04/2019, 12:42:54 PM
    Author     : Lenovo
--%>

<%@page import="dto.dtoTipoConferencia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.dtoUsuario"%>
<%@page import="comun.Parametros"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);

    dtoUsuario dtoUsuario = (dtoUsuario) session.getAttribute("usuario");
    ArrayList listaTC = null;

    Object countTC = request.getAttribute("countTC");

    if (request.getAttribute("listaTC") != null) {
        listaTC = (ArrayList) request.getAttribute("listaTC");
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
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Javascript -->
        <script src="<%=request.getContextPath()%>/componentes/jquery/dist/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/componentes/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/componentes/dist/js/adminlte.min.js"></script>
        <script src="<%=request.getContextPath()%>/conferencia/login/loginJS.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/conferencia/menu/conferencia/conferenciaJS.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/componentes/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/componentes/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-green sidebar-mini">

        <div id="navegador">
            <div class="container-fluid">
                <header class="main-header">
                    <a href="#" class="logo">
                        <span class="logo-mini">URP</span>
                        <span class="logo-lg">U. Ricardo Palma</span>
                    </a>
                    <nav class="navbar navbar-static-top">
                        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                            <span class="sr-only">Toggle navigation</span>
                        </a>

                        <div class="navbar-custom-menu">
                            <ul class="nav navbar-nav">

                                <li class="dropdown user user-menu">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <img src="<%=request.getContextPath()%>/componentes/dist/img/urp.png" class="user-image" alt="User Image">
                                        <span class="hidden-xs"><%=dtoUsuario.getCU_USUARIO()%></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li class="user-header">
                                            <img src="<%=request.getContextPath()%>/componentes/dist/img/urp.png" class="img-circle" alt="User Image">
                                            <p>
                                                <%=dtoUsuario.getCP_DNI()%> - <%=dtoUsuario.getCU_USUARIO()%>
                                                <small>Fecha de alta: <%=dtoUsuario.getDU_FECHA_ALTA()%></small>
                                            </p>
                                        </li>
                                        <li class="user-footer">
                                            <div class="pull-right">
                                                <a href="<%=request.getContextPath()%>/logout" class="btn btn-default btn-flat">Cerrar Sesión</a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
                <aside class="main-sidebar">
                    <section class="sidebar">
                        <div class="user-panel">
                            <div class="pull-left image">
                                <img src="<%=request.getContextPath()%>/componentes/dist/img/urp.png" class="img-circle" alt="User Image">
                            </div>
                            <div class="pull-left info">
                                <p><%=dtoUsuario.getCU_USUARIO()%></p>
                                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                            </div>
                        </div>
                        <ul class="sidebar-menu" data-widget="tree">
                            <li class="header">Menú Principal</li>
                            <li class="active treeview">
                                <a href="#">
                                    <i class="fa fa-dashboard"></i> <span>Administración</span>
                                    <span class="pull-right-container">
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li class="active">
                                        <a href="<%=request.getContextPath()%>/menu"><i class="fa fa-circle-o"></i> Panel</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-book"></i>
                                    <span>Conferencias</span>
                                    <span class="pull-right-container">
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-book"></i> Tipo de Conferencia</a></li>
                                </ul>
                            </li>

                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-book"></i>
                                    <span>Reporte</span>
                                    <span class="pull-right-container">
                                        <i class="fa fa-angle-left pull-right"></i>
                                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-book"></i> Reporte Asistencia</a></li>
                                </ul>
                            </li>
                        </ul>
                    </section>
                </aside>

                <div class="content-wrapper">
                    <section class="content-header">
                        <h1>
                            Administración
                            <small>Panel Control</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Panel</a></li>
                            <li class="active">Detalles</li>
                        </ol>
                    </section>
                    <section class="content">
                        <div class="row" >
                            <div class="col-lg-6 col-xs-6" >
                                <div class="small-box bg-aqua" >
                                    <div class="inner">
                                        <h3><%=countTC%></h3>
                                        <p>Tipo de Conferencias</p>
                                    </div>
                                    <div class="icon" >
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="#" class="small-box-footer" >Tipo de Conferencia <i class="fa fa-hand-pointer-o text-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="box box-info collapse-box box-solid" id="mostrarPanel">
                                    <div class="box-header with-border" >
                                        <h3 class="box-title">Panel</h3>
                                        <div class="box-tools pull-right">

                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <table id="example2" class="table table-striped table-condensed table-hover">
                                            <thead class="bg-yellow">
                                                <tr>
                                                    <th class="text-center">Código</th>
                                                    <th class="text-center">Descripcion</th>
                                                    <th class="text-center">Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-hover">
                                                <%
                                                    for (int idx = 0; idx < listaTC.size(); idx++) {
                                                        dtoTipoConferencia dtoTC = (dtoTipoConferencia) listaTC.get(idx);
                                                %>
                                                <tr>
                                                    <td class="text-center"><%=dtoTC.getCTCONF_CODIGO()%></td>
                                                    <td><%=dtoTC.getVTCONF_DESLARGA()%></td>
                                                    <td>PSP</td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3"  >
                                <div class="box box-info collapse-box box-solid" id="mostrarPanel">
                                    <div class="box-header with-border" >
                                        <h3 class="box-title">Agregar Tipo de Conferencia</h3>
                                        <div class="box-tools pull-right">

                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <form role="form" method="post" name="frm_TC" class="form-group">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Tipo de Conferencia</label>
                                                    <input type="text" class="form-control text-center" id="insertarTC" placeholder="Ingrese Tipo de Conferencia">
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <button type="button" class="btn btn-success" onclick="javascript:f_InsertarTipoEncuesta();">Registrar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3" id="contenidoEditar">
                                <div class="box box-info collapse-box box-solid" id="mostrarPanel">
                                    <div class="box-header with-border" >
                                        <h3 class="box-title">Editar Tipo de Conferencia</h3>
                                        <div class="box-tools pull-right">
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <form role="form" method="post" name="frm_TC" class="form-group">
                                            <div class="box-body">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Código de Conferencia</label>
                                                    <input type="text" class="form-control text-center" id="insertarTC" name="codigoTC">
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Tipo de Conferencia</label>
                                                    <input type="text" class="form-control text-center" id="insertarTC" name="textTC">
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <button type="button" class="btn btn-success" onclick="javascript:f_InsertarTipoEncuesta();">Modificar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!---<div class="box box-solid bg-light-blue-gradient">-->
        <div class="modal modal-info fade" id="modal-success">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body" id="form-tc">

                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </body>
</html>
