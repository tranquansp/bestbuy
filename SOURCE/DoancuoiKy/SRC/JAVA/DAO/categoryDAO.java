/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import pojo.category;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.*;
import util.HibernateUtil;

/**
 *
 * @author FreeX
 */
public class categoryDAO {

    public static ArrayList<category> laydsDanhMuc() {
        ArrayList<category> ds = new ArrayList<category>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = " select dm from category dm ";
            org.hibernate.Query query = session.createQuery(hql);
            ds = (ArrayList<category>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        return ds;
    }

    public static category layDanhMuc(String s) {

        ArrayList<category> ds = new ArrayList<category>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = String.format(" select dm from category dm where dm.ids=%s", s);
            org.hibernate.Query query = session.createQuery(hql);
            ds = (ArrayList<category>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        if (!ds.isEmpty()) {
            return ds.get(0);
        }
        return new category();
    }

    public static ArrayList<category> laydsDanhMucCon() {



        ArrayList<category> ds = new ArrayList<category>();

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = " select dm from category dm where dm.parents != 0 ";
            org.hibernate.Query query = session.createQuery(hql);
            ds = (ArrayList<category>) query.list();
        } catch (HibernateException ex) {
            //Log the exception 
            System.err.println(ex);
        } finally {
            session.close();
        }
        return ds;
    }

    public static int themDM(String dm, int pa) {
        
        int maSP = 0;
        try {
            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
            help.open();
            Connection c = help.getConnection();

            CallableStatement statement = c.prepareCall("{call themDM(?,?,?)}");

            statement.setString(1, dm);
            statement.setInt(2, pa);
            statement.registerOutParameter(3, Types.INTEGER);
            statement.execute();

            maSP = statement.getInt(3);
            help.close();

        } catch (Exception ex) {
            return 0;
        }
        return maSP;
    }

    public static int capnhatDM(String mdm, String ten) {
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        Transaction trans=null;
        category c= new category();
        c.setIds(Integer.parseInt(mdm));
        c.setNames(ten);
        try { 
            trans=session.beginTransaction();
            
            session.update(c);
            
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

    public static int xoaDM(String mdm) {
        try {
            MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
            helper.open();
            String sql = "DELETE FROM  `shopcart`.`tbl_category` WHERE  `tbl_category`.`id` = " + mdm;
            helper.executeUpdate(sql);

            helper.close();
        } catch (Exception ex) {
            return 0;
        }
        return 1;
    }
}
