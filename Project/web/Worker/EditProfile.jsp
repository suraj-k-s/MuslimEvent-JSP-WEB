<%-- 
    Document   : EditProfile
    Created on : 23 Jan, 2021, 11:54:21 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%
             
       
            String wid="",eventworker_photo="",eventworker_name="",eventworker_email="",eventworker_address="",eventworker_contact="";
            wid=session.getAttribute("wid").toString();
            String sel2= "select * from tbl_eventworkers where eventworker_id='"+wid+"'";
            ResultSet rs2=obj.selectCommand(sel2);
            if(rs2.next())
            {
                eventworker_photo=rs2.getString("eventworker_photo");
                eventworker_name=rs2.getString("eventworker_name");
                eventworker_address=rs2.getString("eventworker_address");
                eventworker_contact=rs2.getString("eventworker_contact");
                eventworker_email=rs2.getString("eventworker_email");
           }
           
           
            if(request.getParameter("btn_save")!=null)
            {
                String up="update tbl_eventworkers set eventworker_photo='"+request.getParameter("txtfile")+"' , eventworker_name='"+request.getParameter("txtname")+"' , eventworker_address='"+request.getParameter("txtaddress")+"', eventworker_contact='"+request.getParameter("txtcontact")+"', eventworker_email='"+request.getParameter("txtemail")+"' where  eventworker_id='"+wid+"'";
                boolean success=  obj.executeCommand(up);
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
            <form  method="POST" id="form2" name="form2"  action="">
             <table border="3" align="center" cellpadding="5">
                 <tr>
                    <td>Photo</td>
                     
                  <td><input type="file" name="txtfile"  id=" eventworker_photo" value="<%= eventworker_photo %>"</td></tr>  
             
            
               
                <tr>
                    <td>Name</td>
                     
                  <td><input type="text" name="txtname"  id=" eventworker_name" value="<%= eventworker_name %>"</td></tr>  
             
                <tr>
                    <td> Address</td>
                    <td><textarea name="txtaddress" id="eventworker_address"><%=eventworker_address %></textarea>
                    </td>
                </tr>
               
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" id=" eventworker_contact" value="<%= eventworker_contact %>"
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" id=" eventworker_email" value="<%= eventworker_email %>"
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="Submit" id="btn_Save" name="btn_save" value="Update">
                    </td>
               
                    <td>
                        <input type="Reset" id="user_Cancel" name="btn_cancel" value="Cancel">
                    </td>
               
           
         
        </table>
    </body>
     </form>
</html>

       