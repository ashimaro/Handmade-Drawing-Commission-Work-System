package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;
import dao.DrawingDetailsDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Admin;
import model.DrawingDetails;
import model.Order;
import model.commissionWork;

import static java.lang.System.out;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ashwini.
 */
@MultipartConfig(maxFileSize = 16177215)
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "placeOrder":
                    placeOrderDetails(request, response);
                    break;

                case "updateStatus":
                    updateStatus(request, response);
                    break;

                case "upfile":
                    uploadImgPayment(request, response);
                    break;

               // case "retrieveReport":
                   // retrieveReport(request, response);
                   // break;

            }
        } else {
            response.sendRedirect(request.getContextPath() + "index.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CommissionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CommissionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
        int drawingDetailsId = Integer.parseInt(req.getParameter("drawingDetailsId"));

        int userId = Integer.parseInt(req.getParameter("userId"));

        Order newOrder = new Order();

        newOrder.setDrawingDetailsId(drawingDetailsId);
        newOrder.setUserId(userId);

        //pass the bean to DAO
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.addOrder(newOrder);

        List<Order> listOrder = orderDAO.retrieveAllOrdersByUserId(userId);

        HttpSession session = req.getSession();
        session.setAttribute("list", listOrder);

        resp.sendRedirect("order.jsp");

    }

    private void placeOrderDetails(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        int figureNo = Integer.parseInt(req.getParameter("figureNo"));
        int drawingdetailsId = Integer.parseInt(req.getParameter("drawingDetailsId"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        int commissionId = Integer.parseInt(req.getParameter("commissionId"));
        int artistId = Integer.parseInt(req.getParameter("artistId"));
        //Part orderImage = req.getPart("orderImage");

        Order newOrder = new Order();

        //newOrder.setOrderId(orderId);
        newOrder.setFigureNo(figureNo);
        newOrder.setDrawingDetailsId(drawingdetailsId);
        newOrder.setUserId(userId);
        newOrder.setCommissionId(commissionId);
        newOrder.setArtistId(artistId);
        newOrder.setStatus("NEW");
        //newDrawingDetails.setImageOrder(orderImage);

        //pass the bean to DAO
        OrderDAO orderDAO = new OrderDAO();

        orderDAO.addPlaceOrder(newOrder);

        List<Order> listOrder = orderDAO.retrieveAllOrdersByUserId(userId);

        HttpSession session = req.getSession();
        session.setAttribute("list", listOrder);

        resp.sendRedirect("purchase.jsp");

    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        String newStatus = request.getParameter("e_status");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newRemarks = request.getParameter("remarks");
        String trackingNumber = request.getParameter("trackingNumber");

        Order order = new Order();

        order.setStatus(newStatus);
        order.setRemarks(newRemarks);
        order.setTrackingNumber(trackingNumber);
        order.setOrderId(orderId);

        OrderDAO orderDAO = new OrderDAO();

        orderDAO.updateStatus(order);

        response.sendRedirect("order.jsp");

    }

    private void uploadImgPayment(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        OrderDAO orderDAO = new OrderDAO();

        Part paymentFile = request.getPart("paymentFile");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        //int userId = Integer.parseInt(request.getParameter("userId"));

        // if (paymentFile.getName().isEmpty()) {
        //   Order order = orderDAO.retrieveOrderById(userId);
        //    paymentFile = order.getPaymentFile();
        //    }
        Order order = new Order();

        order.setPaymentFile(paymentFile);
        order.setOrderId(orderId);
        //order.setUserId(userId);

        orderDAO.updatePayment(order);
        //orderDAO.retrieveOrderById(userId);

        response.sendRedirect("purchase.jsp");

        /*
        //int figureNo = Integer.parseInt(req.getParameter("orderId"));
       Part orderImage = req.getPart("orderImage");
       
       //Order updatePaymentFile = new Order();
        
       //updatePaymentFile.setFigureNo(figureNo);
       //updatePaymentFile.setPaymentFile(orderImage);
        /*
        //pass the bean to DAO
        OrderDAO orderDAO = new OrderDAO();
         
        orderDAO.updatePayment(updatePaymentFile);
        
        //List<DrawingDetails> listDetails = orderDAO.retrieveAllDetailsByUserId(userId);
        
        //HttpSession session = req.getSession();
        //session.setAttribute("list",listDetails);


        resp.sendRedirect("purchase1.jsp");
         */
 /*Part paymentFile = request.getPart("orderImage");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        //int userId = Integer.parseInt(request.getParameter("userId"));

       // if (paymentFile.getName().isEmpty()) {
         //   Order order = orderDAO.retrieveOrderById(userId);
        //    paymentFile = order.getPaymentFile();
    //    }

        Order order = new Order();

        order.setPaymentFile(paymentFile);
        order.setOrderId(orderId);
        //order.setUserId(userId);

        orderDAO.updatePayment(order);
        //orderDAO.retrieveOrderById(userId);
         */
        //response.sendRedirect("purchase.jsp");
    }

    private void retrieveReport(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        int artistId = Integer.parseInt(request.getParameter("artistId"));
       // String beginDate = request.getParameter("begindate");
       // String endDate = request.getParameter("enddate");
        
        Order newOrder = new Order();
        //newOrder.setUserId(userId);
        newOrder.setArtistId(artistId);
        //newOrder.setBeginDate(beginDate);
        //newOrder.setEndDate(endDate);
        
        
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.getAllOrder(artistId);
        response.sendRedirect("adminreport.jsp");

    }

    private void signOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        request.getSession().removeAttribute("admin");

        response.sendRedirect("adminLogin.jsp");
    }
}