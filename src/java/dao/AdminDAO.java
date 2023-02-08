
package dao;

/**
 *
 * @author Ashwini
 */

import database.DBConnection;
import java.io.IOException;
import model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminDAO {
    
   private final Connection con;
    
    public AdminDAO() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }
    
    public void save(Admin admin) throws SQLException{
        try {
            String mySQLQuery = "insert into admin(adminEmail, adminPassword, adminName) values(?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, admin.getAdminEmail());
            myPS.setString(2, admin.getAdminPassword());
            myPS.setString(3, admin.getAdminPassword());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    public Admin authentication (String adminEmail, String adminPassword) throws SQLException{
        ResultSet rs = null;
        Admin admin = null;
        
        try {
            String mySQLQuery = "select * from admin where adminEmail=? and adminPassword=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, adminEmail);
            ps.setString(2, adminPassword);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                admin = new Admin();
                
               admin.setAdminEmail(adminEmail);
               admin.setAdminPassword(adminPassword);
               admin.setAdminId(rs.getInt(1));
               admin.setAdminName(rs.getString(2));

            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return admin;
    }
    
   
    public Admin retrieveAdminByAdminId(int adminId) throws ClassNotFoundException, SQLException {

        Admin admin = new Admin();
       
        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from admin where adminId=?");

            myPS.setInt(1, adminId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                admin.setAdminId(rs.getInt(adminId));
                admin.setAdminEmail(rs.getString("adminEmail"));
                admin.setAdminPassword(rs.getString("adminPassword"));
                admin.setAdminName(rs.getString("adminName"));
                
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return admin;
    }
  
    
    public void update(Admin admin)throws SQLException, IOException, ClassNotFoundException{
        
        try {
            String myQ = "update admin set adminEmail=?, adminPassword=?, adminName=? where adminId=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, admin.getAdminEmail());
            myPS.setString(2, admin.getAdminPassword());
            myPS.setString(3, admin.getAdminName());
            myPS.setInt(4, admin.getAdminId());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public void delete(Admin admin){
        
        String myQ = "DELETE FROM admin WHERE adminId=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, admin.getAdminId());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
}
 
