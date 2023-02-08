<%-- 
    Document   : editCheckout
    Created on : Apr 4, 2022, 11:34:24 PM
    Author     : Ashi
--%>
<%@page import="model.DrawingDetails"%>
<%@page import="model.User"%>
<%@page import="model.commissionWork"%>
<%@page import="java.util.List"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="dao.DrawingDetailsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Checkout</title>
    
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
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'> 
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>

  </head>
  <body style="background-color:powderblue;">
      <%
        User user= (User) request.getSession().getAttribute("user");
        
        int drawingDetailsId = Integer.parseInt(request.getParameter("drawingDetailsId"));
        DrawingDetailsDAO drawingDetailsDAO = new DrawingDetailsDAO();
        DrawingDetails DD = drawingDetailsDAO.retrieveDrawingDetailsById(drawingDetailsId);
      %>
 <!-- End header area -->
      <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                       
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
    
   
     
            <div class="sm:flex sm:space-x-2 justify-center my-auto rounded-3xl w-full flex flex-col items-center justify-center px-60">
                <div class="flex items-center flex-no-shrink text-black mb-14">
                   
                </div>
                <div class="p-10">
  <%    int commissionId = DD.getCommissionId();
        
        CommissionDAO commissionDAO = new CommissionDAO();
        commissionWork  commissionWork  = new commissionWork();
        commissionWork =commissionDAO.retrievecommissionWorkById(commissionId);
       %> 
                    <!--Card 1-->
                    <div class="max-w-7xl mx-auto">
                        
                        <div class="border-r border-b border-l border-gray-400 lg:border-l-0 lg:border-t lg:border-gray-400 bg-white rounded-3xl p-4 flex justify-between leading-normal">
                           
                             <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                            <h6><a href="checkout.jsp" style="text-decoration: none">Cancel</a></h6>
                        </div>
                            
                            <img class="w-auto h-56 mr-4" class="lazy" src="image.jsp?id=<%=commissionWork.getCommissionId()%>" alt="Image Broken">
                            <div class="">
                                <div class="text-gray-900 font-bold text-xl mb-2"> 
                                    <%=commissionWork.getCommissionName()%> 
                                </div>
                                <br>
                                <p class="text-gray-900 font-bold text-xl mb-2">RM
                                    <%=commissionWork.getCommissionPrice() %>0
                                </p>
                                <br>
                                
                                <p class="text-gray-900 font-bold text-xl mb-2">Do you want to add background?
      <select name="background" class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" 
                                                           >
        <option value="0" selected >No thanks!</option>
        <option value="<%=commissionWork.getCommissionBackground()%>">Yes (RM <%=commissionWork.getCommissionBackground()%>0)</option>
       
      </select>
        </p>
        <br>
                    <p class="text-gray-900 font-bold text-xl mb-2">Description :<%=commissionWork.getCommissionDesc()%> </p>          
                             
                                <form class="mt-8 space-y-6" action="DrawingControlller" method="POST">   
                                   
                                        <div class="flex items-center">
                                             <input type="hidden" name="drawingDetailsId" value="<%=drawingDetailsId%>">
                                             
                                            <div>
                                                <div class="input-group plus-minus-input">    
                                                    <p class="text-gray-900 font-bold text-xl mb-2">Number of figure :
                                                    <input class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" 
                                                           type="number" min ="1" max="5" name="figureNo" id="quantity" value="<%=DD.getFigureNo()%>"> 
                                                </div>
                                            </div>     
                                        </div>
                                               
                                            <input type="hidden" name="userId"  value="<%=user.getUserId()%>">
                                        
                                        
                                            <input type="hidden" name="commissionId" value="<%=commissionWork.getCommissionId()%>">
                                       
                                        <br>
                                        <div>
                                            <button type="submit" name="action" value="update" class="mr-3 group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-900 hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                             Update Order
                                            </button> 
                                          
                                        </div>
                                        
                                </form>

                                <br>
                   
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
      
   
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