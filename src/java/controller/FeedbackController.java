
package controller;

import dao.FeedbackDAO;
import model.Feedback;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ashwini
 */
public class FeedbackController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {
        
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                 case "addFeedback":
                    addFeedback(request, response);
                    break;
               
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            processRequest(request, response);
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CommissionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          try {
            processRequest(request, response);
        } catch (IllegalStateException | SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CommissionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
  private void addFeedback(HttpServletRequest req, HttpServletResponse resp) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        String newfeedback = req.getParameter("newfeedback");
        int userIdfeedback = Integer.parseInt(req.getParameter("userIdfeedback"));
        int commissionIdfeedback = Integer.parseInt(req.getParameter("commissionIdfeedback"));
        int ratingval = Integer.parseInt(req.getParameter("myrate"));
        //String ratingval= req.getParameter("starrateval");

        Feedback newFeedback = new Feedback();
        
        newFeedback.setFeedback(newfeedback);
        newFeedback.setCommissionId(commissionIdfeedback);
        newFeedback.setUserId(userIdfeedback);
        newFeedback.setFeedbackStar(ratingval);
        
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        
        feedbackDAO.addFeedback(newFeedback);

        List<Feedback> listFeedback = feedbackDAO.retrieveAllFeedbackByUserId(userIdfeedback);

        HttpSession session = req.getSession();
        session.setAttribute("list", listFeedback);

        resp.sendRedirect("dashboard.jsp");
    }
}