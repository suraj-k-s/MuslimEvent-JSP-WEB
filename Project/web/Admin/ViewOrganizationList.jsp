<%-- 
    Document   : ViewCommunityPackages
    Created on : 19 Mar, 2021, 1:49:30 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Organization List</title>
        
    </head>
    <body>
        <div id="tab"  align="center">
        <form>
            <table>
                <tr>
                      <td>
                       District Name
                    </td>
                   
                    <td>
                        <select name="seldistrict" onchange="getplace(this.value)">
                            <option>----select----</option>
                            <%
            String Sel="select*from tbl_district";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
               
                <option value="<%=rs.getString("district_id")%>"> <%=rs.getString("district_name")%></option>
                <%
            }
            %>
                        </select>
                             
               
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <td>
                        Place Name
                    </td>

                    <td>
                        <select name="selplace" id="selplace">
                            <option>----select----</option>
                           
                        </select>
               
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 
                 
                  </td>
               
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" id="btnsubmit" value="Search">
                       
                    </td>
                 </tr>
               
            </table>
         </form>
                 <br>
                <br>
                <br>
                <%
                   
                       
                    if (request.getParameter("btnsubmit") != null)
                    {    
                    %>
                   
                <table border="2" align="center"  cellspacing="10" style="border-collapse:collapse;">
            <tr>
                <th>SI.NO</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Proof</th>
                <th>Logo</th>
                <th>Action</th>
            </tr>
            <%

                int i = 0;
                String sel2 = "select * from tbl_eventorg where  Place_id='"+request.getParameter("slctplace")+"'";
                ResultSet rs2= obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs2.getString("eventorg_name")%></td>
                <td><%=rs2.getString("eventorg_contact")%></td>
                <td><%=rs2.getString("eventorg_email")%></td>
                <td><img src="../Assets/EventProof/<%=rs2.getString("eventorg_proof")%>"  width="120" height="120"></td>
                <td><img src="../Assets/EventLogo/<%=rs2.getString("eventorg_logo")%>" width="120" height="120"></td>
                <td><a href="ViewOrganizationPackages.jsp?wpid=<%=rs2.getString("eventorg_id")%>">View</a></td>
               
               
            </tr>
            <%
                }

            %>
            <%
                    }
                    %>
          </table>
           <script src="../AjaxPages/jQuery.js"></script>
        <script>
                                function getplace(did)
                                {
                                    // alert(did);  

                                    $.ajax({url: "../AjaxPages/AjaxPlace.jsp?disid=" + did,
                                        success: function(result) {
                                        //     alert(result);
                                            $("#selplace").html(result);
                                        }});
                                }
        </script>
    </body>
</div>
</html>