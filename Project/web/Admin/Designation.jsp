<%-- 
    Document   : Designation
    Created on : 16 Jan, 2021, 3:19:08 PM
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

        <title>Designation</title>

    </head>

    <body>
         <%
            String designation_name="",delid="",edid="",editdesgnId="",editdesgnname="";
           
                   
                   
            if(request.getParameter("btn_save")!=null)
            {
              edid=request.getParameter("txtdid");
                if(edid.equals(""))
                {
               
                    String InsQry="insert into tbl_designation(designation_name) values('"+request.getParameter("dname")+"')";
                boolean success=obj.executeCommand(InsQry);
                if(success)
                {
                    out.println("<script>alert('successfully inserted')</script>");
                }
                else
                {
                    out.println("<script>alert('failed to insert')</script>");
                   
                }
               
                }
                else
                {
                    String up="update tbl_designation set designation_name='"+request.getParameter("dname")+"' where designation_id='"+edid+"'";
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
            }
            
              delid=request.getParameter("delid");      
            if(delid!=null)
            {
            String del="delete from tbl_designation where designation_id="+delid+"";
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
           
                editdesgnId=edid;
                editdesgnname=request.getParameter("eddesgnname");
           
           
            }
           
           
            %>
            
            
            <!DOCTYPE html>
    <div id="tab">
   
            <form id="form1" name="form1" method="post" action="">
                
                <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                       Designation Name
                    </td>
                    <td> <input type="hidden" name="txtdid" required="required" autocomplete="off" id="dname" value="<%=editdesgnId %>">
                        <input type="text" name="dname" id="dname"required="required" autocomplete="off" value="<%=editdesgnname %>">
                    </td>
                       
                       
                   
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" id="designation_save" name="btn_save"  value="save">
                   
                    
                        <input type="reset" id="designation_cancel" name="btn_cancel"   value="cancel">
                    </td>
                </tr>
            </table>
        </form>
                    <br>
                    <br>
     <table border="2" align="center">
        <tr>
            <th> Designation</th>
            <th>Action</th>
        </tr>
       
              <%
            String Sel="select*from tbl_designation";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
        <tr>
            <td> <%=rs.getString("designation_name")%>
            </td>
            <td><a href="Designation.jsp?delid=<%=rs.getString("designation_id")%>">Delete</a>| <a href="Designation.jsp?edid=<%=rs.getString("designation_id")%>&edcatname=<%=rs.getString("designation_name")%>">Edit</a></td>
           
           
           
        </tr>
        <%
            }
            %>
    
    </table>
            </body>
    </div>
    </html>


