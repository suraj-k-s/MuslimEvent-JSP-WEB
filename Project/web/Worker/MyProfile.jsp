<%-- 
    Document   : MyProfile
    Created on : 23 Jan, 2021, 11:54:58 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
          <%
             
       
            String wid="",eventworker_photo="",eventworker_name="",eventworker_address="",eventworker_contact="",eventworker_email="";          
;
           
               wid=session.getAttribute("wid").toString();

           
          String sel2= "select * from tbl_eventworkers u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district dis on p.district_id=dis.district_id where eventworker_id='"+wid+"'";
           ResultSet rs2=obj.selectCommand(sel2);
           if(rs2.next())
           {
               eventworker_photo=rs2.getString("eventworker_photo");
               eventworker_name=rs2.getString("eventworker_name");
               eventworker_address=rs2.getString("eventworker_address");
               eventworker_contact=rs2.getString("eventworker_contact");
               eventworker_email=rs2.getString("eventworker_email");
           }
           
           
            %>
               <form id="form2" name="form2" method="post" action="">
           <table border="3" align="center" cellpadding="5">
                <tr>
                        <td>Image</td>
                        <td><img src="../Assets/EventPhoto/<%=rs2.getString("eventworker_photo")%>" width="150" height="150"></td>
                    </tr>
                
               
                <tr><td>Name</td>
                    <td><%=eventworker_name %></td></tr>  
                <tr>
                    <td> Address</td>
                    <td>
                        <%=eventworker_address %>
                    </td>
                </tr>
               
                <tr>
                    <td>Contact</td>
                    <td>
                        <%=eventworker_contact %>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <%=eventworker_email %>
                    </td>
                </tr>
                <tr>
                    <td>place</td>
                    <td><%=rs2.getString("place_name") %></td></tr>
                <tr> <td>district</td>
                    <td><%=rs2.getString("district_name") %></td>
                   
                       
                   
                </tr>
            </table>
   
    </body>
</html>


