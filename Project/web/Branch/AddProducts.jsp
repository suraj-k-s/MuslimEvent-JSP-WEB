<%-- 
    Document   : AddProducts
    Created on : 13 Feb, 2021, 10:51:39 AM
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
        <title>Add Product</title>
    </head>
     <%
        
             String productname="";
             String msg="";
             String delid="";
        
             productname=request.getParameter("txtproductname");
        
             delid=request.getParameter("delid");
             
             
             if(delid!=null)
             {
             
              String del="delete from tbl_products where product_id='"+delid+"'";
              boolean bol= obj.executeCommand(del);
          //    out.println(bol);
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
              <form enctype="multipart/form-data"  method="POST" action="ProductUploadAction.jsp">
                  
                 <table border="3" align="center" cellpadding="5">
                      
                        
                 <tr>
                    <td>
                       Category
                    </td>
                   
                    <td>
                        <select name="selproductcategory" onchange="getplace(this.value)">
                            <option>----select----</option>
                            <%
            String Sel="select*from tbl_productcategory";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
               
                <option value="<%=rs.getString("productcategory_id")%>"> <%=rs.getString("productcategory_name")%></option>
                <%
            }
            %>
                        </select>
                             
         
                    </td>
                </tr>
                 <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" id="uname" name="uname">
                    </td>
                </tr> 
                  
                
                 <tr>
                    <td>
                        Photo
                    </td>
                    <td>
                        <input type="file" id="file_photo" name="file_photo">
                    </td>
                </tr>
                 <tr>
                    <td>
                        Product Quantity
                    </td>
                    <td>
                        <input type="text" id="qname" name="qname">
                    </td>
                </tr> 
                 <tr>
                    <td>
                        Rate
                    </td>
                    <td>
                        <input type="text" id="rname" name="rname">
                    </td>
                </tr> 
      
                <tr>
                     <td colspan="2" align="center">
                        <input type="submit" id="user_save" name="btn_save" value="save">
                   
                        <input type="reset" id="user_cancel" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table>
                        
         <table border="2" align="center">
        <tr>
            <td>Name</td>
            <td>Quantity</td>
            <td>Rate</td>
            <td>Image</td>
            <td>Action</td>
            
        </tr>
            <%
            String sel1="select * from tbl_products where hpbranch_id='"+session.getAttribute("hid")+"'";
           ResultSet rs1=obj.selectCommand(sel1);
            while(rs1.next())
            {
            %>
           
        <tr>
            <td> <%=rs1.getString("product_name")%></td>
            <td><%=rs1.getString("Product_qty")%></td>
            <td><%=rs1.getString("product_rate")%></td>
            <td><img src="../Assets/ProductPhotos/<%=rs1.getString("product_photo")%>" width="150" height="150"></td>
            <td><a href="ProductStock.jsp?pid=<%=rs1.getString("product_id")%>"> Add Stock</a>
            </td>
        </tr>
        <%
           }
           %>
          
              </table>
            </form>
           </div> 
          
                </body>
        
             
  
</html>  

