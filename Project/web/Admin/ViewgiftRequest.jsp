<%-- 
    Document   : ViewgiftRequest
    Created on : 18 Mar, 2021, 1:10:06 PM
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
        <title>View Gift Request</title>
    </head>
    <body>
        <%
           
            String giftfeature = "";
            String msg = "";
            String  rejectid = "",acceptid="",eorgid="";

            acceptid = request.getParameter("acceptid");
               rejectid= request.getParameter("rejectid");

            if (acceptid != null) {
                String upd = "update  tbl_giftrequest set gr_vstatus='1',gr_cstatus='1' where gr_id='" +acceptid+ "'";
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
                String upd = "update  tbl_giftrequest set gr_vstatus='2',gr_cstatus='2' where gr_id='" +rejectid+ "'";
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
       
        
      <div id="tab">
       <h3 align="center">Gift Request</h3>
       <table border="3" align="center" cellpadding="5">
           <tr>
                <th align="center" colspan="7">New Request</th>
            </tr>   
            <tr>
                <td>SI.NO</td>
                <td>Gift Type</td>
                <td>Feature</td>
                <td>Items</td>
                <td>Action</td>
               
               
            </tr>
            <%

                int i = 0;
                String sel = "select * from tbl_giftrequest g inner join tbl_gifttype p on g.gifttype_id=p.gifttype_id where g.gr_vstatus='0' and gr_cstatus='0'";
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("gifttype_name")%></td>
                
                <td><%=rs.getString("gr_feature")%></td>
                
                <td><%=rs.getString("gr_items")%></td>
               
                <td><a href="ViewgiftRequest.jsp?acceptid=<%=rs.getString("gr_id")%>">Accept</a> | <a href="ViewgiftRequest.jsp?rejectid=<%=rs.getString("gr_id")%>">Reject</a></td>
                
            </tr>
            <%
                }

            %>
            
        </table>
            <hr>
            <br>
            <br>
      
     
           <h3 align="center">Gift Request</h3>
       <table border="3" align="center" cellpadding="5">
           <tr>
                <th align="center" colspan="7">Accepted</th>
            </tr>   
            <tr>
                <td>SI.NO</td>
                <td>Gift Type</td>
                <td>Feature</td>
                <td>Items</td>
                <td>Action</td>
            </tr>
            <%

                int i1 = 0;
                String sel1 = "select * from tbl_giftrequest g inner join tbl_gifttype p on g.gifttype_id=p.gifttype_id where g.gr_vstatus='1' and gr_cstatus='1'";
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs1.getString("gifttype_name")%></td>
                
                <td><%=rs1.getString("gr_feature")%></td>
                
                <td><%=rs1.getString("gr_items")%></td>
             
                <td><a href="ViewgiftRequest.jsp?rejectid=<%=rs1.getString("gr_id")%>">Reject</a></td>
            </tr>
            <%
                }

            %>
       </table>
       <hr>
       <br>
       <br>
       <h3 align="center">Gift Request</h3>
       <table border="3" align="center" cellpadding="5">
           <tr>
                <th align="center" colspan="7">Rejected</th>
            </tr>   
             <tr>
                <td>SI.NO</td>
                <td>Gift Type</td>
                <td>Feature</td>
                <td>Items</td>
                <td>Action</td>
               </tr>
               
            <%

                int i2 = 0;
                String sel2 = "select * from tbl_giftrequest g inner join tbl_gifttype p on g.gifttype_id=p.gifttype_id where g.gr_vstatus='2' and gr_cstatus='2'";
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs2.getString("gifttype_name")%></td>
                
                <td><%=rs2.getString("gr_feature")%></td>
                
                <td><%=rs2.getString("gr_items")%></td>
             
                <td><a href="ViewgiftRequest.jsp?acceptid=<%=rs2.getString("gr_id")%>">Accept</a></td>
            </tr>
            <%
                }

            %>
       </table>            
    </body>
    </div>
</html>