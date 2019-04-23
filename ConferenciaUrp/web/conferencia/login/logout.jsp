<%-- 
    Document   : logout
    Created on : 21/04/2019, 10:35:08 PM
    Author     : Lenovo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario")== null) {
            response.sendRedirect(request.getContextPath()+"/logout");
        }
%>
