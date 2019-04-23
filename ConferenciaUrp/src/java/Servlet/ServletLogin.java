/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import comun.Parametros;
import dao.DaoFactory;
import dao.DaoUsuario;
import dto.dtoUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class ServletLogin extends HttpServlet {

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
            DaoFactory objODF = DaoFactory.getDaoFactory(DaoFactory.ORACLE);
            DaoUsuario objDU = objODF.getDaoUsuario();
            String mensaje;

            String sLogin = request.getParameter("txtUsuario");
            String sClave = request.getParameter("txtClave");

            System.out.println("sLogin " + sLogin);
            System.out.println("sClave " + sClave);

            boolean verificarusuario = objDU.existeUsuario(sLogin);
            System.out.println("verificarusuario " + verificarusuario);

            if (verificarusuario) {

                dtoUsuario dtoUsuario = objDU.verificaClave(sLogin, sClave);
                if (dtoUsuario.getCU_USUARIO() == null) {
                    System.out.println("usuario " + dtoUsuario.getCU_USUARIO());
                    mensaje = "Contraseña incorrecta";
                    request.setAttribute("mensaje", mensaje);
                    getServletContext().getRequestDispatcher("/conferencia/login/login.jsp").forward(request, response);
                } else {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usuario", dtoUsuario);
                    getServletContext().getRequestDispatcher("/menu").forward(request, response);
                }
            } else {

                mensaje = "el usuarios no existe !!!";

                request.setAttribute("mensaje", mensaje);
                getServletContext().getRequestDispatcher("/conferencia/login/login.jsp").forward(request, response);

            }

        } catch (Exception e) {
            
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
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
