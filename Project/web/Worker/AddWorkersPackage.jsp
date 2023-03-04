<%-- 
    Document   : AddWorkersPackage
    Created on : 19 Mar, 2021, 3:28:42 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
   
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Worker Package</title>
    </head>
     <%
            String packagerate = "";
            String msg = "";
            String delid = "";
           
            packagerate = request.getParameter("txtrate");

            delid = request.getParameter("delid");

            if (delid != null) {
                String del = "delete from tbl_workerspackage where wsp_id='" + delid + "'";
                boolean bol = obj.executeCommand(del);
                out.println(bol);
                if (bol == true) {
                    msg = "Record Deleted...";

                } else {
                    msg = "";
                    out.println(del);
                }
            }
            %>
    <body>
       <form method="post" enctype="multipart/form-data" action="AddWorkersPackageAction.jsp">
           <table border="2" align="center">
                <tr>
                    <td>Package category</td> 
                       
                     <td>
                        <select name="txtpackagecategory" id="txtpackagecategory">
                            <option value="">----select----</option>
                            <%
            String Sel="select*from tbl_packagecategory";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
               
                <option value="<%=rs.getString("packagecat_id")%>"> <%=rs.getString("packagecat_name")%></option>
                <%
            }
            %>
              </select>
                 </tr>
              
                
            <tr>
                        <td>Details</td>
                        <td><input type="file" name="txtfile" id="txtfile"></td>
                    </tr>
                    <tr>
                        <td>Rate</td>
                        <td><input type="text" name="txtrate" id="txtrate"></td>
                    </tr>
                   
                   
                   
               <tr>
                        <td>Remarks</td>
                        <td><input type="text" name="txtremarks" id="txtremarks"></td>
                    </tr>
                    
                     <tr>
                        <td>Image</td>
                        <td><input type="file" name="txtimage" id="txtimage"></td>
                    </tr>
                   
               <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" id="btnsubmit" value="Save">
                       
                    </td>
                 </tr>  
                 
               
               
               
               
               
               
           </table>
            <table border="2" align="center">
            <tr>
                 <td>SI No</td>
                <td>Package Category</td>
                <td>Package Category Name</td>
                 <td>Details</td>
                 <td>Image</td>
                 <td>Rate</td>
                  <td>Remarks</td>
                <td>Action</td>
                <td>Feedback</td>
            </tr>
           <%

               int i = 0;
               String sel1="select * from tbl_workerspackage pk inner join tbl_packagecategory pcat on pk.packagecat_id=pcat.packagecat_id where eventworker_id='"+session.getAttribute("wid")+"'";
             //  out.println(sel1);
               ResultSet rs1 = obj.selectCommand(sel1);
               while (rs1.next()) {
                    i++;

           %>
            <tr>
                <td><%=i%></td>
                 <td><%=rs1.getString("packagecat_id")%></td>
                    <td><%=rs1.getString("packagecat_name")%></td>
                <td><img src="../Assets/WorkersDetails/<%=rs1.getString("wsp_detail")%>"  width="120" height="120"></td>
                <td><img src="../Assets/WorkersImages/<%=rs1.getString("wsp_workimage")%>" width="120" height="120"></td>
                <td><%=rs1.getString("wsp_rate")%></td>
               <td><%=rs1.getString("wsp_remark")%></td>
                <td><a href="AddWorkersPackage.jsp?delid=<%=rs1.getString("wsp_id")%>">Delete</a></td>
                <td><a href="WorkerFeedback.jsp?wspid=<%=rs1.getString("wsp_id")%>">View Feedback</a></td>
               
            </tr>
            <%
                }

           
           %>
            </table>
       </form>
    </body>
</html>
