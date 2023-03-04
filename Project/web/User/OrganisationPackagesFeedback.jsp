<%-- 
    Document   : OrganisationPackagesFeedback
    Created on : 26 Mar, 2021, 10:34:42 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organization Package Feedback</title>
    </head>
       <%
       
           
            String wpfcontent="";
           
           
            String msg="";
           
            if(request.getParameter("btnsubmit")!=null)
            {
                wpfcontent=request.getParameter("txtfeedback");
                 
                 
               
                 
               
                    String ins="insert into tbl_organisationpackagefeedback(opfeedback_content,opfeedback_date,user_id,wp_id) values('"+wpfcontent+"',curdate(),'"+session.getAttribute("uid")+"','"+request.getParameter("wpid")+"')";
                    //out.println(ins);
                    boolean bol= obj.executeCommand(ins);
                    if(bol==true)
                    {
                        msg="record inserted";
                    }else{
                        msg="";
                        out.println(ins);
                    }
               
   
   
   
   
            }
   
    %>
    <body>
        <form method="POST">
            <table border="2" align="center">
                <tr>
                    <td>Feedback</td>
                    <td><textarea name="txtfeedback" id="txtfeedback"></textarea>
            </tr>
             <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" id="btnsubmit" value="SendFeedback">
                       
                    </td>
                 </tr>
             
            </table>
        </form>
    </body>
</html>
