<%-- 
    Document   : District
    Created on : 15 Jan, 2021, 10:48:26 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
 <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/htmlarset=UTF-8">
        <title>District</title>
         </head>
    <body>

 <%
            String delid="",edid="",editDisId="",editDisname="";
           
                   
                   
            if(request.getParameter("btn_save")!=null)
            {
              edid=request.getParameter("txtdid");
                if(edid.equals("")){
               
                    String InsQry="insert into tbl_district(District_name) values('"+request.getParameter("dname")+"')";
                boolean success=obj.executeCommand(InsQry);
                if(success)
                {
                    out.println("<script>alert('successfully inserted')</script>");
                }
                else
                {
                    out.println("<script>alert('failed to insert')</script>");
                   
                }
               
                }else{
                    String up="update tbl_district set District_name='"+request.getParameter("dname")+"' where District_id='"+edid+"'";
                    boolean success=obj.executeCommand(up);
                        if(success)
                            {
                                out.println("<script>alert('successfully Update')</script>");
                            }
                        else
                            {
                                out.println("<script>alert('failed to Update')</script>");
                   
                            }  
               
                 
            }
                // out.println(InsQry);
               
       }
       
        delid=request.getParameter("delid");      
            if(delid!=null)
            {
            String del="delete from tbl_district where District_id="+delid+"";
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
           
            
           
           
           
           
               
           
            edid=request.getParameter("edid");
            if(edid!=null){
           
                editDisId=edid;
                editDisname=request.getParameter("eddisname");
           
           
            }
            %>
<!DOCTYPE html>

    <div id="tab">
           
   
    <form id="form1" name="form1"method="post" action="">
       <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                        District Name
                    </td>
                    <td>
                        <input type="hidden" name="txtdid" id="dname" value="<%=editDisId %>">
                        <input type="text" name="dname" id="dname" value="<%=editDisname %>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" id="district_save" value="save">
                    
                       <input type="reset" name="btn_CANCEL" id="district_cancel" value="cancel">
                   </td>
                </tr>
            </table>
        </form>
                    <br>
                    <br>
    <table border="2" align="center">
        <tr>
            <th> District</th>
             <th> Action</th>
        </tr>
       
            <%
            String Sel="select*from tbl_district";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
        <tr>
            <td> <%=rs.getString("District_name")%></td>
            
            <td><a href="District.jsp?delid=<%=rs.getString("District_id")%>">Delete</a> | <a href="District.jsp?edid=<%=rs.getString("District_id")%>&eddisname=<%=rs.getString("District_name")%>">Edit</a></td>
           
        </tr>
        <%
            }
            %>
           
       
    </table>
    </div>  
</html>


