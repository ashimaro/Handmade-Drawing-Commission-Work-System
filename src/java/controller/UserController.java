package controller;

import dao.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import model.User;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        String action = request.getParameter("action");
        
        if (action != null){
            switch(action){
                case "register":
                    saveUser(request, response);
                    break;
                
                case "Login":
                    retrieveUser(request, response);
                    
                    break;
                    
                case "update":
                    updateUser(request, response);
                    break;
                    
                 case "updateadmin":
                    updateAdminUser(request, response);
                    break;    
                
                case "deleteUser":
                    deleteUser(request, response);
                    break;
                    
                     case "updateUserType":
                    updateUserType(request, response);
                    break;
                    
                case "signout":
                    signOut(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "dashboard.jsp");
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
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void saveUser(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        //get all data from register page
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String postcode = req.getParameter("postcode");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String phoneNo = req.getParameter("phoneNo");
        String usertype = req.getParameter("usertype");
        String lastlogin = req.getParameter("logindatetime");
        
        //keep data into javabeans
        User newUser = new User();
        
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setAddress(address);
        newUser.setPostcode(postcode);
        newUser.setCity(city);
        newUser.setState(state);
        newUser.setPhoneNo(phoneNo);
        newUser.setUserType(usertype);
        newUser.setLastLogin(lastlogin);
        
        //pass the bean to DAO
        UserDAO userdao = new UserDAO();
        userdao.save(newUser);
        
        //save the bean as attribute and pass to view
        req.setAttribute("user", newUser);
        resp.sendRedirect("index.jsp");
    }
    
    private void retrieveUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException, ClassNotFoundException{
        
        
        if(req.getParameter("action") != null){
            
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String loginusertype ;
            
            UserDAO userDAO = new UserDAO();
            
            try {
                User user = userDAO.authentication(email, password);
                
                if(user != null){
                    //usertype = req.getParameter("usertype");
                    HttpSession session = req.getSession();
                    //Example
                    session.setAttribute("userid", user.getUserId());
                    session.setAttribute("user", user);
                    session.setAttribute("loginusertype", user.getUserType());
                    
                    
                    loginusertype = user.getUserType();
                    //req.setAttribute("error", "1" + user.getUserType());
                    //RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                    //rd.forward(req,resp);
                    if (loginusertype.equals("ADMIN"))
                    {
                       
                        //updatelogin(request, response);
                        resp.sendRedirect("dashboardadmin.jsp");
                    }
                    else
                    {
                        resp.sendRedirect("dashboard.jsp");
                    }
                   
                    
                   //resp.sendRedirect("dashboard.jsp");
                    
                } else {
                    req.setAttribute("error", "Invalid email or password!");
                    RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                    rd.forward(req,resp);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }
        
    }
    
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String postcode = request.getParameter("postcode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String phoneNo = request.getParameter("phoneNo");
        int userId = Integer.parseInt(request.getParameter("userId"));
        String tmputype = request.getParameter("pubusertype");
        
        //HttpSession session = request.getSession();
        //tmputype = session.getAttribute("loginusertype") ;
        
        User user = new User();
        
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAddress(address);
        user.setPostcode(postcode);
        user.setCity(city);
        user.setState(state);
        user.setPhoneNo(phoneNo);
        user.setUserId(userId);
        user.setUserType(tmputype);
        
        //tmputype = user.getUserType();
        //user.setUserType(tmputype);
        
        UserDAO userDAO = new UserDAO();
        
        userDAO.update(user);
        
       response.sendRedirect("dashboard.jsp");
       
    }
    
    
    
    private void updateAdminUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String postcode = request.getParameter("postcode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String phoneNo = request.getParameter("phoneNo");
        int userId = Integer.parseInt(request.getParameter("userId"));
        //String tmputype = request.getParameter("pubusertype");
        
        //HttpSession session = request.getSession();
        //tmputype = session.getAttribute("loginusertype") ;
        
        User user = new User();
        
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAddress(address);
        user.setPostcode(postcode);
        user.setCity(city);
        user.setState(state);
        user.setPhoneNo(phoneNo);
        user.setUserId(userId);
       
        UserDAO userDAO = new UserDAO();
        
        userDAO.update(user);
        
       response.sendRedirect("dashboardadmin.jsp");
      
    }
    
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        User user1 = new User();
        
        user1.setUserId(userId);
        
        UserDAO userDAO = new UserDAO();
        
        userDAO.delete(user1);

        //HttpSession session = request.getSession();
        //session.invalidate();
        response.sendRedirect("uaccadmin.jsp");
        
    }
    /*
     private void updatelogin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        User user1 = new User();
        
        user1.setUserId(userId);
        
        UserDAO userDAO = new UserDAO();
        
        userDAO.updateLoginDetails(user1);

        //HttpSession session = request.getSession();
        //session.invalidate();
        response.sendRedirect("dashboardadmin.jsp");
        
    }
*/
  private void updateUserType(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        String userType = request.getParameter("userType");
        int userId = Integer.parseInt(request.getParameter("userId"));
 User user = new User();
        
 user.setUserType(userType);
 user.setUserId(userId);

 
 UserDAO userDAO = new UserDAO();
 
 userDAO.updateUserType(user);

        response.sendRedirect("uaccadmin.jsp");

    }
    private void signOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        request.getSession().removeAttribute("user");
        
        response.sendRedirect("index.jsp");
    }
}