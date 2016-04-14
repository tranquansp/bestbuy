/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.*;
import pojo.attDetail;

/**
 *
 * @author FreeX
 */
public class attDAO {
    public static ArrayList<att> layDSTT(String dm){
        ArrayList<att> A = new ArrayList<att>();
         try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            //Connection c = help.getConnection();
            //CallableStatement statement = c.prepareCall("{call themSanPham(?,?,?,?,?,?,?)}");
            //statement.setString(1, dm);
            //statement.registerOutParameter(7,Types.INTEGER);
            //statement.execute();
            String sql = "SELECT DISTINCT tbl_attribute.id,type,nameatt,unit,status FROM tbl_category,tbl_attribute WHERE category = "+ dm;
            //help.executeQuery(sql);
            ResultSet rs = help.executeQuery(sql);
            while(rs.next()){
                att at = new att();
                at.setId(rs.getInt("id"));
                at.setType(rs.getString("type"));
                at.setValue(rs.getString("nameatt"));
                at.setUnit(rs.getString("unit"));
                at.setStatus(rs.getString("status"));
                A.add(at);
            }
            help.close();
            return A;
         }
         catch(Exception e){
         
         }
        
    return null;
    }
    
    public static int themint(String matt,String masp,String value){
        try{
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
        String sql = "INSERT INTO `shopcart`.`tbl_att_int` (`id`, `idatt`, `idp`, `detail`) "
                + "VALUES (NULL, "+matt+",  "+masp+",  "+value+")";
        help.executeUpdate(sql);
        help.close();
        return 1;
        }
        catch(Exception e){
            return 0;
        }
      }
    
    public static int themfloat(String matt,String masp,String value){
        try{
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
        String sql = "INSERT INTO `shopcart`.`tbl_att_float` (`id`, `idatt`, `idp`, `detail`) "
                + "VALUES (NULL, "+matt+",  "+masp+",  "+value+")";
        help.executeUpdate(sql);
        help.close();
        return 1;
        }
        catch(Exception e){
            return 0;
        }
      }
   
    
        public static int themdouble(String matt,String masp,String value){
        try{
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
        String sql = "INSERT INTO `shopcart`.`tbl_att_double` (`id`, `idatt`, `idp`, `detail`) "
                + "VALUES (NULL, "+matt+",  "+masp+",  "+value+")";
        help.executeUpdate(sql);
        help.close();
        return 1;
        }
        catch(Exception e){
            return 0;
        }
      }
        
        public static int themvarchar(String matt,String masp,String value){
        try{
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
        String sql = "INSERT INTO `shopcart`.`tbl_att_varchar` (`id`, `idatt`, `idp`, `detail`) "
                + "VALUES (NULL, "+matt+",  "+masp+",  '"+value+"')";
        help.executeUpdate(sql);
        help.close();
        return 1;
        }
        catch(Exception e){
            return 0;
        }
      }
            
    public static int themtext(String matt,String masp,String value){
        try{
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
        String sql = "INSERT INTO `shopcart`.`tbl_att_text` (`id`, `idatt`, `idp`, `detail`) "
                + "VALUES (NULL, "+matt+",  "+masp+",  '"+value+"')";
        help.executeUpdate(sql);
        help.close();
        return 1;
        }
        catch(Exception e){
            return 0;
        }
      }
    
    
        public static String themTT(int id,String type,String name,String unit){
        //int maSP = 0;
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            String sql = "INSERT INTO `shopcart`.`tbl_attribute` (`id`, `category`, `type`,`unit`, `nameatt`)"
                    + " VALUES (NULL, "+id+",'"+type+"','"+unit+"','"+name+"')";
            /*
            Connection c = help.getConnection();
            
            CallableStatement statement = c.prepareCall("{call themthuoctinh(?,?,?,?)}");

            statement.setInt(1, id);
            statement.setString(2, type);
            //String h =
            statement.setString(3, name);
            statement.setString(4, unit);
            
            statement.execute();
            */
            //maSP = statement.getInt(3);
            help.executeUpdate(sql);
            help.close();

        }
        catch(Exception ex){
            return String.valueOf(ex);
        }
        return null;
    }
        
     public static ArrayList<attDetail> getDint(String msp){
        ArrayList<attDetail> AD = new ArrayList<attDetail>();
        
         try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
        String sql1= "SELECT DISTINCT tbl_products.id as idp, name, tbl_attribute.type, tbl_attribute.unit AS unit,nameatt, tbl_att_text.detail as detail "
                + "FROM tbl_attribute, tbl_att_text, tbl_products WHERE tbl_products.id = tbl_att_text.idp "
                + "AND tbl_att_text.idatt = tbl_attribute.id AND tbl_products.id = "+msp+" ORDER BY tbl_products.id ASC ";
        ResultSet rs1 = helper.executeQuery(sql1);
        
        while(rs1.next()){
            attDetail att = new attDetail();
            att.setName(rs1.getString("nameatt"));
            att.setDetail(rs1.getString("detail"));
            att.setUnit(rs1.getString("unit"));
            AD.add(att);
            //out.println(rs1.getString("name"));
            //out.println("<br/>");
            //out.println(rs1.getString("nameatt"));
            //out.println(rs1.getString("detail"));
        }
        ///
        String sql2= "SELECT DISTINCT tbl_products.id as idp, name, tbl_attribute.type, nameatt,tbl_attribute.unit AS unit, tbl_att_float.detail as detail "
                + "FROM tbl_attribute, tbl_att_float, tbl_products WHERE tbl_products.id = tbl_att_float.idp "
                + "AND tbl_att_float.idatt = tbl_attribute.id AND tbl_products.id = "+msp+" ORDER BY tbl_products.id ASC ";
        ResultSet rs2 = helper.executeQuery(sql2);
        
        while(rs2.next()){
            attDetail att = new attDetail();
            att.setName(rs2.getString("nameatt"));
            att.setDetail(rs2.getString("detail"));
            att.setUnit(rs2.getString("unit"));
            AD.add(att);
        }
        ///
        String sql3= "SELECT DISTINCT tbl_products.id as idp, name, tbl_attribute.type, nameatt, tbl_attribute.unit AS unit,tbl_att_double.detail as detail "
                + "FROM tbl_attribute, tbl_att_double, tbl_products WHERE tbl_products.id = tbl_att_double.idp "
                + "AND tbl_att_double.idatt = tbl_attribute.id AND tbl_products.id = "+msp+" ORDER BY tbl_products.id ASC ";
        ResultSet rs3 = helper.executeQuery(sql3);
        
        while(rs3.next()){
            attDetail att = new attDetail();
            att.setName(rs3.getString("nameatt"));
            att.setDetail(rs3.getString("detail"));
            att.setUnit(rs3.getString("unit"));
            AD.add(att);
        }
        ///
        String sql4= "SELECT DISTINCT tbl_products.id as idp, name, tbl_attribute.type, nameatt, tbl_attribute.unit AS unit,tbl_att_int.detail as detail "
                + "FROM tbl_attribute, tbl_att_int, tbl_products WHERE tbl_products.id = tbl_att_int.idp "
                + "AND tbl_att_int.idatt = tbl_attribute.id AND tbl_products.id = "+msp+" ORDER BY tbl_products.id ASC ";
        ResultSet rs4 = helper.executeQuery(sql4);
        
        while(rs4.next()){
            attDetail att = new attDetail();
            att.setName(rs4.getString("nameatt"));
            att.setDetail(rs4.getString("detail"));
            att.setUnit(rs4.getString("unit"));
            AD.add(att);
        }
        ///
        String sql5= "SELECT DISTINCT tbl_products.id as idp, name, tbl_attribute.type, nameatt, tbl_attribute.unit AS unit,tbl_att_varchar.detail as detail "
                + "FROM tbl_attribute, tbl_att_varchar, tbl_products WHERE tbl_products.id = tbl_att_varchar.idp "
                + "AND tbl_att_varchar.idatt = tbl_attribute.id AND tbl_products.id = "+msp+" ORDER BY tbl_products.id ASC ";
        ResultSet rs5 = helper.executeQuery(sql5);
        
        while(rs5.next()){
            attDetail att = new attDetail();
            att.setName(rs5.getString("nameatt"));
            att.setDetail(rs5.getString("detail"));
            att.setUnit(rs5.getString("unit"));
            AD.add(att);
        }

        
        helper.close();
        return AD;
        }
        catch(Exception ex){
            return null;
        } 
     }   
}
