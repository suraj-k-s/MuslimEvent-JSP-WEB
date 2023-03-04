<%-- 
    Document   : Reply
    Created on : 8 Mar, 2021, 10:18:14 PM
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
        <title>Reply</title>
        <%
            String reply="";
            if(request.getParameter("btnsave")!=null)
            {
              reply=request.getParameter("txtreply");
              String up="Update tbl_complaints set complaint_reply='"+reply+"',complaint_replydate=curdate(),complaint_replystatus=1 where complaint_id='"+request.getParameter("cid")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewComplaints.jsp");
                      }
        %>
    </head>        
    
    
    <body>
       <div id="tab">
        <form method="POST">
            <input type="hidden" name="hdid" id="hdid" value="<%= request.getParameter("cid")%>">
            <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>Reply</td>
                    <td><textarea name="txtreply" required="required"></textarea></td>
                </tr>
                
                <tr>
                   <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
        </div>
</html>