/*
 * 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;

/**
 *
 * @author FreeX
 */
public class customerDAO {
    public static int themKH(String name,String age,String address,String phone){
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themkhachhang(?,?,?,?,?)}");

            statement.setString(1, name);
            statement.setInt(2, Integer.parseInt(age));
            statement.setString(3, address);
            statement.setString(4, phone);
            statement.registerOutParameter(5,Types.INTEGER);
            statement.execute();

            int maDanhMuc = statement.getInt(5);            
            return maDanhMuc;
        }
        catch(Exception ex){
        }
      return 0;
    }
}
