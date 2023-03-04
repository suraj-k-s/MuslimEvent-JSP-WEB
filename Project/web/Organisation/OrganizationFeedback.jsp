<%-- 
    Document   : OrganizationFeedback
    Created on : 19 Mar, 2021, 10:59:25 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organization Feedback</title> <%@include file="tem.jsp" %>
    </head>
    <body>
         <form>
             <div id="tab">
            <%
               
             String wpid="";  
              wpid=request.getParameter("packagesid").toString();
            String sel="select * from  tbl_organisationpackagefeedback ";
            ResultSet rs=obj.selectCommand(sel);
            if(rs.next()){
           
           
            %>
           
            <table border="2" align="center">
                <tr>
                <td>SI.NO</td>
                <td>Content</td>
                <td>Date</td>
                <td>Name</td>
            </tr>
            <%

                int i = 0;
                String sel1 = "select * from tbl_organisationpackagefeedback f inner join tbl_user u on f.user_id=u.user_id where packages_id='"+wpid+"'";
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("opfeedback_content")%></td>
                <td><%=rs1.getString("opfeedback_date")%></td>
                <td><%=rs1.getString("user_name")%></td>
               
            </tr>
            <%
                }

            %>
        </table>
               
               
     
               <%
               
            }
               
               %>
             </div>
         </form>
         
    </body>
</html>
