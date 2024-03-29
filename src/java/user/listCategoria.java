/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "listCategoria", urlPatterns = {"/listCategoria"})
public class listCategoria extends HttpServlet {

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
                try{
            
            String action = request.getParameter("action");
            ConnectBD lis = new ConnectBD();
            HttpSession session = request.getSession();
            
            if(action.equalsIgnoreCase("list"))
            {
                session.getAttribute("user");
                //session.setAttribute("listcateg", lis.listCategoria());
                request.getRequestDispatcher("categoria.jsp").forward(request, response);
            }
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
            String action = request.getParameter("action");
            ConnectBD lis = new ConnectBD();
            HttpSession session = request.getSession();
            session.removeAttribute("listcateg");
            sysUser u = new sysUser();
            if(action.equalsIgnoreCase("action")){
                if(lis.listCategoria()!=null){
                    session.setAttribute("listcateg", u);
                    request.getRequestDispatcher("categoria.jsp").forward(request, response);
                }
            }
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
