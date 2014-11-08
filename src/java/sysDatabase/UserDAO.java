/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sysDatabase;

import java.util.List;
import org.apache.catalina.User;
import user.sysUser;


public abstract class UserDAO {
    
    
    public abstract void create(User u) throws DAOException;
    
    public abstract List<sysUser> list() throws DAOException;
    
    public abstract User read(int uid) throws DAOException;
    
    public abstract void update(User u) throws DAOException;
    
    public abstract void delete(int uid) throws DAOException;
}

