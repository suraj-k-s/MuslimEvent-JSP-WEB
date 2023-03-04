<%-- 
    Document   : ViewCommunityList
    Created on : 19 Mar, 2021, 1:45:36 PM
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
        <title>View Event Organization Packages</title>
    </head>
    <body>
         <%
               
             String eid="";  
              eid=request.getParameter("eid");
            String sel="select * from  tbl_packages where eventorg_id='"+eid+"'";
            //out.println(sel);
            ResultSet rs=obj.selectCommand(sel);
            if(rs.next()){
           
           
            %>
                 
                 <div id="tab">      
    <form>
            <table border="2" align="center">
               
                <tr>
                    <td>Details</td>
                   
               
                    <td>Rate</td>
                    
                    
                    <td>Name</td>
                   
               
                    <td>Remarks</td>
                   
                </tr>
                <%

                int i = 0;
                String sel2 = "select * from tbl_packages";
                ResultSet rs2= obj.selectCommand(sel);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
               <td><img src="../Assets/PackageDetails/<%=rs2.getString("packages_details")%>" width="120" height="120"></td>
                <td><%=rs2.getString("packages_rate")%></td>
                <td><%=rs2.getString("packages_name")%></td>
                <td><%=rs2.getString("packages_remark")%></td>
               
            </tr>
           
               
                <%
                    }
                %>
                <%
                    }
                    %>
             
            </table>
               
    </form>
    </body>
    </div>
</html>
