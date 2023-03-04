<%-- 
    Document   : ViewProductOrders
    Created on : 27 Mar, 2021, 12:06:09 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Product Order </title>
       
    </head>
    <body>
        
         <%
            String productbook="",deliveryStatus="";
            if(request.getParameter("pbid")!=null)
            {
              productbook=request.getParameter("txtproductbook");
              String up="Update tbl_productbook set pb_vstatus=1 where pb_id='"+request.getParameter("pbid")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewProductOrders.jsp");
                      }
       
            %>
             <%
            
            String pbook="";
            if(request.getParameter("pbid1")!=null)
            {
              pbook=request.getParameter("txtpbook");
              String up="Update tbl_productbook set pb_cstatus=1 where pb_id='"+request.getParameter("pbid1")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewProductOrders.jsp");
                      }
       
            %>
            
            
            
            <div id="tab">

            <form id="form1" name="form1" method="post" action="">
        <h3 align="center">Customer Product Order(Non Verified)</h3>
        <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Ordered Product</td>
                <td>Count</td>
                <td>Total Rate</td>
                <td>Date</td>
                <td>Action</td>
            </tr>
            <%

                int i = 0;
                
                String Sel = "select * from tbl_productbook o inner join tbl_products p on o.product_id=p.Product_id where o.pb_vstatus='0' and p.hpbranch_id='"+session.getAttribute("hid")+"'";
                ResultSet rs = obj.selectCommand(Sel);
//                out.print(Sel);
                while (rs.next())
                {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("product_name")%></td>
                <td><%=rs.getString("product_count")%></td>
                <td><%=rs.getString("product_trate")%></td>
                <td><%=rs.getString("pb_orderdate")%></td>
                
                <td><a href="ViewProductOrders.jsp?pbid=<%=rs.getString("pb_id")%>">Verify</a></td>
            </tr>
            <%
                }

            %>
        </table>
        <h3 align="center">Delivery Verification</h3>
       <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Ordered Product</td>
                <td>Count</td>
                <td>Total Rate</td>
                <td>Date</td>
                <td>Action</td>
            </tr>
            <%

                int i1 = 0;
               
                
                String Sel1 = "select * from tbl_productbook o inner join tbl_products p on o.product_id=p.Product_id where o.pb_vstatus='1'  and p.hpbranch_id='"+session.getAttribute("hid")+"'";
                ResultSet rs1 = obj.selectCommand(Sel1);
//                out.print(Sel1);
                while (rs1.next())
                {
                    i1++;
                     deliveryStatus=rs1.getString("pb_cstatus");

            %>
            <tr>
                <td><%=i1%></td>
                <td><%=rs1.getString("product_name")%></td>
                <td><%=rs1.getString("product_count")%></td>
                <td><%=rs1.getString("product_trate")%></td>
                <td><%=rs1.getString("pb_orderdate")%></td>
                <%
                    if(deliveryStatus.equals("0")){
                        
                %>
                
                <td><a href="ViewProductOrders.jsp?pbid1=<%=rs1.getString("pb_id")%>">Delivery</a></td>
                
                <% 
                    }else
                    {
                %>
                <td>Delivered</td>
            </tr>
            <%
                    }
                }

            %>
        </table>
            </div>
    </body>
            </form>
</html>