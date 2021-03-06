/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Conferencia;

import comun.Parametros;
import dao.DaoFactory;
import dao.DaoTipoConferencia;
import dto.dtoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class ServletTipoConferencia extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            HttpSession session = request.getSession(true);
            dtoUsuario dtoUsuario = (dtoUsuario) session.getAttribute("usuario");
            if (dtoUsuario == null) {
                getServletContext().getRequestDispatcher("/conferencia/login/login.jsp").forward(request, response);
            } else {
                DaoFactory objDF = DaoFactory.getDaoFactory(DaoFactory.ORACLE);
                DaoTipoConferencia objDTC = objDF.getDaoTipoConferencia();
                Collection listaTC = objDTC.ListaTipoConferencia();
                int countTC = objDTC.CountTipoConferencia();
                request.setAttribute("listaTC", listaTC);
                request.setAttribute("countTC", countTC);
                getServletContext().getRequestDispatcher("/conferencia/menu/conferencia/tipoConferencia.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": (Error E) " + e.toString());
        } catch (Exception ex) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": (Error E) " + ex.toString());
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
