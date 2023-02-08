package dao;

/**
 *
 * @author Ashi
 */
import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import model.User;
import model.commissionWork;
import dao.UserDAO;

public class CommissionDAO {

    private final Connection con;

    public CommissionDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void register(commissionWork commissionWork) throws SQLException, IOException {
        try {
            
            
            String mySQLQuery = "insert into commissionwork(commissionName, commissionPrice, commissionBackground, commissionDesc, commissionImage, userId) values(?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, commissionWork.getCommissionName());
            myPS.setDouble(2, commissionWork.getCommissionPrice());
            myPS.setDouble(3, commissionWork.getCommissionBackground());
            myPS.setString(4, commissionWork.getCommissionDesc());

            Part filePart = commissionWork.getCommissionImage();
            InputStream inputStream = null;

            if (filePart != null) {
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(5, inputStream);
            }

            myPS.setInt(6, commissionWork.getArtistId());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }
    public List<commissionWork> retrieveAllcommissionwWorkById(int userid) throws ClassNotFoundException, SQLException {

        List<commissionWork> commissionWork = new ArrayList<>();

        String mySQLQuery = "select * from commissionwork where userId=" + userid;

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int commissionId = rs.getInt("commissionId");
                String commissionName = rs.getString("commissionName");
                Double commissionPrice = rs.getDouble("commissionPrice");

                double commissionBackground = rs.getDouble("commissionBackground");
                String commissionDesc = rs.getString("commissionDesc");
                int artistId = rs.getInt("userId");

             
             commissionWork.add(new commissionWork(commissionId, commissionName, commissionPrice, commissionBackground, commissionDesc, artistId));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return commissionWork;
    }

    public List<commissionWork> getAllcommissionWork() throws ClassNotFoundException, SQLException {

        List<commissionWork> commissionWork = new ArrayList<>();

        // String mySQLQuery = "select * from commissionwork WHERE userId NOT LIKE '7'"; ( this is manually)
      //  String mySQLQuery = "select * from commissionwork WHERE userId NOT LIKE " + userid;
           String mySQLQuery = "select * from commissionwork";

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int commissionId = rs.getInt("commissionId");
                String commissionName = rs.getString("commissionName");
                Double commissionPrice = rs.getDouble("commissionPrice");
                double commissionBackground = rs.getDouble("commissionBackground");
                String commissionDesc = rs.getString("commissionDesc");
                int artistId = rs.getInt("userId");
                commissionWork.add(new commissionWork(commissionId, commissionName, commissionPrice, commissionBackground, commissionDesc, artistId));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return commissionWork;
    }

    public commissionWork retrievecommissionWorkById(int commissionId) throws ClassNotFoundException, SQLException {

        commissionWork commissionWork = new commissionWork();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from commissionwork where commissionId=?");

            myPS.setInt(1, commissionId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                commissionWork.setCommissionId(rs.getInt("commissionId"));
                commissionWork.setCommissionName(rs.getString("commissionName"));
                commissionWork.setCommissionPrice(rs.getDouble("commissionPrice"));
                commissionWork.setCommissionBackground(rs.getDouble("commissionBackground"));
                commissionWork.setCommissionDesc(rs.getString("commissionDesc"));
                commissionWork.setArtistId(rs.getInt("userId"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return commissionWork;
    }

    public void updatecommissionWork(commissionWork commissionWork) throws SQLException, IOException, ClassNotFoundException {
        try {
            String myQ = "update commissionwork set commissionName=?, commissionPrice=?, commissionBackground=?, commissionDesc=?, commissionImage=? where commissionId=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            Part filePart = commissionWork.getCommissionImage();
            InputStream inputStream = null;

            inputStream = filePart.getInputStream();

            // fetches input stream of the upload file for the blob column
            myPS.setString(1, commissionWork.getCommissionName());
            myPS.setDouble(2, commissionWork.getCommissionPrice());
            myPS.setDouble(3, commissionWork.getCommissionBackground());
            myPS.setString(4, commissionWork.getCommissionDesc());
            myPS.setBlob(5, inputStream);
            myPS.setInt(6, commissionWork.getCommissionId());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public void deletecommissionWork(commissionWork commissionWork) {

        String myQ = "delete from commissionwork where commissionId=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, commissionWork.getCommissionId());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
