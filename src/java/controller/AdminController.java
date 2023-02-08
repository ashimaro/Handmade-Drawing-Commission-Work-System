/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Admin;
import dao.AdminDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ashwini
 */

@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException{
        
         String action = request.getParameter("action");
      if (action != null){
            switch(action){
                case "register":
                    saveAdmin(request, response);
                    break;
                
                case "Login":
                    retrieveAdmin(request, response);
                    break;
                    
                case "update":
                    updateAdmin(request, response);
                    break;
                
                
                case "signout":
                    signOut(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "dashboard.jsp");
        }
        
    }
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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

 private void saveAdmin(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        //get all data from signup
        
        String adminEmail = req.getParameter("adminEmail");
        String adminPassword = req.getParameter("adminPassword");
        String adminName = req.getParameter("adminName");
        
        //keep data into javabeans
        Admin newAdmin = new Admin();
        
        newAdmin.setAdminEmail(adminEmail);
        newAdmin.setAdminPassword(adminPassword);
        newAdmin.setAdminName(adminName);
        
        
        //pass the bean to DAO
        AdminDAO admindao = new AdminDAO();
        admindao.save(newAdmin);
        
        //save the bean as attribute and pass to view
        req.setAttribute("admin", newAdmin);
        resp.sendRedirect("adminLogin.jsp");
    }
    
    private void retrieveAdmin(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        if(req.getParameter("action") != null){
            
            String email = req.getParameter("adminEmail");
            String password = req.getParameter("adminPassword");
            
            AdminDAO adminDAO = new AdminDAO();
            
            try {
                Admin admin = adminDAO.authentication(email, password);
                
                if(admin != null){
                    
                    HttpSession session = req.getSession();
                    session.setAttribute("admin", admin);
                    resp.sendRedirect("adminDashboard.jsp");
                    
                } else {
                    req.setAttribute("error", "Invalid email or password!");
                    RequestDispatcher rd = req.getRequestDispatcher("adminLogin.jsp");
                    rd.forward(req,resp);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }
        
    }
    
    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        String adminEmail = request.getParameter("adminEmail");
        String adminPassword = request.getParameter("adminPassword");
        String adminName = request.getParameter("adminName");
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        
        Admin admin = new Admin();
        
        admin.setAdminEmail(adminEmail);
        admin.setAdminPassword(adminPassword);
        admin.setAdminName(adminName);
        admin.setAdminId(adminId);
        
        AdminDAO adminDAO = new AdminDAO();
        
        adminDAO.update(admin);
        
        HttpSession session = request.getSession();
        session.setAttribute("admin", admin);
        
        response.sendRedirect("adminDashboard.jsp");
    }
    
    private void signOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        request.getSession().removeAttribute("admin");
        
        response.sendRedirect("adminLogin.jsp");
    }
}