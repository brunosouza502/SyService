/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sysDatabase;

import user.sysUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Bruno
 */
public class UserData{
    private ConnectBD connect;
    /*public UserData(ConnectBD _con)
    {
        connect = _con;
    }*/
    
    
    
    /**
     *
     * @param u
     * @throws SQLException
     */
    public void create(sysUser u, Connection connecters) throws SQLException
    {
        String query =  "INSERT INTO syservice.user(nome,login,senha) VALUES(?,?,?)";
        Connection conn = connect.getConnection();
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getLogin());
            ps.setString(3, u.getPassword());
            
        }catch(SQLException ex){            
        }
    }
    
}
