
package controller;

import dao.CommissionDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.commissionWork;

@MultipartConfig(maxFileSize = 16177215)
public class CommissionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "register":
                    register(request, response);
                    break;
                    
                case "update":
                    updatecommissionWork(request, response);
                    break;
                
                case "delete":
                    deletecommissionWork(request, response);
                    break;
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

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        //get all data from form
        String commissionName = req.getParameter("commissionName");
        Double commissionPrice = Double.parseDouble (req.getParameter("commissionPrice"));
        Double commissionBackground = Double.parseDouble(req.getParameter("commissionBackground"));
        String ccommissionDesc = req.getParameter("commissionDesc");
        
        Part commissionImage = req.getPart("commissionImage");
        int userId = Integer.parseInt(req.getParameter("userId"));

        //keep data into javabeans
       commissionWork commissionWork = new commissionWork();

       commissionWork.setCommissionName(commissionName);
       commissionWork.setCommissionPrice(commissionPrice);
       commissionWork.setCommissionBackground(commissionBackground);
       commissionWork.setCommissionDesc(ccommissionDesc);
       
       commissionWork.setCommissionImage(commissionImage);
       commissionWork.setArtistId(userId);

        //pass the bean to DAO
        CommissionDAO CommissionDAO = new CommissionDAO();
        CommissionDAO.register(commissionWork);

        List<commissionWork> listcommissionWork = CommissionDAO.retrieveAllcommissionwWorkById(userId);

        HttpSession session = req.getSession();
        session.setAttribute("list", listcommissionWork);
        
        //save the bean as attribute and pass to view
        resp.sendRedirect("addcommission.jsp");
    }

    private void updatecommissionWork(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
        
        CommissionDAO commissionDAO = new CommissionDAO();
        
        String commissionName = req.getParameter("commissionName");
        Double commissionPrice = Double.parseDouble(req.getParameter("commissionPrice"));
        Double commissionBackground = Double.parseDouble(req.getParameter("commissionBackground"));
        String commissionDesc = req.getParameter("commissionDesc");
        Part commissionImage = req.getPart("commissionImage");
        int commissionId = Integer.parseInt(req.getParameter("commissionId"));
        int userId = Integer.parseInt(req.getParameter("userId"));
        
        if (commissionImage.getName().isEmpty()){
            commissionWork commissionWork = commissionDAO.retrievecommissionWorkById(userId);
            commissionImage = commissionWork.getCommissionImage();
        }
        commissionWork commissionWork = new commissionWork();

        commissionWork.setCommissionName(commissionName);
        commissionWork.setCommissionPrice(commissionPrice);
        commissionWork.setCommissionBackground(commissionBackground);
        commissionWork.setCommissionDesc(commissionDesc);
        commissionWork.setCommissionImage(commissionImage);
        commissionWork.setCommissionId(commissionId);
        commissionWork.setArtistId(userId);

        commissionDAO.updatecommissionWork(commissionWork);
        commissionDAO.retrieveAllcommissionwWorkById(userId);
 
        resp.sendRedirect("addcommission.jsp");
        
    }
    
    private void deletecommissionWork(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int commissionId = Integer.parseInt(request.getParameter("commissionId"));
        
        commissionWork commissionWork = new commissionWork();
        
        commissionWork.setCommissionId(commissionId);
        
        CommissionDAO commissionDAO = new CommissionDAO();
        
        commissionDAO.deletecommissionWork(commissionWork);
        
        response.sendRedirect("addcommission.jsp");
        
    }

}
