<%-- 
    Document   : NewHpBranchList
    Created on : 19 Mar, 2021, 10:34:53 AM
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
        <title> New HP Branch List </title>
       
    </head>
    <body>
       
        <%
           
            String pname = "";
            String msg = "";
            String  rejectid = "",acceptid="",hpid="";

            acceptid = request.getParameter("acceptid");
               rejectid= request.getParameter("rejectid");

            if (acceptid != null) {
                String upd = "update  tbl_hpbranch set hpbranch_vstatus='1' where hpbranch_id='" +acceptid+ "'";
               
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
                String upd = "update  tbl_hpbranch set hpbranch_vstatus='2' where hpbranch_id='" +rejectid+ "'";
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
        <h3>Henna Product Branch List</h3>
      <table border="3" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="10">New</th>
            </tr>   
           
            <tr>
                <td>SI.NO</td>
                <td>Name</td>
                <td>Contact</td>
                <td>Email</td>
                <td>Address</td>
                <td>Place Name</td>
                <td>Landmark1</td>
                <td>Landmark2</td>
                <td>Action</td>
               
               
               
               
            </tr>
            <%

                int i = 0;
                String sel = "select * from tbl_hpbranch o inner join tbl_place p on o.Place_id=p.Place_id where o.hpbranch_vstatus='0'";
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                
                <td><%=rs.getString("hpbranch_name")%></td>
                <td><%=rs.getString("hpbranch_contact")%></td>
                <td><%=rs.getString("hpbranch_email")%></td>
                 <td><%=rs.getString("hpbranch_address")%></td>
                 <td><%=rs.getString("Place_name")%></td>
                 <td><%=rs.getString("hpbranch_landmark1")%></td>
                 <td><%=rs.getString("hpbranch_landmark2")%></td>
               
               
             
               
               
                <td><a href="NewHpBranchList.jsp?acceptid=<%=rs.getString("hpbranch_id")%>">Accept</a> | <a href="NewHpBranchList.jsp?rejectid=<%=rs.getString("hpbranch_id")%>">Reject</a></td>
                
            </tr>
            <%
                }

            %>
        </table>
        <br>
        <br>
        <br>
                <h3>Henna Product Branch List</h3>
      <table border="3" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="10">Accepted</th>
            </tr>  
                 <tr>
                   <td>SI.NO</td>
                   <td>Name</td>
                   <td>Contact</td>
                   <td>Email</td>
                   <td>Address</td>
                   <td>Place Name</td>
                   <td>Landmark1</td>
                   <td>Landmark2</td>
                   <td>Action</td>
               
                  </tr>
                  <%

                 int i1 = 0;
                 String sel1 = "select * from tbl_hpbranch o inner join tbl_place p on o.Place_id=p.Place_id where o.hpbranch_vstatus='1'";
                 ResultSet rs1 = obj.selectCommand(sel1);
                 while (rs1.next()) {
                    i++;

                   %>
                  <tr>
                   <td><%=i%></td>
                   <td><%=rs1.getString("hpbranch_name")%></td>
                   <td><%=rs1.getString("hpbranch_contact")%></td>
                   <td><%=rs1.getString("hpbranch_email")%></td>
                   <td><%=rs1.getString("hpbranch_address")%></td>
                   <td><%=rs1.getString("Place_name")%></td>
                   <td><%=rs1.getString("hpbranch_landmark1")%></td>
                   <td><%=rs1.getString("hpbranch_landmark2")%></td>
               
                <td><a href="NewHpBranchList.jsp?rejectid=<%=rs1.getString("hpbranch_id")%>">Reject</a></td>
            </tr>
            <%
                }

             %>
             
       
        </table>
             <br>
             <br>
       
       <h3>Henna Product Branch List</h3>
      <table border="3" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="10">Rejected</th>
            </tr>  
              <tr>
               <td>SI.NO</td>
                <td>Name</td>
                <td>Contact</td>
                <td>Email</td>
                <td>Address</td>
                <td>Place Name</td>
                <td>Landmark1</td>
                <td>Landmark2</td>
                <td>Action</td>
               
               </tr>
            <%

                int i2 = 0;
                String sel2 = "select * from tbl_hpbranch o inner join tbl_place p on o.Place_id=p.Place_id where o.hpbranch_vstatus='2'";
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                    <td><%=i%></td>
                    <td><%=rs2.getString("hpbranch_name")%></td>
                    <td><%=rs2.getString("hpbranch_contact")%></td>
                    <td><%=rs2.getString("hpbranch_email")%></td>
                    <td><%=rs2.getString("hpbranch_address")%></td>
                    <td><%=rs2.getString("Place_name")%></td>
                    <td><%=rs2.getString("hpbranch_landmark1")%></td>
                    <td><%=rs2.getString("hpbranch_landmark2")%></td>
               
                <td><a href="NewHpBranchList.jsp?acceptid=<%=rs2.getString("hpbranch_id")%>">Accept</a></td>
               
            </tr>
            <%
                }

            %>
       </table>
    </body>
</div>
</html>

