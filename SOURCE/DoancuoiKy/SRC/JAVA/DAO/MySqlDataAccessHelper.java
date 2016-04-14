/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NHAnh
 * @version 1.0
 */
public class MySqlDataAccessHelper {

   /**
    * Thuộc tính đối tượng kết nối cơ sở dữ liệu
    */
   private Connection connection;

   /**
    * Phương thức cung cấp đối tượng kết nối đến cơ sở dữ liệu
    * @return đối tượng kết nối
    */
   public Connection getConnection() {
      return connection;
   }

   /**
    * Mở kết nối đến cơ sở dữ liệu
    */
   public void open() {
      try {
         DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
         String connectionString = "jdbc:mysql://localhost:3306/cuoiky";
         Properties pros = new Properties();
         pros.setProperty("characterEncoding", "utf8");
         pros.setProperty("user", "root");
         pros.setProperty("password", "root");
         this.connection = DriverManager.getConnection(connectionString, pros);
      } catch (SQLException ex) {
         System.out.println(ex.getMessage());
      }
   }

   /**
    * Đóng kết nối cơ sở dữ liệu
    */
   public void close() {
      try {
         this.connection.close();
      } catch (SQLException ex) {
         Logger.getLogger(MySqlDataAccessHelper.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   /**
    * Rút trích dữ liệu
    * @param sql câu truy vấn SELECT
    * @return ResultSet
    */
   public ResultSet executeQuery(String sql) {
      ResultSet rs = null;
      try {

         Statement sm = this.connection.createStatement();
         rs = sm.executeQuery(sql);
      } catch (SQLException ex) {
         System.out.println(ex.getMessage());
      }
      return rs;
   }

   /**
    * Thêm, xóa, cập nhật dữ liệu
    * @param sql câu lệnh UPDATE, INSERT, DELETE
    * @return số lượng dòng cập nhật/thêm/xóa được , -1 : thất bại
    * @exception SQLException
    */
   public int executeUpdate(String sql) {
      int num = -1;
      try {
         Statement sm = this.connection.createStatement();
         num = sm.executeUpdate(sql);
      } catch (SQLException ex) {
        System.out.println(ex.getMessage());
      }
      return num;
   }
}
