<%-- 
    Document   : GiftProducts
    Created on : 10 Mar, 2021, 8:47:50 PM
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
        <title>Gift Products</title>
   </head>
   <body>
     <%
        
             String gifttype="";
             String msg="";
             String delid="";
        
             gifttype=request.getParameter("txtgname");
        
             delid=request.getParameter("delid");
             
             
             if(delid!=null)
             {
             
              String del="delete from tbl_gifts where gifts_id='"+delid+"'";
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gift Products</title>
   </head>

       
       <div id="tab">
        
              <form enctype="multipart/form-data"  method="POST" action="GiftUploadAction.jsp">
                  
                 <table border="3" align="center" cellpadding="5">
                     
                     <tr>
                    <td>
                        Image
                    </td>
                    <td>
                        <input type="file" name="file_photo" required="required" autocomplete="off"  id="file_photo">
                    </td>
                </tr>
                     
                  <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="gname" required="required" autocomplete="off" id="gname">
                    </td>
                </tr> 
                    <tr>
                    <td>
                        Gift Item
                    </td>
                    <td>
                        <input type="text"  name="iname" required="required" autocomplete="off" id="iname">
                    </td>
                </tr> 
                        
                 <tr>
                    <td>
                        Gift Type
                    </td>
                   
                    <td>
                        <select name="selgifttype" onchange="getplace(this.value)">
                            <option>----select----</option>
                            <%
            String Sel="select*from tbl_gifttype";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
               
                <option value="<%=rs.getString("gifttype_id")%>"> <%=rs.getString("gifttype_name")%></option>
                <%
            }
            %>
                        </select>
                             
         
                   
                 <tr>
                    <td>
                        Rate
                    </td>
                    <td>
                        <input type="text"  name="rname" required="required" autocomplete="off" id="rname">
                    </td>
                </tr> 
      
                <tr>
                    
                    <td colspan="2" align="center">
                        
                             <input type="submit" id="user_save" name="btn_save"  value="Save">
                    </td>
                                      
                </tr>
            </table>
                        
         <table border="1" align="center">
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Item</th>
            <th>Type</th>
            <th>Rate</th>
            <th>Action</th>
            <th>Action2</th>
            
        </tr>
            <%
            String sel1="select * from tbl_gifts";
           ResultSet rs1=obj.selectCommand(sel1);
            while(rs1.next())
            {
            %>
           
        <tr>
            <td><img src="../Assets/GiftPhotos/<%=rs1.getString("gifts_photo")%>" width="150" height="150"></td>
            <td> <%=rs1.getString("gifts_name")%></td>
            <td><%=rs1.getString("gifts_item")%></td>
            <td><%=rs1.getString("gifttype_id")%></td>
            <td><%=rs1.getString("gifts_rate")%></td>
            <td><a href="GiftProducts.jsp?delid=<%=rs1.getString("gifts_id")%>">Delete</a>
            <td><a href="GiftGallery.jsp?gid=<%=rs1.getString("gifts_id")%>">Add Gallery</a>    
              
                
                
            </td>
        </tr>
        <%
           }
           %>
    </table>
         </body>  
                        
        </form>
   
</div>
</html>  

