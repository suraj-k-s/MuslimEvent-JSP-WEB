<%-- 
    Document   : EditProfile
    Created on : 23 Jan, 2021, 11:50:16 AM
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
        <title>Edit Profile</title>
    </head>
    <body>
        <%
             
       
            String hid="",hpbranch_name="",hpbranch_email="",hpbranch_address="",hpbranch_contact="";
            hid=session.getAttribute("hid").toString();
            String sel3= "select * from tbl_hpbranch where hpbranch_id='"+hid+"'";
            ResultSet rs3=obj.selectCommand(sel3);
            if(rs3.next())
            {
                hpbranch_name=rs3.getString("hpbranch_name");
                hpbranch_address=rs3.getString("hpbranch_address");
                hpbranch_contact=rs3.getString("hpbranch_contact");
                hpbranch_email=rs3.getString("hpbranch_email");
           }
           
           
            if(request.getParameter("btn_save")!=null)
            {
                String up="update tbl_hpbranch set hpbranch_name='"+request.getParameter("txtname")+"' , hpbranch_address='"+request.getParameter("txtaddress")+"', hpbranch_contact='"+request.getParameter("txtcontact")+"',  hpbranch_email='"+request.getParameter("txtemail")+"' where  hpbranch_id='"+hid+"'";
                boolean success=  obj.executeCommand(up);
            if(success)
            {
                out.println("<script> alert('successfully updated')</script>");
               
            }
            else
            {
                out.println("<script> alert('failed to update')</script>");
            }
            }
           
           
           
            %>
            
            <div id="tab">
            <form id="form2" name="form2" method="post" action="">
            <table border="3" align="center" cellpadding="5">
           
               
                <tr>
                    <td>Name</td>
                     
                  <td><input type="text" name="txtname"  id=" hpbranch_name" value="<%= hpbranch_name %>"</td></tr>  
             
                <tr>
                    <td> Address</td>
                    <td><textarea name="txtaddress" id=" hpbranch_address"><%= hpbranch_address %></textarea>
                    </td>
                </tr>
               
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" id=" hpbranch_contact" value="<%= hpbranch_contact %>"
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id=" hpbranch_email" value="<%= hpbranch_email %>"
                    </td>
                </tr>
                <tr>
                     <td colspan="2" align="center">
                        <input type="submit" id="btn_save" name="btn_save" value="Update">
                  
                        <input type="reset" id="user_cancel" name="btn_cancel" value="Cancel">
                    </td>
               
            </table>
            </div>
          </form>
    </body>
</html>

       