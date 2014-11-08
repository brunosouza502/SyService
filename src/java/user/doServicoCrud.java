/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import sysDatabase.ConnectBD;

/**
 *
 * @author Bruno
 */
public class doServicoCrud {
    public void CadastrarServico(sysUser usr)
    {
        try{
            String query = "INSERT INTO syservice.trab_categoria(id_categ, categ_nome, login_prestador) "
                + "SELECT c.id_categoria, c.nome_categoria, u.login FROM syservice.categoria c JOIN "
                + "syservice.user u ON c.nome_categoria = u.categoria WHERE c.nome_categoria ="+usr.getCategoria();
        //String query = "INSERT INTO syservice.trab_categoria(id_categ, categ_nome, login_prestador) VALUES(?,?,?)";
        ConnectBD con = new ConnectBD();
        Connection connect = con.getConnection();
        PreparedStatement ps = connect.prepareStatement(query);
        ps.setString(1, usr.getIdCategoria());
        ps.setString(2, usr.getCategoria());
        ps.setString(2, usr.getLogin());
        ps.executeQuery();
        EditarCrud sc = new EditarCrud();
        
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
}
