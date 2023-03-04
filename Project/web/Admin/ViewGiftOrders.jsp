<%-- 
    Document   : ViewGiftOrders
    Created on : 27 Mar, 2021, 2:59:34 PM
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
        <title> Gift Order </title>
       
    </head>
    <body>
        
         <%
            String giftbook="",deliveryStatus="";
            if(request.getParameter("gbid")!=null)
            {
              giftbook=request.getParameter("txtgiftbook");
              String up="Update tbl_giftbook set gb_vstatus=1 where gb_id='"+request.getParameter("gbid")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewGiftOrders.jsp");
                      }
       
            %>
             <%
            
            String gbook="";
            if(request.getParameter("gbid1")!=null)
            {
              gbook=request.getParameter("txtgbook");
              String up="Update tbl_giftbook set gb_cstatus=1 where gb_id='"+request.getParameter("gbid1")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewGiftOrders.jsp");
                      }
       
            %>
            
            <div id="tab">
        <h3 align="center">Customer Gift Order(Non Verified)</h3>
        <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Ordered Gift</td>
                <td>Count</td>
                <td>Total Rate</td>
                <td>Date</td>
                <td>Action</td>
            </tr>
            <%

                int i = 0;
                
                String Sel = "select * from tbl_giftbook o inner join tbl_gifts p on o.gifts_id=p.gifts_id where o.gb_vstatus='0'";
                ResultSet rs = obj.selectCommand(Sel);
//                out.print(Sel);
                while (rs.next())
                {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("gifts_name")%></td>
                <td><%=rs.getString("gift_count")%></td>
                <td><%=rs.getString("gift_trate")%></td>
                <td><%=rs.getString("gb_orderdate")%></td>
                
                <td><a href="ViewGiftOrders.jsp?gbid=<%=rs.getString("gb_id")%>">Verify</a></td>
            </tr>
            <%
                }

            %>
        </table>
        <h3 align="center">Delivery Verification</h3>
       <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Ordered Gift</td>
                <td>Count</td>
                <td>Total Rate</td>
                <td>Date</td>
                <td>Action</td>
            </tr>
            <%

                int i1 = 0;
               
                
                String Sel1 = "select * from tbl_giftbook o inner join tbl_gifts p on o.gifts_id=p.gifts_id where o.gb_vstatus='1'";
                ResultSet rs1 = obj.selectCommand(Sel1);
//                out.print(Sel1);
                while (rs1.next())
                {
                    i1++;
                     deliveryStatus=rs1.getString("gb_cstatus");

            %>
            <tr>
                <td><%=i1%></td>
                <td><%=rs1.getString("gifts_name")%></td>
                <td><%=rs1.getString("gift_count")%></td>
                <td><%=rs1.getString("gift_trate")%></td>
                <td><%=rs1.getString("gb_orderdate")%></td>
                <%
                    if(deliveryStatus.equals("0")){
                        
                %>
                
                <td><a href="ViewGiftOrders.jsp?gbid1=<%=rs1.getString("gb_id")%>">Delivery</a></td>
                
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
    </body>
   </div>
</html>