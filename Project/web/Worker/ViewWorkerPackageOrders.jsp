<%-- 
    Document   : ViewWorkerPackageOrders
    Created on : 4 Apr, 2021, 11:11:16 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Package Order</title>
    </head>
    <body>
        <%
           
            String pname = "";
            String msg = "";
            String  rejectid = "",acceptid="",eworkid="",bookstatus="";

            acceptid = request.getParameter("acceptid");
               rejectid= request.getParameter("rejectid");

            if (acceptid != null) {
                String upd = "update  tbl_workerbook set workerbook_bookstatus='1' where workerbook_id='" +acceptid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                    response.sendRedirect("ViewWorkerPackageOrders.jsp");
                } else {
                   
                    msg = "";
                    out.println(upd);
                }
            }
                if (rejectid != null) {
                String upd = "update  tbl_workerbook set workerbook_bookstatus='2' where workerbook_id='" +rejectid+ "'";
                boolean bol = obj.executeCommand(upd);
                out.println(bol);
                if (bol == true) {
                    msg = "Updated...";
                    response.sendRedirect("ViewWorkerPackageOrders.jsp");

                } else {
                    msg = "";
                    out.println(upd);
                }
            }

       
       
        %>
        <%
        
            String workbook="";
            if(request.getParameter("workbookid")!=null)
            {
              workbook=request.getParameter("txtworkbook");
              String up="Update tbl_workerbook set workerbook_bookstatus=1 where workerbook_id='"+request.getParameter("workbookid")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewWorkerPackageOrders.jsp");
                      }
       
            %>
       
        <h3>Package Booking(New)</h3>
        <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Image</td>
                <td>Category</td>
                <td>Rate</td>
                <td>Require Date</td>
                <td>Action</td>
                <td>Action2</td>
               
               
               
               
            </tr>
            <%

                int i = 0;
                String sel = "select * from tbl_workerbook o inner join tbl_workerspackage p on o.wsp_id=p.wsp_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat .packagecat_id where workerbook_bookstatus='0' and eventworker_id='"+session.getAttribute("wid")+"'";
   //             System.out.println(sel);
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                 <td><img src="../Assets/WorkersImages/<%=rs.getString("wsp_workimage")%>" width="100" height="100"></td>                  
                 <td><%=rs.getString("packagecat_name")%></td>
                 <td><%=rs.getString("wsp_rate")%></td>
                 <td><%=rs.getString("workerbook_requiredate")%></td>
               
               
                <td><a href="ViewWorkerPackageOrders.jsp?acceptid=<%=rs.getString("workerbook_id")%>">Accept</a></td>
                <td><a href="ViewWorkerPackageOrders.jsp?rejectid=<%=rs.getString("workerbook_id")%>">Reject</a></td>
            </tr>
            <%
                }

            %>
        </table>
       
       
       
     
        <h3>Package Booking(Accepted)</h3>
       <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
             <tr>
                <td>SI.NO</td>
                <td>Image</td>
                <td>Category</td>
                <td>Rate</td>
                <td>Require Date</td>
                <td>Action</td>
                
               
            </tr>
            <%

                int i2 = 0;
              String sel2 = "select * from tbl_workerbook o inner join tbl_workerspackage p on o.wsp_id=p.wsp_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat .packagecat_id where workerbook_bookstatus='1' and eventworker_id='"+session.getAttribute("wid")+"'";
        //       out.println(sel2);
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
             <tr>
                <td><%=i%></td>
                <td><img src="../Assets/WorkersImages/<%=rs2.getString("wsp_workimage")%>" width="100" height="100"></td>               
                <td><%=rs2.getString("packagecat_name")%></td>
                 <td><%=rs2.getString("wsp_rate")%></td>
                 <td><%=rs2.getString("workerbook_requiredate")%></td>
               
             
               
               
                <td><a href="ViewWorkerPackageOrders.jsp?rejectid=<%=rs2.getString("workerbook_id")%>">Accept</a></td>
               
            </tr>
            <%
                }

            %>
       </table>
        <h3>Package Booking(Work Complete)</h3>
       <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
           <tr>
                <td>SI.NO</td>
                <td>Image</td>
                <td>Category</td>
                <td>Rate</td>
                <td>Require Date</td>
                <td>Action</td>
               
               
            </tr>
            <%

                int i1 = 0;
               String sel1 = "select * from tbl_workerbook o inner join tbl_workerspackage p on o.wsp_id=p.wsp_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat .packagecat_id where workerbook_bookstatus='2' and eventworker_id='"+session.getAttribute("wid")+"'";
   //               System.out.println(sel1);
                ResultSet rs1 = obj.selectCommand(sel1);
                while (rs1.next())
                {
                    i1++;
                    bookstatus=rs1.getString("workerbook_cstatus");

            %>
           <tr>
                <td><%=i1%></td>
                 <td><img src="../Assets/WorkersImages/<%=rs1.getString("wsp_workimage")%>" width="100" height="100"></td>                   
                 <td><%=rs1.getString("packagecat_name")%></td>
                 <td><%=rs1.getString("wsp_rate")%></td>
                 <td><%=rs1.getString("workerbook_requiredate")%></td>
                 
                  <%
                    if(bookstatus.equals("0")){
                        
                %>
                
                <td><a href="ViewWorkerPackageOrders.jsp?workbookid=<%=rs1.getString("workerbook_id")%>">Work Complete</a></td>
                
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
    </body>
</html>