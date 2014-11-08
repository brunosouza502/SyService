/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "avaliaCliente", urlPatterns = {"/avaliaCliente"})
public class avaliaCliente extends HttpServlet {

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
            String query = "INSERT INTO syservice.avaliar_cliente(client_login, prest_login, textolivre, nota_pagamento, nota_material_fornecido, nota_facilidade_trato_cliente, data_hora_avaliacao) VALUES(?,?,?,?,?,?,'now')";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sysUser avaliar = new sysUser();
            
            ConnectBD con = new ConnectBD();
            Connection connect = con.getConnection();
            PreparedStatement ps = connect.prepareStatement(query);
            
            double notapagmt = Double.parseDouble(request.getParameter("notapgmt"));
            double notamaterial = Double.parseDouble(request.getParameter("notamaterial"));
            double notatrato = Double.parseDouble(request.getParameter("notatratocliente"));
            //double notaqualidadeatendimento = Double.parseDouble(request.getParameter("notaqualidadeatendimento"));
            //avaliar.setDt_termino(new java.sql.Date(sdf.parse(request.getParameter("datatermino")).getTime()));
            
            avaliar.setNotaPagamentoadequado(notapagmt);
            avaliar.setNotaFornecimentomateriais(notamaterial);
            avaliar.setNotaFacilidadetrato(notatrato);
            
            ps.setString(1, request.getParameter("cliente"));
            ps.setString(2, request.getParameter("prestador"));
            ps.setString(3, request.getParameter("textolivre"));
            ps.setDouble(4, avaliar.getNotaPagamentoadequado());
            ps.setDouble(5, avaliar.getNotaFornecimentomateriais());
            ps.setDouble(6, avaliar.getNotaFacilidadetrato());
            
            ps.executeQuery();
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
