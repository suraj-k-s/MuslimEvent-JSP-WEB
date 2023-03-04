<%-- 
    Document   : WorkerFeedback
    Created on : 19 Mar, 2021, 3:44:39 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Workers Feedback</title>
    </head>
    <body>
         <form>
          
           
             <table border="2" align="center"cellpadding="10" style="border-collapse:collapse;">
                <tr>
                <td>SI.NO</td>
                <td>Feedback</td>
                <td>Date</td>
                <td>Feedback By</td>
            </tr>
            <%

                int i = 0;
                String sel1 = "select * from tbl_workerspackagefeedback wfeed inner join tbl_workerspackage wp on wfeed.wsp_id=wp.wsp_id inner join tbl_user usr on wfeed.user_id=usr.user_id  where wp.eventworker_id='"+session.getAttribute("wid")+"'";
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("wpfeedback_content")%></td>
                <td><%=rs1.getString("wpfeedback_date")%></td>
                <td><%=rs1.getString("user_name")%></td>
               
            </tr>
            <%
                }

            %>
        </table>
               
          
           
         </form>
    </body>
</html>
