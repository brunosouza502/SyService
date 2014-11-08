/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "EditarCrud", urlPatterns = {"/EditarCrud"})
public class EditarCrud extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServicoCrud</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServicoCrud at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
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
        try {
            String query = "INSERT INTO syservice.trab_categoria (sub_categ, categ_nome, login_prestador) VALUES(?,?,?)"; 
            String query2 = "SELECT * FROM syservice.user WHERE login = ? AND senha = ?";
            String qry = "UPDATE syservice.trab_em SET nome_serv = ?, nome_categ_pai = ? " +
                        "WHERE prest_login  = ?";
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            //sysUser u = new sysUser();
            ConnectBD edit = new ConnectBD();
            
            u.setServico(request.getParameter("serv"));
            u.setCategoria(request.getParameter("categ"));
            u.setDescricao(request.getParameter("descricao"));
            
            if(edit.editar(u, u.getServico(), u.getCategoria(), u.getDescricao(), u.getLogin())!=null){
                request.getRequestDispatcher("welcome.jsp").forward(request, response);
            }else
                request.getRequestDispatcher("welcome.jsp").forward(request, response);

        } catch (Exception ex) {
            //Logger.getLogger(EditarCrud.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
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
