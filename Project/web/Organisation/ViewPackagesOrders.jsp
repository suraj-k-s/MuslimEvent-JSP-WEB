<%-- 
    Document   : ViewPackagesOrders
    Created on : 30 Mar, 2021, 12:36:17 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Package Order</title> <%@include file="tem.jsp" %>
    </head>
    <body>
        <%
           
            String pname = "";
            String msg = "";
            String  rejectid = "",acceptid="",eorgid="",bookstatus="";

            acceptid = request.getParameter("acceptid");
               rejectid= request.getParameter("rejectid");

            if (acceptid != null) {
                String upd = "update  tbl_packagebook set packbook_bookstatus='1' where packbook_id='" +acceptid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                    response.sendRedirect("ViewPackagesOrders.jsp");
                } else {
                   
                    msg = "";
                    out.println(upd);
                }
            }
                if (rejectid != null) {
                String upd = "update  tbl_packagebook set packbook_bookstatus='2' where packbook_id='" +rejectid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                    response.sendRedirect("ViewPackagesOrders.jsp");

                } else {
                    msg = "";
                    out.println(upd);
                }
            }

       
       
        %>
        <%
        
            String packbook="";
            if(request.getParameter("packbookid")!=null)
            {
              packbook=request.getParameter("txtpackbook");
              String up="Update tbl_packagebook set packbook_cstatus=1 where packbook_id='"+request.getParameter("packbookid")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewPackagesOrders.jsp");
                      }
       
            %>
       
            <div id="tab">
        <h3>Package Booking(New)</h3>
        <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Name</td>
                <td>Category</td>
                <td>Rate</td>
                <td>Require Date</td>
                <td>Action</td>
                <td>Action2</td>
               
               
               
               
            </tr>
            <%

                int i = 0;
                String sel = "select * from tbl_packagebook o inner join tbl_packages p on o.packages_id=p.packages_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat .packagecat_id where packbook_bookstatus='0' and eventorg_id='"+session.getAttribute("eid")+"'";
   //             System.out.println(sel);
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("packages_name")%></td>
                <td><%=rs.getString("packagecat_name")%></td>
                 <td><%=rs.getString("packages_rate")%></td>
                 <td><%=rs.getString("packbook_requiredate")%></td>
               
               
                <td><a href="ViewPackagesOrders.jsp?acceptid=<%=rs.getString("packbook_id")%>">Accept</a></td>
                <td><a href="ViewPackagesOrders.jsp?rejectid=<%=rs.getString("packbook_id")%>">Reject</a></td>
            </tr>
            <%
                }

            %>
        </table>
       
       
       
     
        <h3>Package Booking(Accepted)</h3>
       <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
             <tr>
                <td>SI.NO</td>
                <td>Name</td>
                <td>Category</td>
                <td>Rate</td>
                <td>Require Date</td>
                <td>Action</td>
                
               
            </tr>
            <%

                int i2 = 0;
              String sel2 = "select * from tbl_packagebook o inner join tbl_packages p on o.packages_id=p.packages_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat.packagecat_id where packbook_bookstatus='1' and eventorg_id='"+session.getAttribute("eid")+"'"; 
        //       out.println(sel2);
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
             <tr>
                <td><%=i%></td>
                <td><%=rs2.getString("packages_name")%></td>
                <td><%=rs2.getString("packagecat_name")%></td>
                 <td><%=rs2.getString("packages_rate")%></td>
                 <td><%=rs2.getString("packbook_requiredate")%></td>
             
               
               
                <td><a href="ViewPackagesOrders.jsp?rejectid=<%=rs2.getString("packbook_id")%>">Accept</a></td>
               
            </tr>
            <%
                }

            %>
       </table>
        <h3>Package Booking(Work Complete)</h3>
       <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
           <tr>
                <td>SI.NO</td>
                <td>Name</td>
                <td>Category</td>
                <td>Rate</td>
                <td>Require Date</td>
                <td>Action</td>
               
               
            </tr>
            <%

                int i1 = 0;
               String sel1 = "select * from tbl_packagebook o inner join tbl_packages p on o.packages_id=p.packages_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat .packagecat_id where packbook_bookstatus='2' and eventorg_id='"+session.getAttribute("eid")+"'"; 
   //               System.out.println(sel1);
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next())
                {
                    i1++;
                    bookstatus=rs1.getString("packbook_cstatus");

            %>
           <tr>
                <td><%=i1%></td>
                <td><%=rs1.getString("packages_name")%></td>
                <td><%=rs1.getString("packagecat_name")%></td>
                 <td><%=rs1.getString("packages_rate")%></td>
                 <td><%=rs1.getString("packbook_requiredate")%></td>
                 
                  <%
                    if(bookstatus.equals("0")){
                        
                %>
                
                <td><a href="ViewPackagesOrders.jsp?packbookid=<%=rs1.getString("packbook_id")%>">Work Complete</a></td>
                
                <% 
                    }else
                    {
                %>
                <td>Work Completed</td>
            </tr>
            <%
                    }
                }

            %>
               
       
        </table>
            </div>
    </body>
</html>