
<%@page import="dao.FeedbackDAO"%>

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
        <title>HDCW - Users Management [ADMIN]</title>

        <!-- Google Fonts -->
        <link href='pluginscss/titilium.css' rel='stylesheet' type='text/css'>
        <link href='pluginscss/roboto.css' rel='stylesheet' type='text/css'>
        <link href='pluginscss/raleway.css' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <link rel="stylesheet" href="pluginscss/font-awesome.min.css">
        <link rel="stylesheet" href="pluginscss/tailwind.min.css" >
        <link rel="stylesheet" href="pluginscss/font-awesome.min.css">

        <%@page import = "java.text.NumberFormat" %>

    </head>
    <body style="background-color:powderblue;">
        <%
            User user = (User) request.getSession().getAttribute("user");
            User userlist = (User) request.getSession().getAttribute("user");
            //Admin admin = (Admin) request.getSession().getAttribute("admin");
        %>
        <%
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(2);
        %>
    </div> <!-- End header area -->

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
                        <li  class="active"><a href="uaccadmin.jsp">User Managements</a></li>
                        <li ><a href="adminreport.jsp?artistId=0">Report</a></li>
                        <li><a href="accadmin.jsp?userId=<%=user.getUserId()%>">My Account</a></li>
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
                        <h2>Manage User Accounts</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div >
        <div>
            <div class="p-12 grid grid-cols-12 sm:grid-cols-12 md:grid-cols-12 lg:grid-cols-1 xl:grid-cols-1 gap-1">


                <div style = "background-color: #FFFFFF" class="bg-gray-100 rounded-3xl overflow-hidden shadow-lg ">

                    <div class="row">

                        <div class="col-md-12">
                            <div class="p-3 py-6">
                                <table class="table align-middle mb-0 bg-white">
                                    <thead class="bg-light">
                                        <tr>
                                            <th>User ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone Number</th>
                                            <th>Last Login</th>
                                            <th>User Type</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            UserDAO userDAO = new UserDAO();
                                            List<User> listuser = userDAO.retrieveAll();
                                            for (User userdata : listuser) {
                                        %>
                                        <tr>
                                            <td>
                                                <p class="fw-bold mb-1" ><%=userdata.getUserId()%></p>

                                            </td>
                                            <td>
                                                <p class="fw-bold mb-1" ><%=userdata.getName()%></p>

                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1"><%=userdata.getEmail()%></p>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1"><%=userdata.getPhoneNo()%></p>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1"><%=userdata.getlastlogin()%></p>
                                            </td>

                                               <td>
                                    <button type = "button" id = "myBtn" class="btn btn-primary" data-bs-target="#myModal<%=userdata.getUserId() %>"><%=userdata.getUserType() %></button>
                                    <!-- The Modal -->
                                    
                                    <div id="myModal<%=userdata.getUserId()%>"  role="dialog">
                                        <!-- Modal content -->
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <label align="center">Update User Type</label>
                                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div><!-- comment -->
                                                <form class="mt-8 space-y-6" action="UserController" method="POST" >
                                                    <div class="modal-body">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">

                                                            </div>
                                                            <div class="form-group">
                                                                <label> User Type</label>
                                                                <select class="form-control"  id = "userType" name = "userType">
                                                                    <option id = "e_status" name = "userType" disabled value="" selected></option>  
                                                                    <option id = "e_status" name = "userType" value="USER">USER</option>
                                                                    <option id = "e_status" name = "userType" value="ADMIN">ADMIN</option>
                                                                  
                                                                </select>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                    <div style="clear:both;"></div>
                                                    <div class="modal-footer">
                                                        <input type="hidden" name="userId" value="<%=userdata.getUserId() %>">
                                                        <button type="submit" class="btn btn-primary" name = "action" value="updateUserType" >UPDATE</button>
                                                    </div>
                                                </form> 

                                            </div>
                                        </div>
                                    </div>
                                </td>

                                            <td>

                                                <form action ="<%=request.getContextPath()%>/UserController">
                                                    <button type="submit" name="action" value="deleteUser" class="btn btn-link btn-sm btn-rounded" onclick="return confirm('Are you sure you want to Delete this?');">
                                                        Delete
                                                    </button>
                                                    <input name="userId" type="hidden" value="<%=userdata.getUserId()%>">
                                                </form>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>     

                </div>

            </div>


        </div>
    </div> <!-- End main content area -->



    <!-- Latest jQuery form server -->
    <script src="pluginsjs/jquery.min.js"></script>

    <!-- Bootstrap JS form CDN -->
    <script src="pluginsjs/bootstrap.min.js"></script>

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
  <script>
// Get the modal

        var rowId = document.getElementById("rowid");

        var modal = document.getElementById("myModal37");
        //alert("Hello! I am an alert box!" + myModal);
        //var modal = modal1.concat(rowId);


// Get the button that opens the modal
        var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        };

// When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        };

// When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
            ;
        };
    </script>

</body>
</html>