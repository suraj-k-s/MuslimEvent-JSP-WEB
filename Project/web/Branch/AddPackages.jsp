<%-- 
    Document   : AddPackages
    Created on : 9 Mar, 2021, 3:14:18 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="tem.jsp" %>
        <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Packages</title>
    </head>
    <%
        
             String packagecategory="";
             String msg="";
             String delid="";
        
             packagecategory=request.getParameter("txtpackagecategory");
        
             delid=request.getParameter("delid");
             
             
             if(delid!=null)
             {
             
              String del="delete from tbl_packages where packages_id='"+delid+"'";
              boolean bol= obj.executeCommand(del);
              out.println(bol);
              if(bol == true)
              {
                  msg="Record Deleted...";
                  
              }
              else
              {
                  msg="";
                  out.println(del);
              }
            }
        
        %>
        <div id="tab">
        <form id="form1" name="form1" method="post" action="">
                <table border="3" align="center" cellpadding="5">
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
                    <td>Package Name</td>
                    <td><input type="text" name="txtname" id="txtname"></td>
                </tr>
                
               <tr>
                    <td colspan="2" align="center" cellpadding="5">
                        <input type="SUBMIT" name="btnsubmit" id="btnsubmit" value="Save">
                    </td>
                </tr>
                </table>
              <table border="2" align="center" cellpadding="10" style="border-collapse:collapse;">
               <tr>
                          <td>SI NO</td>
                          <td>Package category</td>
                          <td>Details</td>
                          <td>Rate</td>
                          <td>Package Name</td>
                          <td>Action</td>
                         
               </tr>
                <%
                    int i= 0;
                        String Sel1="select * from tbl_packages";
                        ResultSet rs1=obj.selectCommand(Sel1);
                        while (rs1.next())
                        {
                            i++;
                            
                    %>
               
            <tr>
                   <td><%=i%></td>
                   <td><%=rs1.getString("packagecat_id")%></td>
                   <td><img src="../Assets/PackageDetails/<%=rs1.getString("packages_details")%>" width="150" height="150"></td>
                   <td><%=rs1.getString("packages_rate")%></td>
                   <td><%=rs1.getString("packages_name")%></td>
                   <td><a href="AddPackages.jsp?delid=<%=rs1.getString("packages_id")%>">Delete</a></td>
                   
                    </tr>
                    <%
                        }
                        
                     %>
                     
                    
                       
           </table>
        </div>
    </form>
  </body>
</html>
