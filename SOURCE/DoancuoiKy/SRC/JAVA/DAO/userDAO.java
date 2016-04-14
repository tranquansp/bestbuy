/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import pojo.user;
import java.sql.*;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author FreeX
 */
public class userDAO {
      public static boolean checkUser(String u,String p){
        ArrayList<user> list = new ArrayList<user>();
        
        
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        try { 
            String hql =String.format("SELECT u form user u WHERE u.nameu = '%s' and password = '%s'",u,p);
            org.hibernate.Query query = session.createQuery(hql); 
            list = (ArrayList<user>) query.list(); 
        } catch (HibernateException ex) { 
            //Log the exception 
            System.err.println(ex); 
        } finally { 
            session.close(); 
        } 
        if(!list.isEmpty())
            return true;
        return false;
    }
           
       public static user layUser(String u,String p){
        ArrayList<user> list = new ArrayList<user>();
        
        
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        try { 
            String hql =String.format("SELECT u form user u WHERE u.nameu = '%s' and password = '%s'",u,p);
            org.hibernate.Query query = session.createQuery(hql); 
            list = (ArrayList<user>) query.list(); 
        } catch (HibernateException ex) { 
            //Log the exception 
            System.err.println(ex); 
        } finally { 
            session.close(); 
        }
        if(!list.isEmpty())
            return list.get(0);
        return new user();
     }
     
    public static int suaUS(String ten,String dc,String sdt,String id){
            Session session = HibernateUtil.getSessionFactory().openSession(); 
        Transaction trans=null;
        user us= new user();
        us.setNameu(ten);
        us.setAddressu(dc);
        us.setPhoneu(sdt);
        us.setIdu(Integer.parseInt(id));
        
        try { 
            trans=session.beginTransaction();
            
            session.update(us);
            
            trans.commit();
            
        } catch (HibernateException ex) { 
            //Log the exception 
            trans.rollback();
            System.err.println(ex); 
        } finally { 
            session.close(); 
        } 
            return 1;
      } 
    public static int xoaUS(String id){
            int maSP = 0;
            try{
                MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
                helper.open();
                String sql = "DELETE FROM  `shopcart`.`tbl_user` WHERE "
                        + "`tbl_user`.`id` = " +id;
                int i =helper.executeUpdate(sql);
                helper.close();
            }
            catch(Exception ex){
                return 0;
            }
            return 1;
      } 
    
    public static ArrayList<user> layDSUser(){
       ArrayList<user> list = new ArrayList<user>();
        
        
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        try { 
            String hql ="SELECT u form user u WHERE user_lv <> 10";
            org.hibernate.Query query = session.createQuery(hql); 
            list = (ArrayList<user>) query.list(); 
        } catch (HibernateException ex) { 
            //Log the exception 
            System.err.println(ex); 
        } finally { 
            session.close(); 
        }
       
        return list;
    }
       
       public static boolean themUser(String name,String pass,String email,String fullname,String address,String phone){

        try{
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themuser(?,?,?,?,?,?,?)}");

            statement.setString(1, name);
            statement.setString(2,pass);
            statement.setString(3, email);
            statement.setString(4, fullname);
            statement.setString(5, address);
            statement.setString(6, phone);
            statement.registerOutParameter(7,Types.INTEGER);
            statement.execute();

            int maDanhMuc = statement.getInt(7);
            if(maDanhMuc > 0){
                return true;
            }
            
        }
        catch(Exception ex){
        }
           return false;
       }
}
