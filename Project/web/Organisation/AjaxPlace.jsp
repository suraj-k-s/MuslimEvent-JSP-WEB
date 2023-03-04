<%-- 
    Document   : AjaxPlace
    Created on : 18 Mar, 2021, 2:42:12 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax Place</title>
    </head>
    <body>
    <option>-----Select Place----</option>
         <%
                                  String sel1="select * from tbl_place where District_id='"+request.getParameter("cid")+"'";
                                    ResultSet rs1=con.selectCommand(sel1);
                                    while(rs1.next())
                                     {
                                 
                                 %>
                                 <option value="<%=rs1.getString("Place_id")%>"><%=rs1.getString("Place_name")%></option>
                                 <%
                         
        }
                  %>
    </body>
</html>
