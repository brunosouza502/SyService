/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sysDatabase.ConnectBD;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "agendaServico", urlPatterns = {"/agendaServico"})
public class agendaServico extends HttpServlet {

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
            String query = "INSERT INTO syservice.agendamento(client_login, prest_login, dt_inicio, dt_fim, preco, hora_agendamento) VALUES(?,?,?,?,?,'now')";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            
            sysUser agenda = new sysUser();
            agenda.setDtInicioagendamento(new java.sql.Date(sdf.parse(request.getParameter("dtinicio")).getTime()));
            agenda.setDtFimagendamento(new java.sql.Date(sdf.parse(request.getParameter("dtfim")).getTime()));
            
            ConnectBD con = new ConnectBD();
            Connection connect = con.getConnection();
            PreparedStatement ps = connect.prepareStatement(query);
            double preco = Double.parseDouble(request.getParameter("precoservico"));
            agenda.setPrecoEstimado(preco);
            
            ps.setString(1, request.getParameter("cliente"));
            ps.setString(2, request.getParameter("prestador"));
            ps.setDate(3, agenda.getDtInicioagendamento());
            ps.setDate(4, agenda.getDtFimagendamento());
            //ps.setString(3, request.getParameter("dtinicio"));
            //ps.setString(4, request.getParameter("dtfim"));
            ps.setDouble(5, agenda.getPrecoEstimado());
            ps.executeQuery();
            //request.getRequestDispatcher("welcome.jsp").forward(request, response);
        }catch(Exception e){
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
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
