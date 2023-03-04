<%-- 
    Document   : ViewCustomizedDressRequest
    Created on : 4 Apr, 2021, 1:32:02 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Customized Dress Request </title>
       
    </head>
    <body>
        
         <%
            String dressrequest="",deliveryStatus="";
            if(request.getParameter("btnadd")!=null)
            {
              //dressrequest=request.getParameter("txtdressrequest");
              String up="Update tbl_dressrequest set dr_rate='"+request.getParameter("txtrate")+"' where dr_id='"+request.getParameter("txthid")+"'";
              System.out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewCustomizedDressRequest.jsp");
                      }
             if(request.getParameter("dridv")!=null)
            {
              //dressrequest=request.getParameter("txtdressrequest");
              String up="Update tbl_dressrequest set dr_vstatus=1 where dr_id='"+request.getParameter("dridv")+"'";
              System.out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewCustomizedDressRequest.jsp");
                      }
       
            %>
             <%
            
            String drequest="";
            if(request.getParameter("drid1")!=null)
            {
              drequest=request.getParameter("txtdrequest");
              String up="Update tbl_dressrequest set dr_cstatus=1  where dr_id='"+request.getParameter("drid1")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewCustomizedDressRequest.jsp");
                      }
       
            %>
            
            
        <h3 align="center">Customized Dress Request(Non Verified)</h3>
        <form method="post">
        <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
               <td>SI.NO</td>
                <td>Dress Type</td>
                <td>Feature</td>
                <td>Items</td>
                <td>Size</td>
                <td>Require Date</td>
                <td>Rate</td>
                <td>Action</td>
            </tr>
            <%

                int i = 0;
                
                String Sel = "select * from tbl_dressrequest o inner join tbl_dresscategory p on o.dresscategory_id=p.dresscategory_id where o.dr_vstatus='0' and o.eventworker_id='"+session.getAttribute("wid")+"'";
                ResultSet rs = obj.selectCommand(Sel);
 //               out.print(Sel);
                while (rs.next())
                {
                    i++;

            %>
            <tr>
                 <td><%=i%></td>
                <td><%=rs.getString("dresscategory_name")%></td>
                <td><%=rs.getString("dr_feature")%></td>
                <td><%=rs.getString("dr_material")%></td>
                 <td><%=rs.getString("dr_size")%></td>
                 <td><%=rs.getString("dr_requiredate")%></td>
<!--                 <td><input type="text" name="txtrate"></td>-->
                 <td><a href="ViewCustomizedDressRequest.jsp?drid=<%=rs.getString("dr_id")%>">Add Rate</a></td>
                <td><a href="ViewCustomizedDressRequest.jsp?dridv=<%=rs.getString("dr_id")%>">Verify</a></td>
            </tr>
            <%
                }

            %>
        </table>
        </form>
        <%  if(request.getParameter("drid")!=null)
            {
                %>
            
                <form><input type="hidden" name="txthid" value="<%=request.getParameter("drid") %>">
            <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
                <tr>
                    <td>Rate</td><td><input type="text" name="txtrate"></td>
                </tr>
                 <tr>
                     <td colspan="2"><input type="submit" name="btnadd" value="Add"></td>
                </tr>
            </table>
        </form>
                <% } %>
        <h3 align="center">Delivery Verification</h3>
       <table border="1" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Dress Type</td>
                <td>Feature</td>
                <td>Items</td>
                <td>Size</td>
                <td>Require Date</td>
                <td>Rate</td>
                <td>Action</td>
            </tr>
            <%

                int i1 = 0;
               
                
                String Sel1 = "select * from tbl_dressrequest o inner join tbl_dresscategory p on o.dresscategory_id = p.dresscategory_id where o.dr_vstatus='1'  and o.eventworker_id='"+session.getAttribute("wid")+"'";
                ResultSet rs1 = obj.selectCommand(Sel1);
 //              out.print(Sel1);
                while (rs1.next())
                {
                    i1++;
                     deliveryStatus=rs1.getString("dr_cstatus");

            %>
            <tr>
                <td><%=i1%></td>
                <td><%=rs1.getString("dresscategory_name")%></td>
                <td><%=rs1.getString("dr_feature")%></td>
                <td><%=rs1.getString("dr_material")%></td>
                 <td><%=rs1.getString("dr_size")%></td>
                 <td><%=rs1.getString("dr_requiredate")%></td>
                 <td><%=rs1.getString("dr_rate")%></td>
                <%
                    if(deliveryStatus.equals("0")){
                        
                %>
                
                <td><a href="ViewCustomizedDressRequest.jsp?drid1=<%=rs1.getString("dr_id")%>">Verified</a></td>
                
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
</html>