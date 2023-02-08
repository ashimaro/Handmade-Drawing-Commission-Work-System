/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DrawingDetailsDAO;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.DrawingDetails;

/**
 *
 * @author Ashwini
 */
@MultipartConfig(maxFileSize = 16177215)
public class DrawingControlller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addDrawingDetails(request, response);
                    break;

                case "update":
                    updateDrawingDetails(request, response);
                    break;

                case "delete":
                    deleteDrawingDetails(request, response);
                    break;

                case "placeOrder":
                    placeOrderDetails(request, response);
                    break;

            }
        } else {
            response.sendRedirect(request.getContextPath() + "login.jsp");
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

    private void addDrawingDetails(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        int figureNo = Integer.parseInt(req.getParameter("figureNo"));
        Part orderImage = req.getPart("orderImage");
        Part orderImage1 = req.getPart("orderImage1");
        Part orderImage2 = req.getPart("orderImage2");
        Part orderImage3 = req.getPart("orderImage3");
        Part orderImage4 = req.getPart("orderImage4");
        Part backgroundImage = req.getPart("backgroundImage");

        int commissionId = Integer.parseInt(req.getParameter("commissionId"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        Double bgPrice = Double.parseDouble(req.getParameter("bgPrice"));

        DrawingDetails newDrawingDetails = new DrawingDetails();

        newDrawingDetails.setFigureNo(figureNo);
        newDrawingDetails.setImageOrder(orderImage);
        newDrawingDetails.setImageOrder1(orderImage1);
        newDrawingDetails.setImageOrder2(orderImage2);
        newDrawingDetails.setImageOrder3(orderImage3);
        newDrawingDetails.setImageOrder4(orderImage4);
        newDrawingDetails.setBackgroundImage(backgroundImage);
        
        newDrawingDetails.setCommissionId(commissionId);
        newDrawingDetails.setUserId(userId);
        newDrawingDetails.setBgPrice(bgPrice);

        //pass the bean to DAO
        DrawingDetailsDAO drawingDetailsDAO = new DrawingDetailsDAO();

        drawingDetailsDAO.addDrawingDetails(newDrawingDetails);

        List<DrawingDetails> listDetails = drawingDetailsDAO.retrieveAllDetailsByUserId(userId);

        HttpSession session = req.getSession();
        session.setAttribute("list", listDetails);

        resp.sendRedirect("checkout.jsp");

    }

    private void updateDrawingDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        // int figureNo = Integer.parseInt(request.getParameter("figureNo"));
        // System.out.println(figureNo);
        // int drawingDetailsId = Integer.parseInt(request.getParameter("drawingDetailsId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        //int commissionId = Integer.parseInt(request.getParameter("commissionId"));
        String status = request.getParameter("status");

        DrawingDetails drawingDetails = new DrawingDetails();

        // drawingDetails.setFigureNo(figureNo);
        // drawingDetails.setDrawingDetailsId(drawingDetailsId);
        //drawingDetails.setUserId(userId);
        // drawingDetails.setCommissionId(commissionId);
        drawingDetails.setStatus(status);

        DrawingDetailsDAO drawingDetailsDAO = new DrawingDetailsDAO();

        drawingDetailsDAO.updateDrawingDetails(drawingDetails);

        drawingDetailsDAO.retrieveAllDetailsByUserId(userId);

        response.sendRedirect("checkout.jsp");
    }

    private void deleteDrawingDetails(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        int drawingDetailsId = Integer.parseInt(request.getParameter("drawingDetailsId"));

        DrawingDetails newDetails = new DrawingDetails();

        newDetails.setDrawingDetailsId(drawingDetailsId);

        DrawingDetailsDAO DAO = new DrawingDetailsDAO();

        DAO.deleteDrawingDetails(newDetails);

        response.sendRedirect("checkout.jsp");

    }

    private void placeOrderDetails(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        int figureNo = Integer.parseInt(req.getParameter("figureNo"));
        int drawingdetailsId = Integer.parseInt(req.getParameter("drawingDetailsId"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        int commissionId = Integer.parseInt(req.getParameter("commissionId"));
        String status = req.getParameter("status");
        //Part orderImage = req.getPart("orderImage");

        DrawingDetails newDrawingDetails = new DrawingDetails();

        newDrawingDetails.setFigureNo(figureNo);
        newDrawingDetails.setDrawingDetailsId(drawingdetailsId);
        newDrawingDetails.setUserId(userId);
        newDrawingDetails.setCommissionId(commissionId);
        newDrawingDetails.setStatus(status);
        //newDrawingDetails.setImageOrder(orderImage);

        //pass the bean to DAO
        DrawingDetailsDAO drawingDetailsDAO = new DrawingDetailsDAO();

        drawingDetailsDAO.addPlaceOrder(newDrawingDetails);

        List<DrawingDetails> listDetails = drawingDetailsDAO.retrieveAllDetailsByUserId(userId);

        HttpSession session = req.getSession();
        session.setAttribute("list", listDetails);

        resp.sendRedirect("purchase.jsp");

    }
}
