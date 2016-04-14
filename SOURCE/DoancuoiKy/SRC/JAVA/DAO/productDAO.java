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
import org.hibernate.HibernateException;
import org.hibernate.Session;
import pojo.*;
import util.HibernateUtil;



public class productDAO {
    public static int themSP1(String tensp,int dm,double tien,String des,String de,int s){
        int maSP = 0;
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themSanPham(?,?,?,?,?,?,?)}");

            statement.setString(1, tensp);
            statement.setInt(2, dm);
            statement.setDouble(3, tien);
            statement.setString(4, des);
            statement.setString(5, de);
            statement.setInt(6, s);

            statement.registerOutParameter(7,Types.INTEGER);
            statement.execute();

            maSP = statement.getInt(7); 
            //System.out.println(maSP);
            
            help.close();

        }
        //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
        catch(Exception ex){
            //System.out.print(ex);
            return 0;
        }
        return maSP;
    }
    public static int themSP2(String hinh,String msp){
        int maSP = 0;
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = "UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  "
                    + hinh +" WHERE store <> 0 `tbl_products`.`id` = "+msp;
            int i =helper.executeUpdate(sql);
            helper.close();
        }
        //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
        catch(Exception ex){
            //System.out.print(ex);
            return 0;
        }
        return 1;
    }
    
    public static int luutruSP(String msp){
        int maSP = 0;
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = "UPDATE  `shopcart`.`tbl_products` SET  `status` = 'No' "
                    + " WHERE  `tbl_products`.`id` = "+msp;
            int i =helper.executeUpdate(sql);
            helper.close();
        }
        //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
        catch(Exception ex){
            //System.out.print(ex);
            return 0;
        }
        return 1;
    }
        
        public static int suaSP(String ten,String gia,String mieuta,String chitiet,String msp){
        int maSP = 0;
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = "UPDATE  `shopcart`.`tbl_products` SET  "
                    + "`name` =  '"+ten+"',"
                    + "`price` =  '"+gia+"',"
                    + "`description` =  '"+mieuta+"',"
                    + "`detail` =  '"+chitiet+"' "
                    + "WHERE  `tbl_products`.`id` = "+msp;
            int i =helper.executeUpdate(sql);
            helper.close();
        }
        //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
        catch(Exception ex){
            //System.out.print(ex);
            return 0;
        }
        return 1;
    }
        
    
    public static int suagiaSP(String gia,String msp){
        int maSP = 0;
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = "UPDATE  `shopcart`.`tbl_products` SET  "
                    + "`price` =  '"+gia+"'"
                    + " WHERE  `tbl_products`.`id` = "+msp;
            int i =helper.executeUpdate(sql);
            helper.close();
        }
        //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
        catch(Exception ex){
            //System.out.print(ex);
            return 0;
        }
        return 1;
    }    
        
        
        
    public static int themluotview(String msp){
        int maSP = 0;
        try{
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = "UPDATE  `shopcart`.`tbl_products` SET  "
                    + "`view` =  `view` + 1 "
                    + "WHERE  `tbl_products`.`id` = "+msp;
            int i =helper.executeUpdate(sql);
            helper.close();
        }
        //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
        catch(Exception ex){
            //System.out.print(ex);
            return 0;
        }
        return 1;
    }    
        
        
    public static int checkANDsub(String msp){
        int k=0;
        try{
        MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
        helper.open();
        String sql = String.format("SELECT FROM tbl_products WHERE category = '%s' status = 'Yes' AND store <> 0", msp);
        ResultSet rs = helper.executeQuery(sql);
        while(rs.next()){
            product sp = new product();

            sp.setIdp(rs.getInt("id"));
            sp.setNamep(rs.getString("name"));
            sp.setCategoryp(rs.getInt("category"));
            sp.setPricep(rs.getDouble("price"));
            sp.setImgfilep(rs.getString("imgfile"));
            sp.setDescp(rs.getString("description"));
            sp.setDetailp(rs.getString("detail"));
            sp.setPublishp(rs.getString("publish"));
            sp.setHotp(rs.getString("hot"));
            sp.setSttp(rs.getString("status"));
            sp.setKeysearchp(rs.getString("keysearch"));
            sp.setViewp(rs.getInt("view"));
            sp.setDatep(rs.getTimestamp("date_create"));
        }
        }
        catch(Exception ex){
            
        }
        return k;
    }
    
   public static ArrayList<product> laydsSanPham(String msp){
       
        
       // String sql = String.format("SELECT * FROM tbl_products WHERE category = '%s' AND store <> 0 AND status = 'Yes' ", msp);
        
        
        ArrayList<product> dmsp = new ArrayList<product>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql =String.format(" select sp from product sp where sp.categoryp=%s and sp.storep !=0 and status ='Yes' ",msp);
            org.hibernate.Query query = session.createQuery(hql);
            dmsp = (ArrayList<product>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        return dmsp;
    }
   
   
      public static ArrayList<product> layAll(){
        
        
       // String sql = String.format("SELECT * FROM tbl_products WHERE store <> 0 ");
        
        
        ArrayList<product> dmsp = new ArrayList<product>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = " select sp from product sp where sp.storep !=0 ";
            org.hibernate.Query query = session.createQuery(hql);
            dmsp = (ArrayList<product>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        return dmsp;
    }
   
   
   
   public static ArrayList<product> showSanPham(String price,String credit_rating,String status){
        
       
       // String sql = String.format("SELECT * FROM tbl_products WHERE price '%s' AND view = '%s' AND hot = '%s'", price,credit_rating,status);
        ArrayList<product> dmsp = new ArrayList<product>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql =String.format(" select sp from product sp where sp.pricep ='%s' and sp.viewp='%s' and sp.hotp ='%s' ",price,credit_rating,status);
            org.hibernate.Query query = session.createQuery(hql);
            dmsp = (ArrayList<product>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        return dmsp;
    }
      
   
   
     public static ArrayList<price> layDothi(String msp){
        ArrayList<price> Ap = new ArrayList<price>();
         try{
        MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
        helper.open();
        
        String sql = String.format("SELECT tbl_price_series.id,tbl_price_series.idp,tbl_price_series.price "
                + "FROM `tbl_price_series`,tbl_products WHERE tbl_products.id = tbl_price_series.idp"
                + " AND tbl_products.id = '%s' LIMIT 0,4"
                + "", msp);
        
        ResultSet rs = helper.executeQuery(sql);

        while(rs.next()){
            //product sp = new product();
            price pr = new price();
            pr.setId(rs.getInt("id"));
            pr.setIdp(rs.getInt("idp"));
            pr.setPrice(rs.getDouble("price"));
            Ap.add(pr);
        }
        helper.close();
        }
        catch(Exception ex){
        
        }
        return Ap;
    }
   
   
      public static product laySanPham(String msp){
    
    
        
      //  String sql = String.format("SELECT * FROM tbl_products WHERE id = '%s' AND store <> 0 AND status = 'Yes' ", msp);
        
        ArrayList<product> dmsp = new ArrayList<product>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql =String.format(" select sp from product sp where sp.idp = %d and sp.storep != 0 and status = 'Yes' ",Integer.parseInt(msp));
            org.hibernate.Query query = session.createQuery(hql);
            dmsp = (ArrayList<product>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        if(!dmsp.isEmpty())
            return dmsp.get(0);
        return new product();
    }
      public static ArrayList<product> timKiemRong(String s){
        try{
        ArrayList<product> A = new ArrayList<product>();
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
        help.open();
        Connection c = help.getConnection();

        CallableStatement statement = c.prepareCall("{call timkiemRong(?)}");

        statement.setString(1,s);
        statement.executeQuery();

        ResultSet rs=statement.getResultSet();
            while(rs.next()){
                product p=new product();
                p.setIdp(rs.getInt("id"));
                p.setNamep(rs.getString("name"));
                p.setCategoryp(rs.getInt("category"));
                p.setPricep(rs.getDouble("price"));
                p.setImgfilep(rs.getString("imgfile"));
                p.setDescp(rs.getString("description"));
                p.setDetailp(rs.getString("detail"));
                p.setPublishp(rs.getString("publish"));
                p.setHotp(rs.getString("hot"));
                p.setSttp(rs.getString("status"));
                p.setKeysearchp(rs.getString("keysearch"));
                p.setViewp(rs.getInt("view"));
                p.setDatep(rs.getTimestamp("date_create"));
                A.add(p);
            }
        help.close();
        return A;
        }
        catch(Exception ex){
        }
        //return 0;
        return null;
      }
      
       public static ArrayList<product> timKiemSau(String s,String ms,double min,double max){
        try{
        ArrayList<product> A = new ArrayList<product>();
        MySqlDataAccessHelper help = new MySqlDataAccessHelper();
        help.open();
        Connection c = help.getConnection();

        CallableStatement statement = c.prepareCall("{call timkiemSau(?,?,?,?)}");

        statement.setString(1,s);
        statement.setInt(2,Integer.parseInt(ms));
        statement.setDouble(3,min);
        statement.setDouble(4,max);
        statement.executeQuery();

        ResultSet rs=statement.getResultSet();
            while(rs.next()){
                product p=new product();
                p.setIdp(rs.getInt("id"));
                p.setNamep(rs.getString("name"));
                p.setCategoryp(rs.getInt("category"));
                p.setPricep(rs.getDouble("price"));
                p.setImgfilep(rs.getString("imgfile"));
                p.setDescp(rs.getString("description"));
                p.setDetailp(rs.getString("detail"));
                p.setPublishp(rs.getString("publish"));
                p.setHotp(rs.getString("hot"));
                p.setSttp(rs.getString("status"));
                p.setKeysearchp(rs.getString("keysearch"));
                p.setViewp(rs.getInt("view"));
                p.setDatep(rs.getTimestamp("date_create"));
                A.add(p);
            }
        help.close();
        return A;
        }
        catch(Exception ex){
        }
        //return 0;
        return null;
      }
            
      public static int themSP(String name,int category,double gia,String hinh,String mieuta,String chitiet,String tk,String time){
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themSanPham(?,?,?,?,?,?,?,?,?)}");

            statement.setString(1, name);
            statement.setInt(2, category);
            statement.setDouble(3, gia);
            statement.setString(4, hinh);
            statement.setString(5, mieuta);
            statement.setString(6, chitiet);
            statement.setString(7, tk);
            statement.setString(8, time);
            statement.registerOutParameter(9,Types.INTEGER);
            statement.execute();

            int maSP = statement.getInt(9); 
            help.close();
            return maSP;
        }
        catch(Exception ex){
        }
      return 0;
    }
      
     
    public static int giamSP(int id,int sl){
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();

            String sql = "UPDATE  `shopcart`.`tbl_products` SET  `store` =  `store` - "+sl+" WHERE  `tbl_products`.`id` = "+ id +";";
            help.executeUpdate(sql);
            help.close();
            return 1;
        }
        catch(Exception ex){
        }
      return 0;
    }
            
            
    public static int themGia(String msp,String price){
        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
              
            String sql = "INSERT INTO `shopcart`.`tbl_price_series` (`id`, `idp`, `price`) VALUES (NULL, "+msp+", "+price+" );";
            help.executeUpdate(sql);
            help.close();
            return 1;
        }
        catch(Exception ex){
        }
      return 0;
    }
            
            
            
}
