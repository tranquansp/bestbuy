/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
/**
 *
 * @author FreeX
 */
public class DetailDAO {
       public static int themCT(int idc,int ido,int soluong,double dongia){
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themchitiethoadon(?,?,?,?,?)}");

            statement.setInt(1, idc);
            statement.setInt(2, ido);
            statement.setInt(3, soluong);
            statement.setDouble(4, dongia);
            
            statement.registerOutParameter(5,Types.INTEGER);
            statement.execute();

            int maCT = statement.getInt(5); 
            help.close();
            return maCT;
        }
        catch(Exception ex){
        }
      return 0;
    }
}
