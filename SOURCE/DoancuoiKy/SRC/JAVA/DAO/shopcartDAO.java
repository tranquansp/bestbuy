/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import pojo.OrderDetail;
import java.sql.*;
import java.util.ArrayList;
import pojo.order;
import pojo.order_detail;
import pojo.product;

/**
 *
 * @author FreeX
 */
public class shopcartDAO {
    
        public static int themHD(int idc,String date){
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themhoadon(?,?,?)}");

            statement.setInt(1, idc);
            statement.setString(2, date);
            statement.registerOutParameter(3,Types.INTEGER);
            statement.execute();

            int maHD = statement.getInt(3); 
            help.close();
            return maHD;
        }
        catch(Exception ex){
        }
      return 0;
    }
        // xem hoa don
        public static ArrayList<OrderDetail> xemHoaDon(String hd){
            ArrayList<OrderDetail> OD = new ArrayList<OrderDetail>();
            try{
                MySqlDataAccessHelper help = new MySqlDataAccessHelper();
                help.open();
                Connection c = help.getConnection();

                CallableStatement statement = c.prepareCall("{call xemChiTietHoaDon(?)}");
                statement.setInt(1,Integer.parseInt(hd));

                statement.executeQuery();

                ResultSet rs=statement.getResultSet();
                while(rs.next()){
                    OrderDetail o=new OrderDetail();
                    o.setAgeKH(rs.getInt("ageKH"));
                    o.setDiachiKH(rs.getString("diachiKH"));
                    o.setDongia(rs.getDouble("dongia"));
                    o.setDtKH(rs.getString("dienthoaiKH"));
                    o.setGiaSP(rs.getDouble("giaSP"));
                    o.setMaHD(rs.getInt("maHD"));                    
                    o.setMaKH(rs.getInt("maKH"));
                    o.setMaSP(rs.getInt("maSP"));
                    o.setNgaydathang(rs.getString("ngaydathang"));
                    o.setSoluong(rs.getInt("soluong"));
                    o.setTenKH(rs.getString("tenKH"));
                    o.setTenSP(rs.getString("tenSP"));
                    OD.add(o);
                    //return o;
                }
                
                help.close();
                return OD;
            }
            catch(Exception ex){
            }
            return null;
        }
        public static ArrayList<String> LayHd(){
        ArrayList<String> Od = new ArrayList<String>();
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = String.format("SELECT * FROM tbl_orders WHERE tinhtrang <> 0 ORDER BY ngaydathang DESC; ");
            ResultSet rs = helper.executeQuery(sql);
            while(rs.next()){
            OrderDetail sp = new OrderDetail();
            //sp.setMaHD((rs.getInt("m")));
            Od.add(String.valueOf(rs.getInt("madondathang")));
            }
        } 
        catch(Exception ex){
            
        }
            return Od;
        }
        
        
        public static ArrayList<String> LayHdNEW(){
        ArrayList<String> Od = new ArrayList<String>();
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = String.format("SELECT * FROM tbl_orders ORDER BY ngaydathang DESC; ");
            ResultSet rs = helper.executeQuery(sql);
            while(rs.next()){
            OrderDetail sp = new OrderDetail();
            //sp.setMaHD((rs.getInt("m")));
            Od.add(String.valueOf(rs.getInt("madondathang")));
            }
        } 
        catch(Exception ex){
            
        }
            return Od;
        }
                
        public static int anHD(String id){
            try{
                MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
                helper.open();
                String sql = "UPDATE  `shopcart`.`tbl_orders` SET  `tinhtrang` =  '0' WHERE  `tbl_orders`.`madondathang` = " +id;
                helper.executeUpdate(sql);
                helper.close();
            } 
            catch(Exception ex){
                return 0;
            }
            return 1;
        }
                
        //xem chi tiet hoa don
}
