<%-- 
    Document   : addDrawiing
    Created on : Jan 19, 2022, 11:56:28 PM
    Author     : User
--%>


<%@page import="model.commissionWork"%>
<%@page import="dao.CommissionDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Drawing</title>
    
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <%
            int commissionId = Integer.parseInt(request.getParameter("id"));
            CommissionDAO commissionDAO = new CommissionDAO();
            commissionWork commissionWork = commissionDAO.retrievecommissionWorkById(commissionId);
            User user = (User) request.getSession().getAttribute("user");
    %>
  </head>
  <body>
    
       
    <form action="CommissionController" method="POST" enctype="multipart/form-data">
                          
  <div class="form-row">
      <div>
          <input type ="hidden" name='commissisonId' value="<%=commissionId%>">
      </div>
    <div class="form-group col-md-6">
      <label>Commission Name</label>
      <input type="text" class="form-control" name="commissionName" value="<%=commissionWork.getCommissionName()%>">
    </div>
      
  <div class="form-group col-md-6">
     <label>Price</label>
      <input type="text" class="form-control" name="commissionPrice" value="<%=commissionWork.getCommissionPrice()%>">
    </div>
  </div>
    
 <div class="form-row">
    <div class="form-group col-md-6">
      <label>Background</label>
      <input type="text" class="form-control" name="commissionBackground" value="<%=commissionWork.getCommissionBackground()%>">
    </div>
    
 </div>
<div class="form-row">    
    <div class="form-group col-md-6">
     <label>Description</label>
      <input type="text" class="form-control" name="commissionDesc" value="<%=commissionWork.getCommissionDesc()%>">
    </div>
        
     <div class="form-group col-md-6">
     <label >Add your Drawing</label>
     <input type="file" name="commissionImage">
     </div>
    
      <div class="form-group col-md-6">
     <input type="hidden" name="userId" value="<%=user.getUserId()%>"> 
     </div>
    
     <button type="submit" name='action' value='update'  class="btn btn-primary">Save Changes<button>
  <a href="addcommission.jsp" class="btn btn-primary">Cancel</a>
   
        
</div>   
</form>
</html>
