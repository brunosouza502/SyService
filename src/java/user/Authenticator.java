/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import sysDatabase.ConnectBD;
import java.sql.Connection;
import sysDatabase.UserData;

/**
 *
 * @author Bruno
 */
public class Authenticator {
    public static boolean authenticate(sysUser u, String usr, String psw)
    {
        String query;

        if(u.getName().equals(usr) && u.getPassword().equals(psw)){
            return true;
        } else {
            return false;
        }
    }
    
}
