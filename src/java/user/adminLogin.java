/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sysDatabase.ConnectBD;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "adminLogin", urlPatterns = {"/adminLogin"})
public class adminLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            ConnectBD val = new ConnectBD();
            HttpSession session = request.getSession();
        session.removeAttribute("useradmin");
        sysUser u = new sysUser();

        u.setLogin(request.getParameter("login"));
        u.setPassword(request.getParameter("password"));
        //if(u.getName().equals(request.getParameter("name")) && u.getPassword().equals(request.getParameter("password"))){
        if(val.validateAdmin(u, u.getLogin(), u.getPassword()) != null){
           session.setAttribute("useradmin", u);
           RequestDispatcher rdisp = request.getRequestDispatcher("adminCRUD.jsp");
           rdisp.forward(request, response);
        }else
            request.getRequestDispatcher("login_incorreto.jsp").forward(request, response);
        }catch (Exception ex) {
                Logger.getLogger(doLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
