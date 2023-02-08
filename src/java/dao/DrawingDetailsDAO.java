package dao;

import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import model.DrawingDetails;
import model.Order;

/**
 *
 * @author Ashi
 */
public class DrawingDetailsDAO {

    private final Connection con;

    public DrawingDetailsDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void addDrawingDetails(DrawingDetails DrawingDetails) throws SQLException, IOException {
        try {
            String mySQLQuery = "INSERT INTO drawingdetails (figureNo,orderImage,orderImage1,orderImage2,orderImage3,orderImage4,backgroundImage,commissionId,userId,bgPrice) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, DrawingDetails.getFigureNo());

            /////////////////////////////////////////////////////
            Part filePart = DrawingDetails.getImageOrder();
            InputStream inputStream = null;

            if (filePart != null) {
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(2, inputStream);
            }
            //////////////////////////////////////////////////
            Part filePart1 = DrawingDetails.getImageOrder1();
            InputStream inputStream1 = null;

            if (filePart1 != null) {
                // obtains input stream of the upload file
                inputStream1 = filePart1.getInputStream();
            }

            if (inputStream1 != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(3, inputStream1);
            }

            ///////////////////////////////////////////////////////
            Part filePart2 = DrawingDetails.getImageOrder2();
            InputStream inputStream2 = null;

            if (filePart2 != null) {
                // obtains input stream of the upload file
                inputStream2 = filePart2.getInputStream();
            }

            if (inputStream2 != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(4, inputStream2);
            }
            ////////////////////////////////////////////////////////////
            Part filePart3 = DrawingDetails.getImageOrder3();
            InputStream inputStream3 = null;

            if (filePart3 != null) {
                // obtains input stream of the upload file
                inputStream3 = filePart3.getInputStream();
            }

            if (inputStream3 != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(5, inputStream3);
            }
            ///////////////////////////////////////////////////////////

            Part filePart4 = DrawingDetails.getImageOrder4();
            InputStream inputStream4 = null;

            if (filePart4 != null) {
                // obtains input stream of the upload file
                inputStream4 = filePart4.getInputStream();
            }

            if (inputStream4 != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(6, inputStream4);
            }
            ///////////////////////////////////////////////////////////////
            Part filePart5 = DrawingDetails.getBackgroundImage();
            InputStream inputStream5 = null;

            if (filePart5 != null) {
                // obtains input stream of the upload file
                inputStream5 = filePart5.getInputStream();
            }

            if (inputStream5 != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(7, inputStream5);
            }

//////////////////////////////////////////////
            myPS.setInt(8, DrawingDetails.getCommissionId());
            myPS.setInt(9, DrawingDetails.getUserId());
            myPS.setDouble(10, DrawingDetails.getBgPrice());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    public void addPlaceOrder(DrawingDetails DrawingDetails) throws SQLException, IOException {
        try {
            String mySQLQuery = "INSERT INTO orders (drawingDetailsId, userId, qty,commissionId, status) values (?, ?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, DrawingDetails.getDrawingDetailsId());
            myPS.setInt(2, DrawingDetails.getUserId());
            myPS.setInt(3, DrawingDetails.getFigureNo());
            myPS.setInt(4, DrawingDetails.getCommissionId());
            myPS.setString(5, DrawingDetails.getStatus());

            /*
            Part filePart = DrawingDetails.getImageOrder();
            InputStream inputStream = null;

            if (filePart != null) {
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(2, inputStream);
            }
             */
            //myPS.setInt(2, DrawingDetails.getCommissionId());
            //myPS.setInt(3, DrawingDetails.getUserId());
            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    public List<DrawingDetails> retrieveAllDetailsByUserId(int userId) throws ClassNotFoundException, SQLException {

        List<DrawingDetails> DrawingDetails = new ArrayList<>();
        DrawingDetails dd = new DrawingDetails();
        ResultSet rs = null;
        try {
            String sqlQuery = "select * from drawingdetails where userId= " + userId + " AND status != 'CHECKOUT'";

            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                dd = new DrawingDetails();
                dd.setDrawingDetailsId(rs.getInt("drawingDetailsId"));
                dd.setCommissionId(rs.getInt("commissionId"));
                dd.setUserId(rs.getInt("userId"));
                dd.setFigureNo(rs.getInt("figureNo"));
                dd.setBgPrice(rs.getDouble("bgPrice"));

                DrawingDetails.add(dd);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return DrawingDetails;
    }

    /* 
                
// DrawingDetails drawingDetails = new DrawingDetails();

               /// drawingDetails.setDrawingDetailsId(drawingDetailsId);
             //   drawingDetails.setFigureNo(figureNo);
             //   drawingDetails.setCommissionId(commissionId);
              //  drawingDetails.setUserId(userid);

                DrawingDetails.add(new DrawingDetails(drawingDetailsId, figureNo, commissionId, userid));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
        return DrawingDetails;

    }
     */
    public List<DrawingDetails> retrieveAllDrawingDetailsByCommissionId(int commissionId) throws ClassNotFoundException, SQLException {

        List<DrawingDetails> DrawingDetails = new ArrayList<>();

        String mySQLQuery = "select * from drawingdetails where commissionId=" + commissionId;

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int drawingDetailsId = rs.getInt("drawingDetailsId");
                int figureNo = rs.getInt("figureNo");
                int commissionid = rs.getInt("commissionId");
                int userid = rs.getInt("userId");

                DrawingDetails drawingDetails = new DrawingDetails();

                drawingDetails.setDrawingDetailsId(drawingDetailsId);
                drawingDetails.setFigureNo(figureNo);
                drawingDetails.setCommissionId(commissionid);
                drawingDetails.setUserId(userid);

                DrawingDetails.add(drawingDetails);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return DrawingDetails;

    }

    public DrawingDetails retrieveDrawingDetailsById(int drawingDetailsId) throws ClassNotFoundException, SQLException {
        DrawingDetails drawingDetails = new DrawingDetails();

        try {
            PreparedStatement myPs = DBConnection.getConnection().prepareStatement("select * from drawingdetails where drawingDetailsId =?");

            myPs.setInt(1, drawingDetailsId);
            ResultSet rs = myPs.executeQuery();

            while (rs.next()) {
                drawingDetails.setCommissionId(rs.getInt("commissionId"));
                drawingDetails.setDrawingDetailsId(rs.getInt("drawingDetailsId"));
                drawingDetails.setFigureNo(rs.getInt("figureNo"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
        return drawingDetails;
    }

    public List<DrawingDetails> retrieveDrawingDetailsByCommissionUserId(int userId, int commissionId) throws ClassNotFoundException, SQLException {

        List<DrawingDetails> listDD = new ArrayList<>();

        try {
            PreparedStatement myPS = DBConnection.getConnection().prepareStatement("select * from drawingdetails where commissionId=? AND userId=?");

            myPS.setInt(1, commissionId);
            myPS.setInt(2, userId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                int drawingDetailsId = rs.getInt("drawingDetailsId");
                int figureNo = rs.getInt("figureNo");
                int commissionid = rs.getInt("commissionId");
                int userid = rs.getInt("userId");

                DrawingDetails drawingDetails = new DrawingDetails();

                drawingDetails.setDrawingDetailsId(drawingDetailsId);
                drawingDetails.setFigureNo(figureNo);
                drawingDetails.setCommissionId(commissionid);
                drawingDetails.setUserId(userid);

                listDD.add(drawingDetails);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();

        }
        return listDD;
    }

    public int countFigureNo(int commissionId) {
        String myQ = "select count(1) from drawingdetails where commissionId=" + commissionId;
        int record = 0;

        try {
            Statement statement = con.createStatement();
            ResultSet rsExist = statement.executeQuery(myQ);

            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CommissionDAO.class.getName()).log(Level.SEVERE, null, myQ);
        }

        return record;
    }

    public void updateDrawingDetails(DrawingDetails drawingDetails) throws SQLException, IOException, ClassNotFoundException {
        try {
            String myQ = "update drawingdetails  userId=?, status=?, where drawingDetailsId=?";

            PreparedStatement myPs = con.prepareStatement(myQ);

            // Part filePart = drawingDetails.getImageOrder();
            // InputStream inputStream = null;
            //  inputStream = filePart.getInputStream();
            //  myPs.setInt(1, drawingDetails.getFigureNo());
            // myPs.setBlob(2, inputStream);
            myPs.setInt(1, drawingDetails.getUserId());
            // myPs.setInt(4, drawingDetails.getCommissionId());
            // myPs.setInt(5, drawingDetails.getDrawingDetailsId());
            myPs.setString(2, drawingDetails.getStatus());

            myPs.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public void deleteDrawingDetails(DrawingDetails drawingDetails) {
        String myQ = "delete from drawingdetails where drawingDetailsId=?";

        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, drawingDetails.getDrawingDetailsId());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
