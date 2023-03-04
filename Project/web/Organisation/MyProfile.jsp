<%-- 
    Document   : MyProfile
    Created on : 23 Jan, 2021, 11:53:16 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title> <%@include file="tem.jsp" %>
    </head>
    <body>
          <%
             
       
            String eid="",eventorg_proof="",eventorg_name="",eventorg_address="",eventorg_contact="",eventorg_email="";          

           
               eid=session.getAttribute("eid").toString();

           
          String sel1= "select * from tbl_eventorg u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district dis on p.district_id=dis.district_id where eventorg_id='"+eid+"'";
           ResultSet rs1=obj.selectCommand(sel1);
           if(rs1.next())
           {
               eventorg_proof=rs1.getString("eventorg_proof");
               eventorg_name=rs1.getString("eventorg_name");
               eventorg_address=rs1.getString("eventorg_address");
               eventorg_contact=rs1.getString("eventorg_contact");
               eventorg_email=rs1.getString("eventorg_email");
           }
           
           
            %>
            <div id="tab">
               <form id="form2" name="form2" method="post" action="">
            <table border="3" align="center" cellpadding="5">
                 <tr>
                        <td>Image</td>
                        <td><img src="../Assets/EventOrgProof/<%=rs1.getString("eventorg_proof")%>" width="150" height="150"></td>
                    </tr>
                
                <tr><td>Name</td>
                    <td><%=eventorg_name %></td></tr>  
                <tr>
                    <td> Address</td>
                    <td>
                        <%=eventorg_address %>
                    </td>
                </tr>
               
                <tr>
                    <td>Contact</td>
                    <td>
                        <%=eventorg_contact %>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <%=eventorg_email %>
                    </td>
                </tr>
                <tr>
                    <td>place</td>
                    <td><%=rs1.getString("Place_name") %></td></tr>
                <tr> <td>district</td>
                    <td><%=rs1.getString("District_name") %></td>
                   
                       
                   
                </tr>
            </table>
               </form>
            </div>
    </body>
</html>


