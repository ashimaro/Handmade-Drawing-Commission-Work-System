<%-- 
    Document   : adminDashboard
    Created on : Jan 4, 2022, 1:24:04 AM
    Author     : Ashi
--%>
<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="model.Admin"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  </head>
  <body style="background-color:powderblue;">
        <%
            Admin admin = (Admin) request.getSession().getAttribute("admin");
        %>
    </div> <!-- End header area -->
      <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                       
                    </div>
                </div>
                
               <div class="col-md-4">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                            
                    <li class="dropdown dropdown-small">
                            <li><a href="adminAccount.jsp?id=<%=admin.getAdminId()%>"><i class="fa fa-user"></i> My Account</a></li>
                            </li>
                            <li class="dropdown dropdown-small">
                                <li><a href='<%=request.getContextPath()%>/AdminController?action=signout'><i class="fa fa-sign-out"></i> Logout</a></li>
                               
                            </li>
                        </ul>
                    </div>
                </div>
                                
            </div>
        </div>
    </div>
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="dashboard.jsp"><img class="logo" src="img/HDCWLogo.png" style="width:80px;height:80px;"></a></h1>
                    </div>
                </div>
              
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    
    
    <!-- End mainmenu area -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Users list</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div >
         <div>
 <div class="p-10 grid grid-cols-10 sm:grid-cols-10 md:grid-cols-1 lg:grid-cols-3 xl:grid-cols-6 gap-5">

     </div>
<div class="max-w-7xl mx-auto my-2">
                      <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
                             
<table class="table align-middle mb-0 bg-white">
  <thead class="bg-light">
    <tr>
      
      <th>Name</th>
      <th>Email</th>
      <th>Phone Number</th>
       <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <%
        UserDAO userDAO = new UserDAO();
        List<User> listuser = userDAO.retrieveAll();
        for (User user : listuser)
        {
    %>
    <tr>
        
      <td>
          <p class="fw-bold mb-1" ><%=user.getName()%></p>
          
      </td>
      <td>
        <p class="fw-normal mb-1"><%=user.getEmail()%></p>
      </td>
      <td>
        <p class="fw-normal mb-1"><%=user.getPhoneNo()%></p>
      </td>
     
      <td>
          
        <form action ="<%=request.getContextPath()%>/UserController">
        <button type="submit" name="action" value="deleteUser" class="btn btn-link btn-sm btn-rounded" onclick="return confirm('Are you sure you want to Delete this?');">
          Delete
        </button>
        <input name="userId" type="hidden" value="<%=user.getUserId()%>">
         </form>
      </td>
    </tr>
<% }%>
  </tbody>
</table>
</div>
</div>
        </div>
    </div> <!-- End main content area -->
    
    
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
	<script type="text/javascript" src="js/script.slider.js"></script>
      
  </body>
</html>