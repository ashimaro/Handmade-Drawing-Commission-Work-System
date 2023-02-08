package dao;

/**
 *
 * @author Ashimaro
 */
import database.DBConnection;
import java.io.IOException;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class

public class UserDAO {

    private final Connection con;

    public UserDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void save(User user) throws SQLException {
        try {
            String mySQLQuery = "insert into users(name, email, password, address, postcode, city, state, phoneNo) values(?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, user.getName());
            myPS.setString(2, user.getEmail());
            myPS.setString(3, user.getPassword());
            myPS.setString(4, user.getAddress());
            myPS.setString(5, user.getPostcode());
            myPS.setString(6, user.getCity());
            myPS.setString(7, user.getState());
            myPS.setString(8, user.getPhoneNo());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    public User authentication(String email, String password) throws SQLException {
        ResultSet rs = null;
        User user = null;

        try {
            String mySQLQuery = "select * from users where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();

                user.setEmail(email);
                user.setPassword(password);
                user.setUserId(rs.getInt("userid"));
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setPostcode(rs.getString("postcode"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPhoneNo(rs.getString("phoneNo"));
                user.setUserType(rs.getString("usertype"));
                user.setLastLogin(rs.getString("logindatetime"));

                try {
                    String myQ = "update users set logindatetime=? where userId=" + rs.getInt("userid");

                    PreparedStatement myPS = con.prepareStatement(myQ);

                    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm:ss");
                    LocalDateTime myDateObj = LocalDateTime.now();
                    String formattedDate = myDateObj.format(myFormatObj);

                    myPS.setString(1, formattedDate);

                    myPS.executeUpdate();

                } catch (SQLException e) {
                    System.out.println(e.getMessage());

                } finally {
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
          
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }
            con.close();
        }

        return user;
    }

    public List<User> retrieveAll() throws SQLException {
        List<User> userList = new ArrayList<>();

        User userlist;
        ResultSet rs = null;

        try {
            String sqlQuery = "select * from users";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                userlist = new User();

                userlist.setUserId(rs.getInt("userId"));
                userlist.setName(rs.getString("name"));
                userlist.setEmail(rs.getString("email"));
                userlist.setPassword(rs.getString("password"));
                userlist.setAddress(rs.getString("address"));
                userlist.setPostcode(rs.getString("postcode"));
                userlist.setCity(rs.getString("city"));
                userlist.setState(rs.getString("state"));
                userlist.setPhoneNo(rs.getString("phoneNo"));
                userlist.setUserType(rs.getString("usertype"));
                userlist.setLastLogin(rs.getString("logindatetime"));

                userList.add(userlist);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return userList;
    }

    public User retrieveUserByUserId(int userId) throws ClassNotFoundException, SQLException {

        User user = new User();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from users where userId=?");

            myPS.setInt(1, userId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {

                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setPostcode(rs.getString("postcode"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPhoneNo(rs.getString("phoneNo"));
                user.setUserId(rs.getInt("userId"));
                user.setUserType(rs.getString("pubusertype"));
                user.setLastLogin(rs.getString("logindatetime"));
             

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return user;
    }

    public void update(User user) throws SQLException, IOException, ClassNotFoundException {

        try {
            String myQ = "update users set name=?, email=?, password=?, address=?, postcode=?, city=?, state=?, phoneNo=? where userId=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, user.getName());
            myPS.setString(2, user.getEmail());
            myPS.setString(3, user.getPassword());
            myPS.setString(4, user.getAddress());
            myPS.setString(5, user.getPostcode());
            myPS.setString(6, user.getCity());
            myPS.setString(7, user.getState());
            myPS.setString(8, user.getPhoneNo());
            myPS.setInt(9, user.getUserId());
            //myPS.setString(10, user.getUserType());
            //myPS.setString(11, user.getLastLogin());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void updateLastLogin(User user) throws SQLException, IOException, ClassNotFoundException {

        try {
            String myQ = "update users set lastLogin=? where userId=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, user.getName());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void delete(User user) {

        String myQ = "delete from users where userId=?";

        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, user.getUserId());

            myPs.executeUpdate();

            myQ = "delete from commissionwork where userId=?";

            try {
                myPs = con.prepareStatement(myQ);
                myPs.setInt(1, user.getUserId());

                myPs.executeUpdate();
            } catch (SQLException ex) {
                //Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateUserType(User user) throws SQLException, IOException, ClassNotFoundException {

        try {
            int tempUserId;
            tempUserId = user.getUserId();

            String myQ = "update users set userType=? where userId=" + tempUserId;

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, user.getUserType());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
