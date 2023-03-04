<%-- 
    Document   : ChangePassword
    Created on : 23 Jan, 2021, 11:54:01 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <%
             
       
            String wid="",eventworker_CurrentPassword="",current_password="",New_password="",Confirm_password="";
           
           
               wid=session.getAttribute("wid").toString();
                 if(request.getParameter("btn_Save")!=null)
                 {
                       current_password=request.getParameter("txtcurrentPassword");
                       New_password=request.getParameter("txtnewpassword");
                       Confirm_password=request.getParameter("txtconfirmpassword");
                       
                        String sel2= "select * from tbl_eventworkers where eventworker_id='"+wid+"'";
                        ResultSet rs2=obj.selectCommand(sel2);
                            if(rs2.next())
          {    
           
              eventworker_CurrentPassword=rs2.getString("eventworker_password");
             
           
          }
               
               
                if(eventworker_CurrentPassword.equals(current_password))
                {
                   if(New_password.equals(Confirm_password))
                   {
                       
                     String up="update tbl_eventworkers set eventworker_password='"+New_password+"'where eventworker_id='"+wid+"'";
               boolean success=obj.executeCommand(up);
               if(success)
               {
                   out.println("<script>alert('Successfully updated')</script>");
                   
               }
               else
                   
               {
                   out.println("<script>alert('Failed to update')</script>");
                   
               }
                   }
                   else
                   {
                         out.println("<script>alert('confirmPassword mismatched')</script>");
                       }
                }
           }
            %>
                <form id="form2" name="form2" method="post" action="">
            <table border="3" align="center" cellpadding="5">
                    <tr>
                    <td>
                        Current Password
                    </td>
                    <td><input type="password" id="password" name="txtcurrentPassword" ></td>
                </tr>
                <tr>
                    <td>
                    New Password
                    </td>
                    <td>
                        <input type="password" name="txtnewpassword" id="newpassword">
                    </td>
                </tr>
                <tr>
                    <td>
                        Confirm Password
                    </td>
                    <td>
                        <input type="password" name="txtconfirmpassword" id="confirmpassword">
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="Submit" name="btn_Save" value="Update">
                       
                    </td>
                    <td>
                        <input type="Reset" name="Cancel" value="Cancel">
                    </td>
                </tr>
               
               

   </form>
 </table>
</body>
  </html>
