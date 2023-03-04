<%-- 
    Document   : Place
    Created on : 15 Jan, 2021, 10:48:42 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
 <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <body>
        <%
       String Place_Id="",District_Id="",Place_Name="",delid="";
       if(request.getParameter("btn_save")!=null)
       {
          
           
           String InsQry="insert into tbl_place(District_id,Place_name) values('"+request.getParameter("seldistrict")+"','"+request.getParameter("txtplacename")+"')";
           
           
                boolean success=obj.executeCommand(InsQry);
                if(success)
                {
                    out.println("<script>alert('successfully inserted')</script>");
                }
                else
                {
                    out.println("<script>alert('failed to insert')</script>");
                   
                }
               // out.println(InsQry);
               
       }
       
        delid=request.getParameter("delid");      
            if(delid!=null)
            {
            String del="delete from tbl_place where Place_id="+delid+"";
            boolean bol=obj.executeCommand(del);
            if(bol==true)
            {
            out.println("<script>alert('Record delete')</script>");
            }
            else
            {
            out.println(del);
            }
            }
           
       
       %>
<!DOCTYPE html>
    <div id="tab">
      <form id="form2" name="form2" method="post" action="">
            <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                       District Name
                    </td>
                   
                    <td>
                        <select name="seldistrict">
                            <option>----select-----</option>
                           
                             <%
            String Sel="select*from tbl_District";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
               
                <option value="<%=rs.getString("District_id")%>"> <%=rs.getString("District_name")%></option>
                <%
            }
            %>
           
                        </select>
                       
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" id="Place_name" name="txtplacename"></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" id="Place_save" name="btn_save" value="save">
                   
                        <input type="reset" id="Place_cancel" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
            <br>
            <br>
    <table border="2" align="center" cellpadding="5">
        <tr>
            <th> District </th>
            <th> Place </th>
            <th> Action </th>
        </tr>
            <%
            String sel1="select * from tbl_Place p inner join tbl_District d on d.district_id=p.district_id";
           ResultSet rs1=obj.selectCommand(sel1);
            while(rs1.next())
            {
                %>
           
        <tr>
            <td> <%=rs1.getString("district_name")%></td>
            <td>
                <%=rs1.getString("Place_name")%>
               
            </td>
            <td><a href="Place.jsp?delid=<%=rs1.getString("place_id")%>"> Delete</a>
            </td>
        </tr>
        <%
           }
           %>
    </table>
           
           
           
    </div>
      </body>
</html>

