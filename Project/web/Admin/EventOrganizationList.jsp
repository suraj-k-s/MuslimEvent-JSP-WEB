<%-- 
    Document   : EventOrganizationList
    Created on : 18 Mar, 2021, 2:50:05 PM
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
        <title>Event community List</title>
    </head>
    <body>
        <%
           
            String pname = "";
            String msg = "";
            String  rejectid = "",acceptid="",eorgid="";

            acceptid = request.getParameter("acceptid");
               rejectid= request.getParameter("rejectid");

            if (acceptid != null) {
                String upd = "update  tbl_eventorg set eventorg_pstatus='1' where eventorg_id='" +acceptid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                    response.sendRedirect("EventOrganizationList.jsp");
                } else {
                   
                    msg = "";
                    out.println(upd);
                }
            }
                if (rejectid != null) {
                String upd = "update  tbl_eventorg set eventorg_pstatus='2' where eventorg_id='" +rejectid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                    response.sendRedirect("EventOrganizationList.jsp");

                } else {
                    msg = "";
                    out.println(upd);
                }
            }

       
       
        %>
        
       <div id="tab" align="center">
        <h3>Event Organization List</h3>
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
                <td>Licno</td>
                <td>Action</td>
               
            </tr>
            <%

                int i = 0;
                String sel = "select * from tbl_eventorg o inner join tbl_place p on o.Place_id=p.Place_id where o.eventorg_pstatus='0'";
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                 <td><%=i%></td>
                 <td><%=rs.getString("eventorg_name")%></td>
                 <td><%=rs.getString("eventorg_contact")%></td>
                 <td><%=rs.getString("eventorg_email")%></td>
                 <td><%=rs.getString("eventorg_address")%></td>
                 <td><%=rs.getString("Place_name")%></td>
                 <td><%=rs.getString("eventorg_doj")%></td>
                 <td><%=rs.getString("eventorg_licno")%></td>
             
               
               
                <td><a href="EventOrganizationList.jsp?acceptid=<%=rs.getString("eventorg_id")%>">Accept</a> | <a href="EventOrganizationList.jsp?rejectid=<%=rs.getString("eventorg_id")%>">Reject</a></td>
             
            </tr>
            <%
                }

            %>
        </table>
        <br>
        <br>
        <br>
        <h3>Event Organization List</h3>
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
                <td>Licno</td>
                <td>Action</td>
                
               
            </tr>
            <%

                int i1 = 0;
                String sel1 = "select * from tbl_eventorg o inner join tbl_place p on o.Place_id=p.Place_id where o.eventorg_pstatus='1'";
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next()) {
                    i++;

            %>
            <tr>
                  <td><%=i%></td>
                  <td><%=rs1.getString("eventorg_name")%></td>
                  <td><%=rs1.getString("eventorg_contact")%></td>
                  <td><%=rs1.getString("eventorg_email")%></td>
                  <td><%=rs1.getString("eventorg_address")%></td>
                  <td><%=rs1.getString("Place_name")%></td>
                  <td><%=rs1.getString("eventorg_doj")%></td>
                  <td><%=rs1.getString("eventorg_licno")%></td>
             
               
                <td><a href="EventOrganizationList.jsp?rejectid=<%=rs1.getString("eventorg_id")%>">Reject</a></td>
            </tr>
            <%
                }

             %>
             
       
        </table>
       
       
             <br>
             <br>
             <br>
     
        <h3>Event Organization List</h3>
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
                <td>Licno</td>
                <td>Action</td>
                
               
            </tr>
            <%

                int i2 = 0;
                String sel2 = "select * from tbl_eventorg o inner join tbl_place p on o.Place_id=p.Place_id where o.eventorg_pstatus='2'";
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs2.getString("eventorg_name")%></td>
                <td><%=rs2.getString("eventorg_contact")%></td>
                <td><%=rs2.getString("eventorg_email")%></td>
                 <td><%=rs2.getString("eventorg_address")%></td>
                 <td><%=rs2.getString("Place_name")%></td>
                <td><%=rs2.getString("eventorg_doj")%></td>
                <td><%=rs2.getString("eventorg_licno")%></td>
             
               
               
                <td><a href="EventOrganizationList.jsp?acceptid=<%=rs2.getString("eventorg_id")%>">Accept</a></td>
               
            </tr>
            <%
                }

            %>
       </table>
    </body>
</div>
</html>