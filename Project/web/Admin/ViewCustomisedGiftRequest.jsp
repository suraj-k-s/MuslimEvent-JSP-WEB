<%-- 
    Document   : ViewCustomisedGiftRequest
    Created on : 27 Mar, 2021, 8:14:26 PM
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
        <title> Customized Gift Request </title>
       
    </head>
    <body>
        
         <%
            String giftrequest="",verifyStatus="";
            if(request.getParameter("btnadd")!=null)
            {
//              giftrequest=request.getParameter("txtgiftrequest");
               
              String up="Update tbl_giftrequest set gr_rate='"+request.getParameter("txtrate")+"' where gr_id='"+request.getParameter("txthid")+"'";
              System.out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewCustomisedGiftRequest.jsp");
                      }
                if(request.getParameter("gridv")!=null)
            {
//              giftrequest=request.getParameter("txtgiftrequest");
              String up="Update tbl_giftrequest set gr_vstatus=1 where gr_id='"+request.getParameter("gridv")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewCustomisedGiftRequest.jsp");
                      }
       
            %>
             <%
            
            String grequest="";
            if(request.getParameter("grid1")!=null)
            {
              grequest=request.getParameter("txtgrequest");
              String up="Update tbl_giftrequest set gr_cstatus=1 where gr_id='"+request.getParameter("grid1")+"'";
              out.println(up);
              obj.executeCommand(up);
               out.println("<script>alert('Update Successfully!!')</script>");
               response.sendRedirect("ViewCustomisedGiftRequest.jsp");
                      }
       
            %>
            
            <div id="tab">
        <h3 align="center">Customized Gift Request(Non Verified)</h3>
        <table border="3" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                         <th>SI.NO</th>
                         <th>Gift Type</th>
                         <th>Feature</th>
                         <th>Items</th>
                         <th>Request Date</th>
                         <th>Rate</th>
                         <th>Action</th>
            </tr>
            <%

                int i = 0;
                
                 String Sel = "select * from tbl_giftrequest g inner join tbl_gifttype p on g.gifttype_id=p.gifttype_id where g.gr_vstatus='0'"; 
                ResultSet rs = obj.selectCommand(Sel);
 //               out.print(Sel);
                while (rs.next())
                {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("gifttype_name")%></td>
                <td><%=rs.getString("gr_feature")%></td>
                <td><%=rs.getString("gr_items")%></td>
                <td><%=rs.getString("gr_requestdate")%></td>
<!--                 <td><input type="text" name="txtrate"></td>-->     
                <td><a href="ViewCustomisedGiftRequest.jsp?grid=<%=rs.getString("gr_id")%>">Add Rate</a></td>
                <td><a href="ViewCustomisedGiftRequest.jsp?gridv=<%=rs.getString("gr_id")%>">Verify</a></td>
            </tr>
            <%
                }

            %>
        </table>
          </form>
        <%  if(request.getParameter("grid")!=null)
            {
                %>
            
                <form><input type="hidden" name="txthid" value="<%=request.getParameter("grid") %>">
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
        <h3 align="center">Customized Gift Request(Verified)</h3>
       <table border="2" align="center" style="border-collapse:collapse;" cellpadding="7">
           
                      <tr>
                         <th>SI.NO</th>
                         <th>Gift Type</th>
                         <th>Feature</th>
                         <th>Items</th>
                         <th>Request Date</th>
                         <th>Rate</th>
                         <th>Action</th>
                      </tr>
            <%

                int i1 = 0;
               
                
                String Sel1 = "select * from tbl_giftrequest g inner join tbl_gifttype p on g.gifttype_id=p.gifttype_id where g.gr_vstatus='1'"; 
                ResultSet rs1 = obj.selectCommand(Sel1);
 //               out.print(Sel1);
                while (rs1.next())
                {
                    i1++;
                     verifyStatus=rs1.getString("gr_cstatus");

            %>
            <tr>
               <td><%=i1%></td>
                <td><%=rs1.getString("gifttype_name")%></td>
                <td><%=rs1.getString("gr_feature")%></td>
                <td><%=rs1.getString("gr_items")%></td>
                <td><%=rs1.getString("gr_requestdate")%></td>
                <td><%=rs1.getString("gr_rate")%></td>
                <%
                    if(verifyStatus.equals("0")){
                        
                %>
                
                <td><a href="ViewCustomisedGiftRequest.jsp?grid1=<%=rs1.getString("gr_id")%>">Verified</a></td>
                
                <% 
                    }else
                    {
                %>
                <td>Verified</td>
            </tr>
            <%
                    }
                }

            %>
        </table>
    </body>
</div>
</html>