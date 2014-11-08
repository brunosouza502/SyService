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
import javax.servlet.http.HttpSession;
import sysDatabase.ConnectBD;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "requisitaServico", urlPatterns = {"/requisitaServico"})
public class requisitaServico extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)//requisista da pagina de divulgação
            throws ServletException, IOException {
        /*try{
            String action = request.getParameter("action");
            String query =  "INSERT INTO syservice.requisita(dt_inicio, cliente, prestador, descricao) VALUES('now',?,?,?)";
        
            sysUser u = new sysUser();
            sysUser visita = (sysUser) request.getSession().getAttribute("user");
            sysUser user = (sysUser)request.getAttribute("userpage");
            
            ConnectBD con = new ConnectBD();
            Connection connect = con.getConnection();
            PreparedStatement ps = connect.prepareStatement(query);
            if(action.equals("requisita")){
                ps.setString(1, visita.getLogin());
                ps.setString(2, user.getLogin());
                ps.setString(3, request.getParameter("descricao"));
                request.setAttribute("requisitar", u);
                request.getRequestDispatcher("reqServico.jsp").forward(request, response);
            }
        }catch(Exception e){
            e.printStackTrace();
        }*/
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
            String action = request.getParameter("action");
            String query =  "INSERT INTO syservice.requisita(dtreq, cliente, prestador, descricao) VALUES('now',?,?,?)";
        
            //sysUser u = new sysUser();
            //sysUser visita = (sysUser) request.getSession().getAttribute("user");
            //sysUser user = (sysUser)request.getAttribute("userpage");
            
            ConnectBD con = new ConnectBD();
            Connection connect = con.getConnection();
            PreparedStatement ps = connect.prepareStatement(query);
            ps.setString(1, request.getParameter("cliente"));
            ps.setString(2, request.getParameter("prestador"));
            ps.setString(3, request.getParameter("descricao"));
            //request.setAttribute("requisitar", u);
            ps.executeQuery();
            ps.close();
            
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
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
