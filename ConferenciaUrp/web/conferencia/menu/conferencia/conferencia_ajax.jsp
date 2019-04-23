<%-- 
    Document   : conferencia_ajax
    Created on : 22/04/2019, 12:07:01 AM
    Author     : Lenovo
--%>

<%@page import="dto.dtoSeccionConferencia"%>
<%@page import="dao.DaoSeccionConferencia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoTipoConferencia"%>
<%@page import="dao.DaoFactory"%>
<%@page import="dto.dtoTipoConferencia"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>  


<%
    String hora = (String) request.getParameter("pasacache");
    String reporte = (String) request.getParameter("reporte");
    String msg = "";
    DaoFactory objDF = DaoFactory.getDaoFactory(DaoFactory.ORACLE);
    DaoTipoConferencia objDTC = objDF.getDaoTipoConferencia();
    DaoSeccionConferencia objDSC = objDF.getDaoSeccionConferencia();
    /*
     01.Formulario para agregar tipo de conferencia
     */
    String usuario = (String) request.getParameter("usuario");
    if (reporte.equals("01")) {
%>
<div class="box text-black small">
    <div class="box-header">
        <h3 class="box-title">Lista de Conferencias</h3>
        <div class="btn-group">
            <button type="button" class="btn btn-success">Acción</button>
            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:f_openModal();">Insertar</a></li>
            </ul>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="example1" class="table table-striped table-condensed table-hover">
            <thead>
                <tr>
                    <th>Rendering engine</th>
                    <th>Browser</th>
                    <th>Platform(s)</th>
                    <th>Engine version</th>
                    <th>CSS grade</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Trident</td>
                    <td>Internet
                        Explorer 4.0
                    </td>
                    <td>Win 95+</td>
                    <td> 4</td>
                    <td>X</td>
                </tr>
                <tr>
                    <td>Other browsers</td>
                    <td>All others</td>
                    <td>-</td>
                    <td>-</td>
                    <td>U</td>
                </tr>
            </tbody>

        </table>
    </div>
</div>
<%    } else if (reporte.equals("02")) {
%>
<div class="box box-info text-black">
    <div class="box-header box-info with-border">

    </div>
    <form role="form" method="post" name="frm_TC">
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

<%
} else if (reporte.equals("03")) {

    String tipoConferencia = (String) request.getParameter("tipoConferencia");
    dtoTipoConferencia dtoTC = new dtoTipoConferencia();
    dtoTC.setVTCONF_DESLARGA(tipoConferencia);
    int retorno = objDTC.insertarTipoConferencia(dtoTC);

    if (retorno == 0) {
        msg = "Tipo de Conferenica no Insertado";
    } else if (retorno == 1) {
        msg = "Tipo de Conferenica Insertado";
    }
%>
<input type="hidden" id="retMsj" name="retMsj" value="<%=msg%>" />
<%
} else if (reporte.equals("04")) {

    String codigoTC = (String) request.getParameter("codigoTC");
    ArrayList listaSC = (ArrayList) objDSC.ListarSeccionConferencia(codigoTC);
    
    

%>
<table id="example2" class="table table-striped table-condensed table-hover">
    <thead class="bg-yellow">
        <tr>
            <th class="text-center">Código</th>
            <th class="text-center">Descripcion</th>
            <th class="text-center">Accion</th>
        </tr>
    </thead>
    <tbody class="table-hover">
        <%            for (int idx = 0; idx < listaSC.size(); idx++) {
                dtoSeccionConferencia dtoSC = (dtoSeccionConferencia) listaSC.get(idx);
                if (dtoSC.getCSCONF_CODIGO() == null) {
                    dtoSC.setCSCONF_CODIGO("");
                }
                if (dtoSC.getVSCONF_DESLARGA() == null) {
                    dtoSC.setVSCONF_DESLARGA("");
                }
                if (dtoSC.getCTCONF_CODIGO() == null) {
                    dtoSC.setCTCONF_CODIGO("");
                }
        %>
        <tr>
            <td class="text-center"><%=dtoSC.getCSCONF_CODIGO()%></td>
            <td><%=dtoSC.getVSCONF_DESLARGA()%></td>
            <td><%=dtoSC.getCTCONF_CODIGO()%></td>

        </tr>
        <%}%>
    </tbody>
</table>

<%    }
%>
