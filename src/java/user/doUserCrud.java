/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import sysDatabase.UserData;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "doUserCrud", urlPatterns = {"/doUserCrud"})
public class doUserCrud extends HttpServlet {

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
        String query =  "INSERT INTO syservice.user(nome,snome,login,senha,cidade,sexo,datacadastro) VALUES(?,?,?,?,?,?,'now');"
                      + "INSERT INTO syservice.trab_em(prest_login, nome_serv, nome_categ_pai, descricao_serv,dtcadastrocateg) VALUES(?,?,?,?,'now');"
                      + "INSERT INTO syservice.sub(pai_categ, sub_nome) VALUES(?,?)";
        
        String action = request.getParameter("action");
        //doServicoCrud dsc = new doServicoCrud();
        sysUser u = new sysUser();
        
        ConnectBD con = new ConnectBD();
        Connection connect = con.getConnection();
        PreparedStatement ps = connect.prepareStatement(query);
        
        //udata.Create(u);
        u.setName(request.getParameter("name")); //pega da pagina cadastro.jsp 'nome'
        u.setSname(request.getParameter("sname")); //pega da pagina cadastro.jsp 'nome'
        u.setLogin(request.getParameter("login"));//pega da pagina cadastro.jsp 'login'
        u.setPassword(request.getParameter("password"));//pega da pagina cadastro.jsp 'password'
        u.setCidade(request.getParameter("cidade"));
        u.setSexo(request.getParameter("sexo"));
        
        u.setServico(request.getParameter("servico"));
        u.setCategoria(request.getParameter("categoria"));
        u.setDescricao(request.getParameter("descricaoservico"));

        ps.setString(1, u.getName());
        ps.setString(2, u.getSname());
        ps.setString(3, u.getLogin());
        ps.setString(4, u.getPassword());
        ps.setString(5, u.getCidade());
        ps.setString(6, u.getSexo());
        ps.setString(7, u.getLogin());
        ps.setString(8, u.getServico());
        ps.setString(9, u.getCategoria());
        ps.setString(10, u.getDescricao());
        ps.setString(11, u.getCategoria());
        ps.setString(12, u.getServico());
        
        ps.executeQuery();
        ps.close();
        connect.close();

        request.getRequestDispatcher("login_incorreto.jsp").forward(request, response);
        }catch(Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
