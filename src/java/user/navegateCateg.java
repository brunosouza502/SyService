/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "navegateCateg", urlPatterns = {"/navegateCateg"})
public class navegateCateg extends HttpServlet {

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
        try{
            String action = request.getParameter("action");
            ConnectBD con = new ConnectBD();
            sysUser users = new sysUser();
            List<sysUser> prest;
            //users.setCategoria(action);
            //users = con.listprest(action);
            //prest = con.listprest(action);
            if(action.equals("update")){
                request.setAttribute("prestadores", con.listprest(request.getParameter("categ")));
                request.setAttribute("ranknotapreco", con.ranknotaprecoprestadoresCateg(request.getParameter("categ")));
                request.setAttribute("ranknotaprazo", con.ranknotaprazoprestadoresCateg(request.getParameter("categ")));
                request.setAttribute("ranknotaservico", con.ranknotaservicoprestadoresCateg(request.getParameter("categ")));
                request.setAttribute("ranknotaatendimento", con.ranknotaatendimentoprestadoresCateg(request.getParameter("categ")));
                
                request.setAttribute("ultimoscad", con.ultimosCadastrado(request.getParameter("categ")));
                request.setAttribute("ultimoscontratados", con.ultimosContratadoscateg(request.getParameter("categ")));
                request.setAttribute("topusers", con.topprestCateg(request.getParameter("categ")));
                
                request.getRequestDispatcher("prestcateg.jsp").forward(request, response);
            }
            //request.setAttribute("listprestadores", con.listprest(action));
            //request.getRequestDispatcher("prestcateg.jsp").forward(request, response);
            
        }catch(Exception e){
            e.printStackTrace();
        }
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
        String query = "";
        sysUser u = new sysUser();
        HttpSession session = request.getSession();
        ConnectBD con = new ConnectBD();
        Connection connect = con.getConnection();
        PreparedStatement ps = connect.prepareStatement(query);
        
        u.setCategoria(request.getParameter("categ"));
        List<sysUser> prestador;
        
        con.listprest(u.getCategoria());
        session.setAttribute("listaprestadores", con.listprest(u.getCategoria()));
        request.getRequestDispatcher("prestcateg.jsp").forward(request, response);
        
        }catch(Exception e){
            e.printStackTrace();
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
