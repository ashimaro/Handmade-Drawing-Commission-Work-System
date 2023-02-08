<%-- 
    Document   : account
    Created on : Jan 5, 2022, 6:38:18 AM
    Author     : Ashi
--%>

<%@page import="model.Admin"%>
<%@page import ="dao.AdminDAO "%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Account</title>
    
 <link href="css/account.css " rel="stylesheet" media="all">   

<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'> 
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
  </head>
 <% Admin admin = (Admin) request.getSession().getAttribute("admin");%>
  <body style="background-color:powderblue;">
<%
    
         int adminId = Integer.parseInt(request.getParameter("id"));
         AdminDAO adminDAO = new AdminDAO();
         admin = adminDAO.retrieveAdminByAdminId(adminId);
            
    %>
   <!-- End header area -->
   
    <div class="container rounded bg-white mt-5">
        <div class="row">
            <div class="col-md-4 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-man-icon-profile-member-user-perconal-symbol-vector-on-white-isolated-background-.jpg" width="90"><span class="font-weight-bold">Hi <%=admin.getAdminName()%></span></div>
            </div> 
            <div class="col-md-8">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                            <h6><a href="adminDashboard.jsp" style="text-decoration: none">Back to dashboard </a></h6>
                        </div>
                      
                    </div>
                    <form action="AdminController" method="POST">
                    <div class="row mt-2">
                         
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Admin Email" name="adminEmail" value="<%=admin.getAdminEmail() %>"></div>
                       
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Admin Password" name="adminPassword" value="<%=admin.getAdminPassword() %>"></div>
                        
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Admin Name" name="adminName" value="<%=admin.getAdminName()%>"></div>
                       
                    </div>
                          <input type="hidden" class="form-control" name="adminId" value="<%=admin.getAdminId() %>">                  
                     <div class="mt-5 text-right"><div id="success"><button class="btn btn-primary profile-button" type="submit" name="action" value='update' onclick=success()  >Save Changes</button></div></div>
                    </form>
                </div>
            </div>
                     
        </div>
    </div>
                     
                     
<script>
  function success() {
    alert("Admin account is updated successfully!");
  }
</script>


  </body>
</html>