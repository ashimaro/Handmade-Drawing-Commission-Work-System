package dao;

/**
 *
 * @author Ashwini
 */

import database.DBConnection;
import static database.DBConnection.getConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;

public class FeedbackDAO {
     private final Connection con;

    public FeedbackDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void addFeedback(Feedback feedback) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into feedback(feedback, commissionId, userId, starrate) values(?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, feedback.getFeedback() );
            myPS.setInt(2, feedback.getCommissionId() );
            myPS.setInt(3, feedback.getUserId());
            myPS.setInt(4, feedback.getFeedbackStar());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

    public List<Feedback> retrieveAllFeedbackByUserId(int userId) throws ClassNotFoundException, SQLException {

        List<Feedback> feedbacks = new ArrayList<>();

        String mySQLQuery = "select * from feedback where userId=" + userId;

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement  = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                String feedbackDesc = rs.getString("feedback");
                int feedbackstar = rs.getInt("starrate");
                int commissionId = rs.getInt("commissionId");
                int userid = rs.getInt("userId");

               Feedback feedback = new Feedback();

                feedback.setFeedbackId(feedbackId);
                feedback.setFeedback(feedbackDesc);
                feedback.setFeedbackStar(feedbackstar);
                feedback.setCommissionId(commissionId);
                feedback.setUserId(userid);

                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return feedbacks;
    }
    
    public List<Feedback> retrieveAllFeedbackByCommissionId(int commissionId) throws ClassNotFoundException, SQLException {

        List<Feedback> feedbacks = new ArrayList<>();

        String mySQLQuery = "select * from feedback where commissionId="+ commissionId + " AND (feedback != '' OR starrate != 0)";
        
               // + " AND feedback != '' AND starrate != '0')

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                String feedbackDesc = rs.getString("feedback");
                int feedbackstar = rs.getInt("starrate");
                int commissionid = rs.getInt("commissionId");
                int userId = rs.getInt("userId");

                Feedback feedback = new Feedback();

                feedback.setFeedbackId(feedbackId);
                feedback.setFeedback(feedbackDesc);
                feedback.setFeedbackStar(feedbackstar);
                feedback.setCommissionId(commissionid);
                feedback.setUserId(userId);

                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return feedbacks;
    }

    public Feedback retrieveFeedbackById(int feedbackId) throws ClassNotFoundException, SQLException {

       Feedback feedback = new Feedback();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from feedback where feedbackId=?");

            myPS.setInt(1, feedbackId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                feedback.setCommissionId(rs.getInt("commissionId"));
                feedback.setFeedbackId(rs.getInt("feedbackId"));
                feedback.setFeedback(rs.getString("feedback"));
                feedback.setFeedbackStar(rs.getInt("starrate"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return feedback;
    }

    public List<Feedback> retrieveFeedbackByCommissionUserId(int userId, int commissionId) throws ClassNotFoundException, SQLException {

        List<Feedback> listFeedback = new ArrayList<>();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from feedback where commissionId=? AND userId=?");

            myPS.setInt(1, commissionId);
            myPS.setInt(2, userId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                String feedbackDesc = rs.getString("feedback");
                int feedbackstar = rs.getInt("starrate");
                int commissionid = rs.getInt("commissionId");
                int userid = rs.getInt("userId");

                Feedback feedback= new Feedback();

                feedback.setFeedbackId(feedbackId);
                feedback.setFeedback(feedbackDesc);
                feedback.setFeedbackStar(feedbackstar);
                feedback.setCommissionId(commissionid);
                feedback.setUserId(userid);

                listFeedback.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return listFeedback;
    }
    

    public int countFeedback(int commissionId) {

        String myQ = "select count(1) from feedback where commissionId=" + commissionId;
        int record = 0;
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);
            
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return record;
        
    }
}