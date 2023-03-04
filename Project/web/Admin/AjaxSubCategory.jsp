<%-- 
    Document   : AjaxSubCategory
    Created on : 18 Mar, 2021, 2:40:11 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
 <jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub category</title>
    </head>
    <body>
    <option>-----Select Sub Category----</option>
         <%
                                  String sel1="select * from tbl_subcategory where category_id='"+request.getParameter("cid")+"'";
                                    ResultSet rs1=con.selectCommand(sel1);
                                    while(rs1.next())
                                     {
                                 
                                 %>
                                 <option value="<%=rs1.getString("subcategory_id")%>"><%=rs1.getString("subcategory_name")%></option>
                                 <%
                         
                                  }
                  %>
    </body>
</html>
