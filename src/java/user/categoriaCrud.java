/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sysDatabase.ConnectBD;
import sysDatabase.UserData;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "categoriaCrud", urlPatterns = {"/categoriaCrud"})
public class categoriaCrud extends HttpServlet {

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
        String query =  "INSERT INTO syservice.servico(nome, id_serv) VALUES(?,?)";
        sysUser u = new sysUser();

        ConnectBD con = new ConnectBD();
        Connection connect = con.getConnection();
        PreparedStatement ps = connect.prepareStatement(query);
        
        u.setCategoria(request.getParameter("categoria"));
        u.setIdCategoria(request.getParameter("idcateg"));
        
        ps.setString(1, u.getCategoria());
        ps.setString(2, u.getIdCategoria());
        
        ps.executeQuery();

        request.getRequestDispatcher("login_incorreto.jsp").forward(request, response);
        //ps.close();
        }catch(Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("adminCRUD.jsp").forward(request, response);
            
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
