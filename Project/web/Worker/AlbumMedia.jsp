<%-- 
    Document   : AlbumMedia
    Created on : 5 Mar, 2021, 2:10:14 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%
    
    session.setAttribute("albumid",request.getParameter("albumid"));
    
    
    %>
      
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Album Media</title>
    </head>
    <%
                  String msg= ""; 
                  String delid= "",almfile= "",almid= "",almcaption;
                  
                  
                  almfile= request.getParameter("txtfile");
                  almcaption= request.getParameter("txtcaption");
                   
                  delid= request.getParameter("albumid");
                  
                  
                  
                   if(delid!=null)
            {
           String del="delete from tbl_albummedia where alm_id='" + delid + "'";
            boolean bol=obj.executeCommand(del);
            out.println(bol);
            if(bol == true)
            {
                
            msg = "Record deleted...";
            
            }
            else
            {
                msg = "";
            out.println(del);
            }
            }
         %>
   <body>
       <form  method="POST" enctype="multipart/form-data" action="AlbumMediaUploadAction.jsp">
                 <table border="3" align="center" cellpadding="5">
                     <form method="post" enctype="multipart/form-data" action="AddWorkersPackageAction.jsp">
           <table border="2" align="center">
               
                 <tr>
                    
                      <td>Media File</td>
                      <td><input type="file" id="txtfile" name="txtfile"></td>
                 </tr> 
                
                 <tr>
                      <td>caption</td>
                      <td><input type="txtcaption" id="txtcaption" name="txtcaption"></td>
                 </tr>  
                 <tr> 
                        
                       <td colspan="2" align="center">
                       <input type="submit" id="btnsubmit" name="btnsubmit" value="Save"> </td>
                  </tr>
                
            
            </table>
        </form>
                <br>
                <br>
                <br>
                <br>
                <table border="2" align="center" cellpadding="5">
                    <tr>
                        <td>SI.NO</td>
                         <td>Media File</td>
                          <td>Caption</td>
                          <td>Action</td>
                          
                    </tr>
                    <%
                    
                        int i=0;
                        String sel="select * from tbl_albummedia where wa_id='"+request.getParameter("albumid")+"'";
                         out.print(sel);
                        ResultSet rs1 = obj.selectCommand(sel);
                        while (rs1.next())
                        {
                            i++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        
                       <td><img src="../Assets/AlbumMedia/<%=rs1.getString("alm_file")%>" width="150" height="150"></td>
                        <td><%=rs1.getString("alm_caption")%></td>
                        <td><a href="AlbumMedia.jsp?albumid=<%=rs1.getString("alm_id")%>">Delete</a>
                        </td>
                       
                    </tr>   
                    <%
                            
                        }
         
                    
                    %>
        </table>
    </body>
</html>  
