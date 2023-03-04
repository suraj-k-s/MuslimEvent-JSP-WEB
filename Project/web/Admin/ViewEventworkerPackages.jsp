<%-- 
    Document   : ViewEventworkerPackages
    Created on : 19 Mar, 2021, 1:53:01 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View event Worker Package</title>
    </head>
    <body>
         <%
               
             String wspid="";  
              wspid=request.getParameter("wspid").toString();
            String sel="select * from  tbl_workerspackage where eventworker_id='"+wspid+"'";
            ResultSet rs=obj.selectCommand(sel);
            if(rs.next()){
           
           
            %>
                 
               <div id="tab">        
                   
            <table border="2" align="center">
               
                <tr>
                    <td>Details</td>
                   
               
                    <td>Rate</td>
                   
               
                    <td>Remarks</td>
                    
                    
                    <td>Image</td>
                   
                   
                </tr>
                <%

                int i = 0;
                String sel2 = "select * from tbl_workerspackage";
                ResultSet rs2= obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                <td><a href="../Assets/WorkersDetails/<%=rs2.getString("wsp_details")%>" download>Download</a></td>
                <td><%=rs2.getString("wsp_rate")%></td>
                <td><%=rs2.getString("wsp_remarks")%></td>
                <td><img src="../Assets/WorkersImages/<%=rs2.getString("wsp_workimage")%>" width="120" height="120"></td>
               
            </tr>
           
               
                <%
                    }
                %>
                <%
                    }
                    %>
             
            </table>
               
    </body>
    </div>
</html>
