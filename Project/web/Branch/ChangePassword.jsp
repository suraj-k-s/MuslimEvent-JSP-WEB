<%-- 
    Document   : ChangePassword
    Created on : 23 Jan, 2021, 11:49:50 AM
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
        <title>Change Password</title>
    </head>
    <body>
        <%
             
       
            String hid="", hpbranch_CurrentPassword="",current_password="",New_password="",Confirm_password="";
           
           
               hid=session.getAttribute("hid").toString();
                 if(request.getParameter("btn_Save")!=null)
                 {
                       current_password=request.getParameter("txtcurrentPassword");
                       New_password=request.getParameter("txtnewpassword");
                       Confirm_password=request.getParameter("txtconfirmpassword");
                       
                        String sel1= "select * from tbl_hpbranch where hpbranch_id='"+hid+"'";
                        ResultSet rs1=obj.selectCommand(sel1);
                            if(rs1.next())
          {    
           
              hpbranch_CurrentPassword=rs1.getString("hpbranch_CurrentPassword");
             
           
          }
               
               
                if( hpbranch_CurrentPassword.equals(current_password))
                {
                   if(New_password.equals(Confirm_password))
                   {
                       
                     String up="update tbl_hpbranch set hpbranch_CurrentPassword='"+New_password+"'where  hpbranch_id='"+hid+"'";
               boolean success=obj.executeCommand(up);
               if(success)
               {
                   out.println("<script>alert('successfully updated')</script>");
                   
               }
               else
                   
               {
                   out.println("<script>alert('failed to update')</script>");
                   
               }
                   }
                   else
                   {
                         out.println("<script>alert('confirmPassword mismatched')</script>");
                       }
                }
           }
            %>
            
            
            <div id="tab">
                
                
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
                        <input type="Submit" name="btn_Save" value="Update"> | <input type="Reset" name="Cancel" value="Cancel">
                       
                    
                        
                    </td>
                </tr>
               

         
          </table>
        </form>       
      </div>   
        
    </body>
        
  </html>
