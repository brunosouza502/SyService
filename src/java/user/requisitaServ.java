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
@WebServlet(name = "requisitaServ", urlPatterns = {"/requisitaServ"})
public class requisitaServ extends HttpServlet {

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
            out.println("<title>Servlet requisitaServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet requisitaServ at " + request.getContextPath() + "</h1>");
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
        try{
            String query =  "INSERT INTO syservice.requisita(dt_inicio, cliente, prestador, descricao) VALUES('now',?,?,?)";
        
            String action = request.getParameter("action");
            sysUser u = new sysUser();
        
            HttpSession session = request.getSession();
            
            //session.removeAttribute("req");                
                        
            ConnectBD con = new ConnectBD();
            Connection connect = con.getConnection();
            PreparedStatement ps = connect.prepareStatement(query);

            //u.setDt_inicio(request.getParameter("data_hoje"));
            u.setCliente(request.getParameter("cliente"));
            u.setPrestador(request.getParameter("prestreq"));
            u.setDesc_pedido(request.getParameter("descricao"));
                
            //ps.setDate(1, u.getDt_inicio());
            ps.setString(1, u.getCliente());
            ps.setString(2, u.getPrestador());
            ps.setString(3, u.getDesc_pedido());
            
            ps.executeQuery();
            //session.setAttribute("req", u);
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        }catch (Exception e){
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
