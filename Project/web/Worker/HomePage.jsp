<%-- 
    Document   : HomePage
    Created on : 23 Jan, 2021, 11:54:41 AM
    Author     : HP
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME PAGE</title>
    </head>
    <body>
    <% String name="";
      name=session.getAttribute("wname").toString();
      %>
       
      <h1>WELCOME <br> <%= name %> </h1>
      <br>
        <a href="MyProfile.jsp">My Profile</a>
        <br>
            <a href="EditProfile.jsp">Edit Profile</a>
            <br>
             <a href="ChangePassword.jsp">Change Password</a>
             <br>
             <a href="AddWorkersPackage.jsp">Add Worker Package</a>
             <br>
             <a href="AddCustomDress.jsp">Add Customized Dress</a>
               <br>
             <a href="WorkerAlbum.jsp">Add Work</a>
              <br>
             <a href="ViewCustomizedDressRequest.jsp">View Customized Dress Request</a>
              <br>
             <a href="ViewWorkerPackageOrders.jsp">View Package Orders</a>
               <br>
             <a href="ComplaintWorker.jsp">Complaints</a>
             <br>
             <a href="WorkerFeedback.jsp">Feedback</a>
    </body>
</html>
