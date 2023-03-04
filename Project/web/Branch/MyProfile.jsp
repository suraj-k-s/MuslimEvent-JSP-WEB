<%-- 
    Document   : MyProfile
    Created on : 23 Jan, 2021, 11:50:57 AM
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
        <title>My Profile</title>
    </head>
    <body>
          <%
             
       
            String hid="",hpbranch_photo="",hpbranch_name="",hpbranch_address="",hpbranch_contact="",hpbranch_email="";          
;
           
               hid=session.getAttribute("hid").toString();

           
          String sel3= "select * from tbl_hpbranch u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district dis on p.district_id=dis.district_id where hpbranch_id='"+hid+"'";
           ResultSet rs3=obj.selectCommand(sel3);
           if(rs3.next())
           {
               hpbranch_photo=rs3.getString("hpbranch_photo");
                hpbranch_name=rs3.getString("hpbranch_name");
                hpbranch_address=rs3.getString("hpbranch_address");
                hpbranch_contact=rs3.getString("hpbranch_contact");
                hpbranch_email=rs3.getString("hpbranch_email");
           }
           
           
            %>
            
                <div id="tab">
               <form id="form2" name="form2" method="post" action="">
            <table border="3" align="center" cellpadding="5">
                  <tr>
                        <td>Image</td>
                        <td><img src="../Assets/BranchPhotos/<%=rs3.getString("hpbranch_photo")%>" width="150" height="150"></td>
                    </tr>
                <tr><td>Name</td>
                    <td><%=hpbranch_name %></td></tr>  
                <tr>
                    <td> Address</td>
                    <td>
                        <%=hpbranch_address %>
                    </td>
                </tr>
               
                <tr>
                    <td>Contact</td>
                    <td>
                        <%=hpbranch_contact %>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <%=hpbranch_email %>
                    </td>
                </tr>
                <tr>
                    <td>place</td>
                    <td><%=rs3.getString("place_name") %></td></tr>
                <tr> <td>district</td>
                    <td><%=rs3.getString("district_name") %></td>
                   
                       
                   
                </tr>
            </table>
                </div>
    </body>
</html>


