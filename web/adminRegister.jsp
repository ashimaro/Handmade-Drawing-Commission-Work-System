<%-- 
    Document   : adminRegister
    Created on : May 7, 2022, 6:24:54 PM
    Author     : Ashi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Admin</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/userStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="box">
               <img class="avatar" src="img/avatar.png">
               <br>
               <center>  <h4> Register Account</h4> </center>
                <form action="AdminController" method="post">
                    <center> <span style="color:red">${error}</span></center>
                    <p>Email</p>
                    <input type="text"  name="adminEmail" required>
                    
                    <p>Password</p>
                    <input type="password"  name="adminPassword" required>
                    
                    <p>Name</p>
                    <input type="text"  name="adminName" required>
                    
                    <input type="submit" name="action" value="Register">
                
                    <a href="adminLogin.jsp">Create New Account</a>
                </form>