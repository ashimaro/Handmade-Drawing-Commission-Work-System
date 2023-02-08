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
import model.User;
import model.commissionWork;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 *
 * @author User
 */
public class OrderDAO {

    private final Connection con;

    public OrderDAO() throws SQLException, ClassNotFoundException {
        con = DBConnection.getConnection();
    }

    public void addOrder(Order order) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into orders(drawingDetailsId, userId) values (?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, order.getDrawingDetailsId());
            myPS.setInt(2, order.getUserId());

            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    public List<Order> retrieveAllOrdersByUserId1(int userId) throws ClassNotFoundException, SQLException {

        List<Order> Order = new ArrayList<>();

        String mySQLQuery = "select * from orders where userId=" + userId;

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int drawingDetailsId = rs.getInt("drawingDetailsId");
                int userid = rs.getInt("userId");
                int figureno = rs.getInt("figureno");
                int commissionid = rs.getInt("commissionId");
                int artistId = rs.getInt("artistId");
                String status = rs.getString("status");

                // DrawingDetails drawingDetails = new DrawingDetails();
                /// drawingDetails.setDrawingDetailsId(drawingDetailsId);
                //   drawingDetails.setFigureNo(figureNo);
                //   drawingDetails.setCommissionId(commissionId);
                //  drawingDetails.setUserId(userid);
                Order.add(new Order(orderId, drawingDetailsId, userid, figureno, commissionid, artistId, status));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
        return Order;

    }

    public List<Order> retrieveAllOrdersByUserId(int userId) throws ClassNotFoundException, SQLException {
        List<Order> OrderList = new ArrayList<>();

        Order orderlist;
        ResultSet rs = null;

        try {
            //String sqlQuery = "select * from orders";
            String sqlQuery = "select * from orders where userId=" + userId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                orderlist = new Order();

                orderlist.setOrderId(rs.getInt("orderId"));
                orderlist.setDrawingDetailsId(rs.getInt("drawingDetailsId"));
                orderlist.setUserId(rs.getInt("userId"));
                orderlist.setCommissionId(rs.getInt("commissionId"));
                orderlist.setFigureNo(rs.getInt("qty"));
                orderlist.setStatus(rs.getString("status"));
                orderlist.setRemarks(rs.getString("remarks"));
                orderlist.setTransdatetime(rs.getString("transdatetime"));
                orderlist.setTrackingNumber(rs.getString("trackingNumber"));

                OrderList.add(orderlist);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return OrderList;

    }

    public List<Order> retrieveAllOrdersByArtistId(int userId) throws ClassNotFoundException, SQLException {
        List<Order> OrderList = new ArrayList<>();

        Order orderlist;
        ResultSet rs = null;

        try {
            //String sqlQuery = "select * from orders where artistId = " + userId +"'";
            //String sqlQuery = "select orders.orderId,orders.drawingDetailsId,orders.userId,orders.commissionId,orders.qty,orders.bground,orders.status,commissionwork.userid from orders INNER JOIN commissionwork where commissionwork.userId=" + userId;
            //String sqlQuery = "select orders.orderId,orders.drawingDetailsId,orders.userId,orders.commissionId,orders.qty,orders.bground,orders.status,commissionwork.userid from orders INNER JOIN commissionwork where orders.commissionId = commissionwork.commissionId AND commissionwork.userId=" + userId;
            //String sqlQuery = "select orders.orderId,orders.drawingDetailsId,orders.userId,orders.commissionId,orders.qty,orders.bground,orders.status,orders.artistId,commissionwork.userid from orders INNER JOIN commissionwork where orders.commissionId = commissionwork.commissionId AND order.userId = " + userId;
            //String sqlQuery = "select orders.orderId,orders.drawingDetailsId,orders.userId,orders.commissionId,orders.qty,orders.bground,orders.status,orders.artistId,commissionwork.userid from orders INNER JOIN commissionwork where orders.commissionId = commissionwork.commissionId";
            String sqlQuery = "select orders.orderId,orders.drawingDetailsId,orders.userId,orders.commissionId,orders.qty,orders.bground,orders.status,orders.artistId,commissionwork.userid from orders INNER JOIN commissionwork where orders.commissionId = commissionwork.commissionId AND orders.artistId = " + userId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                orderlist = new Order();

                orderlist.setArtistId(rs.getInt("artistId"));
                orderlist.setOrderId(rs.getInt("orderId"));
                orderlist.setDrawingDetailsId(rs.getInt("drawingDetailsId"));
                orderlist.setUserId(rs.getInt("userId"));
                orderlist.setCommissionId(rs.getInt("commissionId"));
                orderlist.setFigureNo(rs.getInt("qty"));
                orderlist.setStatus(rs.getString("status"));

                //orderList.setName(rs.getString("name"));
                //orderList.setEmail(rs.getString("email"));
                //orderList.setPassword(rs.getString("password"));
                //orderList.setAddress(rs.getString("address"));
                //orderList.setPostcode(rs.getString("postcode"));
                //orderList.setCity(rs.getString("city"));
                OrderList.add(orderlist);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return OrderList;

    }

    public void addPlaceOrder(Order order) throws SQLException, IOException {
        try {
            String mySQLQuery = "INSERT INTO orders (drawingDetailsId, userId, qty,commissionId,artistId) values (?, ?, ?, ?,?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setInt(1, order.getDrawingDetailsId());
            myPS.setInt(2, order.getUserId());
            myPS.setInt(3, order.getFigureNo());
            myPS.setInt(4, order.getCommissionId());
            myPS.setInt(5, order.getArtistId());

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

    public void updateStatus(Order order) throws SQLException, IOException, ClassNotFoundException {

        try {
            int tmpOrderId;

            tmpOrderId = order.getOrderId();

            String myQ = "update orders set status=?, remarks=?, trackingNumber=? where orderId=" + tmpOrderId;

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, order.getStatus());
            myPS.setString(2, order.getRemarks());
            myPS.setString(3, order.getTrackingNumber());

            //orderId
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

    public void updatePayment(Order order) throws SQLException, IOException, ClassNotFoundException {

        try {
            int tmpOrderId;

            tmpOrderId = order.getOrderId();
            String myQ = "update orders set paymentFile=? where orderId=" + tmpOrderId;

            PreparedStatement myPS = con.prepareStatement(myQ);

            Part filePart = order.getPaymentFile();
            InputStream inputStream = null;

            inputStream = filePart.getInputStream();

            myPS.setBlob(1, inputStream);
            //myPS.setInt(2, order.getOrderId());

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

    public Order retrieveOrderById(int orderId) throws ClassNotFoundException, SQLException {

        Order order = new Order();

        try {
            PreparedStatement myPS = DBConnection.getConnection()
                    .prepareStatement("select * from orders where orderId=?");

            myPS.setInt(1, orderId);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                order.setOrderId(rs.getInt("orderId"));

                order.setUserId(rs.getInt("userId"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return order;
    }

    public List<Order> getAllOrder(int artistId) throws ClassNotFoundException, SQLException {
List<Order> order = new ArrayList<>();
       Order Order1;
        ResultSet rs = null;

         Order1 = new Order();
    int tempArtistId=Order1.getArtistId();
         try {
              //String sqlQuery = "select * from orders";
             // String sqlQuery = "select * from orders where artistId like 7";
            String sqlQuery = "select * from orders where artistId like " +artistId;

PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            //int userId = Order.getUserId();
            //String begindate= "2022-01-01";// Order.getBeginDate();
            //String enddate ="01-Dec-2022";// Order.getEndDate();
            //String sqlQuery;

            //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd hh:mm:ss");
            //formatter.setTimeZone(TimeZone.getTimeZone("Asia/Singapore"));
            // DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            //begindate = begindate + " 00:00:10"; 
            //enddate = enddate + " 23:59:59"; 
            //LocalDate bdate = LocalDate.parse(begindate, format);
            // LocalDate edate = LocalDate.parse(enddate, format);
            //if (artistId !=0)
            //{
             
            // sqlQuery = "select * from orders WHERE transdatetime BETWEEN '" + bdate + "' AND '" + edate + "'";
            //}

            
            while (rs.next()) {
                //Order = new Order();
                Order1.setOrderId(rs.getInt("orderId"));
                Order1.setArtistId(rs.getInt("artistId"));
                Order1.setUserId(rs.getInt("userId"));
                Order1.setCommissionId(rs.getInt("commissionId"));
                Order1.setFigureNo(rs.getInt("qty"));
                Order1.setStatus(rs.getString("status"));
              
                Order1.setTransdatetime(rs.getString("transdatetime"));
                Order1.setTrackingNumber(rs.getString("trackingNumber"));

                order.add(Order1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return order;

        /*
    List<Order> order = new ArrayList<>();
Order Order;
        String mySQLQuery = "select * from orders";

        try (Connection connection = getConnection();
                PreparedStatement preparedStatement
                = connection.prepareStatement(mySQLQuery);) {
            System.out.print(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Order = new Order();
                int orderId = rs.getInt("orderId");
                int artistId = rs.getInt("artistId");
                int userId = rs.getInt("userId");
                int commissionId = rs.getInt("commissionId");
                int figureno = rs.getInt("figureno");
                String status = rs.getString("status");
                String trackingNumber = rs.getString("trackingNumber");

                order.add(new Order(orderId, commissionId, userId, artistId, figureno, status, trackingNumber));
                //  commissionWork.add(new commissionWork(commissionId, commissionName, commissionPrice, commissionBackground, commissionDesc, artistId));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
        return order;
         */
    }
    /*
    public void updatePaymentDetails(UpdatePaymentFile UpdatePaymentFile) throws SQLException, IOException {
        try {
            //String myQ = "update drawingdetails set figureNo=?, imageOrder=?, userId=?, commissionId=? where drawingDetailsId=?";
            String myQ = "update order set paymentFile=? where drawingDetailsId=?";

            PreparedStatement myPs = con.prepareStatement(myQ);

            Part filePart = drawingDetails.getImageOrder();
            InputStream inputStream = null;

            inputStream = filePart.getInputStream();

            myPs.setString(1, drawingDetails.getStatus());
            //myPs.setBlob(2, inputStream);
            //myPs.setInt(3, drawingDetails.getUserId());
            //myPs.setInt(4, drawingDetails.getCommissionId());
            //myPs.setInt(5, drawingDetails.getDrawingDetailsId());

            myPs.executeQuery();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }

     */


public List<Order> searcheAllOrdersByArtistId(int userId) throws ClassNotFoundException, SQLException {
        List<Order> OrderList = new ArrayList<>();

        Order orderlist;
        ResultSet rs = null;
String sqlQuery;
        
        try {
            
            
            
            if (userId!=0)
            {
                 sqlQuery = "select * from orders where artistId = " + userId  ; 
            }
            else
            {
                 sqlQuery = "select * from orders";   
            }
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                orderlist = new Order();

                orderlist.setArtistId(rs.getInt("artistId"));
                orderlist.setOrderId(rs.getInt("orderId"));
                orderlist.setDrawingDetailsId(rs.getInt("drawingDetailsId"));
                orderlist.setUserId(rs.getInt("userId"));
                orderlist.setCommissionId(rs.getInt("commissionId"));
                orderlist.setFigureNo(rs.getInt("qty"));
                orderlist.setStatus(rs.getString("status"));
                orderlist.setTrackingNumber(rs.getString("trackingNumber"));
                orderlist.setTransdatetime(rs.getString("transdatetime"));

                //orderList.setName(rs.getString("name"));
                //orderList.setEmail(rs.getString("email"));
                //orderList.setPassword(rs.getString("password"));
                //orderList.setAddress(rs.getString("address"));
                //orderList.setPostcode(rs.getString("postcode"));
                //orderList.setCity(rs.getString("city"));
                OrderList.add(orderlist);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return OrderList;

    }}

