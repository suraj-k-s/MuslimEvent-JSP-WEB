<%-- 
    Document   : Eventcategory
    Created on : 16 Jan, 2021, 2:39:52 PM
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
        <title>Event Work Category</title>
    </head>
        
        <%
    String ewcategory = "";
    String msg = "";
    String delid = "", editid = "", ewcatname = "", ewcatid = "";

    ewcategory = request.getParameter("txtewcategory");

    delid = request.getParameter("delid");

    if (delid != null) {
        String del = "delete from tbl_eventworkercat where eventworkcat_id='" + delid + "'";
        boolean bol = obj.executeCommand(del);
        out.println(bol);
        if (bol == true) {
            msg = "Record Deleted...";

        } else {
            msg = "";
            out.println(del);
        }
    }

    if (request.getParameter("btnsubmit") != null)
    {
        if (request.getParameter("hdid").equals("")) {

            String ins = "insert into tbl_eventworkercat(eventworkcat_name)values('" + ewcategory+ "')";
            boolean bol = obj.executeCommand(ins);
            out.println(bol);
            if (bol == true) {
                msg = "Record saved...";

            } else {
                msg = "";
                out.println(ins);
            }
        } else {
            String upd = "update tbl_eventworkercat set eventworkcat_name='" + ewcategory + "' where eventworkcat_id='" + request.getParameter("hdid") + "'";
            obj.executeCommand(upd);
            out.println("<script>alert('update successfully!!')</script>");
            response.sendRedirect("Eventworkcategory.jsp");

        }
    }

    editid = request.getParameter("editid");
    if (editid != null) {
        String sel1 = "select * from tbl_eventworkercat where eventworkcat_id='" + editid + "'";
        ResultSet rs1 = obj.selectCommand(sel1);
        if (rs1.next()) {
            ewcatid = rs1.getString("eventworkcat_id");
        }
        ewcatname = rs1.getString("eventworkcat_name");

    }
%>
        
        <title>Event Work Category</title>
    </head>
    <body>
        <div id="tab">
        <form method="post">
            <input type="hidden" name="hdid" id="hdid" value="<%= ewcatid%>">
            <table border="3" align="center">
                <tr>
                    <td>Event Work Category</td>
                    <td><input type="text" name="txtewcategory" required="required" autocomplete="off" id="txtewcategory" value="<%=ewcatname%>"></td>
                </tr>
                <tr>
                     <td colspan="2" align="center">


                        <input type="submit" name="btnsubmit" id="btnsubmit" value="submit">
                        <input type="submit" name="btncancel" id="btncancel" value="cancel">
                    </td>  
                </tr>
                <tr>
                    <td colspan="2" align="center">
                   
                       
                        <%=msg%>

                    </td>
                </tr>
            </table>
        </form>
                        <br>
                        <br>
                        
        <table border="2" align="center">
            <tr>
                <th>SI.NO</th>
                <th>Event work category</th>
                <th>Action</th>
               
            </tr>
            <%
                int i = 0;
                String sel = "select * from tbl_eventworkercat";
                ResultSet rs = obj.selectCommand(sel);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=rs.getString("eventworkcat_id")%></td>
                <td><%=rs.getString("eventworkcat_name")%></td>
                <td><a href="Eventworkcategory.jsp?delid=<%=rs.getString("eventworkcat_id")%>">Delete</a> | <a href="Eventworkcategory.jsp?editid=<%=rs.getString("eventworkcat_id")%>">Edit</a></td>
              
            </tr>
            <%
                }
            %>
        </table>
    </body>
</div>
</html>