<%-- 
    Document   : GiftGallery
    Created on : 13 Mar, 2021, 11:01:18 AM
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
        <title>Gift Gallery</title>
    </head>
    <body>
       <%
    
    
             session.setAttribute("giftsid",request.getParameter("giftsid"));
             String msg="";
             String delid = "",ggimage = "",ggid = "",ggcaption= "";
             
             ggimage=request.getParameter("file_photo");
        
             ggcaption=request.getParameter("txtcaption");
        
             delid=request.getParameter("delid");
             
             
             if(delid!=null)
             {
             
              String del="delete from tbl_giftgallery where gg_id='"+delid+"'";
              boolean bol= obj.executeCommand(del);
              out.println(bol);
              if(bol == true)
              {
                  msg="Record Deleted...";
                  
              }
              else
              {
                  msg="";
                  out.println(del);
              }
            }
        
        %>
    <div id="tab">
      <form enctype="multipart/form-data"  method="POST" action="GalleyUploadAction.jsp">
                  
                 <table border="3" align="center" cellpadding="5">
                      <tr>
                    <td>
                        Caption
                    </td>
                    <td>
                        <input type="text" name="txtcaption" required="required" autocomplete="off" id="txtcaption">
                    </td>
                </tr> 
                     
                     <tr>
                    <td>
                        Image
                    </td>
                    <td>
                        <input type="file"  name="file_photo" required="required" autocomplete="off" id="file_photo">
                    </td>
                </tr>
                <tr>
                  <td colspan="2" align="center">
                        
                             <input type="submit" id="user_save" name="btn_save"  value="Upload">
                    </td>
                </tr>
                </table>
                        
         <table border="2" align="center">
        <tr>
        <br>
        <br>
            <th>SI No</th>
            <th>Caption</th>
            <th>Image</th>
            <th>Action</th>
            
        </tr>
        
            <%
              int i = 0;
            String sel1="select * from tbl_giftgallery where gifts_id='"+request.getParameter("giftsid")+"'";
           ResultSet rs1=obj.selectCommand(sel1);
            while(rs1.next())
            {
                i++;
            %>
            
            
            <tr>
                <td><%=i%></td>
                 <td> <%=rs1.getString("gg_caption")%></td>
                 <td><img src="../Assets/GiftGallery/<%=rs1.getString("gg_image")%>" width="150" height="150"></td>
                  <td><a href="GiftGallery.jsp?delid=<%=rs1.getString("gg_id")%>">Delete</a></td>
                 
                 </tr>
        <%
           }
           %>
            </table>        
        </form>
    </body>
</div>
</html>  
            