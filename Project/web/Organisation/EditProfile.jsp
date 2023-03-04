<%-- 
    Document   : EditProfile
    Created on : 23 Jan, 2021, 11:52:23 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title> <%@include file="tem.jsp" %>
    </head>
    <body>
        <%
             
         String eid="",eventorg_name="",eventorg_email="",eventorg_address="",eventorg_contact="";
            eid=session.getAttribute("eid").toString();
            String sel1= "select * from tbl_eventorg where eventorg_id='"+eid+"'";
            ResultSet rs1=obj.selectCommand(sel1);
            if(rs1.next())
            {
                eventorg_name=rs1.getString("eventorg_name");
                eventorg_address=rs1.getString("eventorg_address");
                eventorg_contact=rs1.getString("eventorg_contact");
                eventorg_email=rs1.getString("eventorg_email");
           }
           
           
           
            if(request.getParameter("btn_Save")!=null)
            {
                String up="update tbl_eventorg set eventorg_name='"+request.getParameter("txtname")+"' ,  eventorg_address='"+request.getParameter("txtaddress")+"',  eventorg_contact='"+request.getParameter("txtcontact")+"', eventorg_email='"+request.getParameter("txtemail")+"' where   eventorg_id='"+eid+"'";
                boolean success=obj.executeCommand(up);
            if(success)
            {
                out.println("<script> alert('Successfully Updated')</script>");
               
            }
            else
            {
                out.println("<script> alert('Failed to Update')</script>");
                         
            }
            }
           
           
           
            %>
            <div id="tab">
            <form id="form2" name="form2" method="post" action="">
            <table border="3" align="center" cellpadding="5">
               
                <tr>
                    <td>Name</td>
                     
                  <td><input type="text" name="txtname"  id=" eventorg_name" value="<%=  eventorg_name %>"</td></tr>  
             
                <tr>
                    <td> Address</td>
                    <td><textarea name="txtaddress" id="  eventorg_address"><%=  eventorg_address %></textarea>
                    </td>
                </tr>
               
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" id="  eventorg_contact" value="<%=  eventorg_contact %>"
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id="  eventorg_email" value="<%=  eventorg_email %>"
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="Submit" id="btn_Save" name="btn_Save" value="Update">
                    </td>
               
                    <td>
                        <input type="Reset" id="user_Cancel" name="btn_Cancel" value="Cancel">
                    </td>
               
            </table>
          </form>
    </div>
    </body>
</html>

       