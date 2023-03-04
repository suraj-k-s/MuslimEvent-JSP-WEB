<%-- 
    Document   : EventWorkersList
    Created on : 19 Mar, 2021, 10:26:57 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event workers List</title>
    </head>
    <body>
        <%
           
            String pname = "";
            String msg = "";
            String  rejectid = "",acceptid="",ewid="";

            acceptid = request.getParameter("acceptid");
               rejectid= request.getParameter("rejectid");

            if (acceptid != null) {
                String upd = "update  tbl_eventworkers set eventworker_pstatus='1' where eventworker_id='" +acceptid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                   

                } else {
                   
                    msg = "";
                    out.println(upd);
                }
            }
                if (rejectid != null) {
                String upd = "update  tbl_eventworkers set eventworker_pstatus='2' where eventworker_id='" +rejectid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";

                } else {
                    msg = "";
                    out.println(upd);
                }
            }

       
       
        %>
       
        
       <div id="tab" align="center">
        <h3>Event Workers List</h3>
      <table border="3" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="9">New</th>
            </tr>   
           
            <tr>
                <td>SI.NO</td>
                <td>Name</td>
                <td>Contact</td>
                <td>Email</td>
                <td>Address</td>
                <td>Place Name</td>
                <td>DOJ</td>
                <td>Action</td>
               
               
            </tr>
            <%

                int i = 0;
                String sel = "select * from tbl_eventworkers o inner join tbl_place p on o.Place_id=p.Place_id where o.eventworker_pstatus='0'";
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("eventworker_name")%></td>
                <td><%=rs.getString("eventworker_contact")%></td>
                <td><%=rs.getString("eventworker_email")%></td>
                 <td><%=rs.getString("eventworker_address")%></td>
                 <td><%=rs.getString("Place_name")%></td>
                <td><%=rs.getString("eventworker_doj")%></td>
               
             
               
               
                <td><a href="EventWorkersList.jsp?acceptid=<%=rs.getString("eventworker_id")%>">Accept</a>| <a href="EventWorkersList.jsp?rejectid=<%=rs.getString("eventworker_id")%>">Reject</a></td
               
            </tr>
            <%
                }

            %>
        </table>
        <br>
        <br>
        <br>
         <h3>Event Workers List</h3>
      <table border="3" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="9">Accepted</th>
            </tr>   
            <tr>
                 <td>SI.NO</td>
                <td>Name</td>
                <td>Contact</td>
                <td>Email</td>
                <td>Address</td>
                <td>Place Name</td>
                <td>DOJ</td>
                <td>Action</td>
               
            </tr>
            <%

                int i1 = 0;
                String sel1 = "select * from tbl_eventworkers o inner join tbl_place p on o.Place_id=p.Place_id where o.eventworker_pstatus='1'";
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next()) {
                    i++;

            %>
            <tr>
                 <td><%=i%></td>
                 <td><%=rs1.getString("eventworker_name")%></td>
                 <td><%=rs1.getString("eventworker_contact")%></td>
                 <td><%=rs1.getString("eventworker_email")%></td>
                 <td><%=rs1.getString("eventworker_address")%></td>
                 <td><%=rs1.getString("Place_name")%></td>
                 <td><%=rs1.getString("eventworker_doj")%></td>
               
                <td><a href="EventWorkersList.jsp?rejectid=<%=rs1.getString("eventworker_id")%>">Reject</a></td>
            </tr>
            <%
                }

             %>
             
       
        </table>
       
             <br>
             <br>
             <br>
       
     
        <h3>Event Workers List</h3>
      <table border="3" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="9">Rejected</th>
            </tr>   
            <tr>
                <td>SI.NO</td>
                <td>Name</td>
                <td>Contact</td>
                <td>Email</td>
                <td>Address</td>
                <td>Place Name</td>
                <td>DOJ</td>
                <td>Action</td>
               
            </tr>
            <%

                int i2 = 0;
                String sel2 = "select * from tbl_eventworkers o inner join tbl_place p on o.Place_id=p.Place_id where o.eventworker_pstatus='2'";
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
              
                 <td><%=rs2.getString("eventworker_name")%></td>
                 <td><%=rs2.getString("eventworker_contact")%></td>
                 <td><%=rs2.getString("eventworker_email")%></td>
                 <td><%=rs2.getString("eventworker_address")%></td>
                 <td><%=rs2.getString("Place_name")%></td>
                 <td><%=rs2.getString("eventworker_doj")%></td>
               
             
               
               
                <td><a href="EventWorkersList.jsp?acceptid=<%=rs2.getString("eventworker_id")%>">Accept</a></td>
               
            </tr>
            <%
                }

            %>
       </table>
    </body>
    </div>
</html>

