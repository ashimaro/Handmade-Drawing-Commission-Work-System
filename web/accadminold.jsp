<%-- 
    Document   : account
    Created on : Jan 5, 2022, 6:38:18 AM
    Author     : Ashi
--%>

<%@page import="model.User"%>
<%@page import ="dao.UserDAO "%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HDCW - My Account [ADMIN]</title>
    
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
 <%
            User user = (User) request.getSession().getAttribute("user");
        %>
  <body style="background-color:powderblue;">
<%
 
      int userId = Integer.parseInt(request.getParameter("userId"));
      UserDAO userDAO = new UserDAO();
      user = userDAO.retrieveUserByUserId(userId);
            
 %>
   <!-- End header area -->
   
   <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="logo">
                        <h1></h1>
                        <center><img src="img/HDCWLogo.png" class="centerImage" alt="Logo" height="80" width="80" href="dashboard.jsp"></center>
                        <center><h1>Handmade Drawing Commission Work</h1></center>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- End site branding area -->

    <div class="mainmenu-area">
         <div class="container">
            <div class="row">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="dashboardadmin.jsp">Dashboard</a></li>
                        <li><a href="uaccadmin.jsp">User Managements</a></li>
                        <li><a href="ordhistoryadmin.jsp">Orders History</a></li>
                        <li class="active"><a href="accadmin.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
                        <li><a href="<%=request.getContextPath()%>/UserController?action=signout">Logout</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 

    <!-- End mainmenu area -->
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>My Account !</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div >
        <div>
    <div class="container rounded bg-white mt-5">
        <div class="row">
            <div class="col-md-4 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-man-icon-profile-member-user-perconal-symbol-vector-on-white-isolated-background-.jpg" width="90">
                    <span class="font-weight-bold">Hi <%=user.getName()%></span></div>
            </div> 
            <div class="col-md-8">
                <div class="p-3 py-5">
                    <form action="UserController" method="POST">
                    <div class="row mt-2">
                         
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Name" name="name" value="<%=user.getName()%>"></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Email" name="email" value="<%=user.getEmail()%>"></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Password" name="password" value="<%=user.getPassword() %>"></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Address" name="address" value="<%=user.getAddress()%>"></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Postcode" name="postcode" value="<%=user.getPostcode()%>"></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="City" name="city" value="<%=user.getCity()%>"></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="State" name="state" value="<%=user.getState()%>"></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Phone Number" name="phoneNo" value="<%=user.getPhoneNo()%>" ></div>
                    </div>
                        <input type="hidden"  class="form-control" name="userId" value="<%=user.getUserId()%>">
                       
                     <div class="mt-5 text-right"><div id="success"><button class="btn btn-primary profile-button" type="submit" name="action" value='updateadmin' onclick=success()  >Save Changes</button></div></div>
                    </form>
                </div>
            </div>
                     
        </div>
    </div>
        </div>
    </div>
                     
<script>
  function success() {
    alert("Your account is updated successfully!");
  }
</script>


  </body>
</html>