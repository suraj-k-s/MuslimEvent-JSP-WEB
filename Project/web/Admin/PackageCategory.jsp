<%-- 
    Document   : PackageCategory
    Created on : 9 Mar, 2021, 10:13:14 PM
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

        <title>Package Category</title>

    </head>

    <body>

             <%
            String packagecategory_name="",delid="",edid="",editcatId="",editcatname="";
           
                   
                   
            if(request.getParameter("btn_save")!=null)
            {
              edid=request.getParameter("txtdid");
                if(edid.equals(""))
                {
               
                    String InsQry="insert into tbl_packagecategory(packagecat_name) values('"+request.getParameter("dname")+"')";
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
                    String up="update tbl_packagecategory set packagecat_name='"+request.getParameter("dname")+"' where packagecat_id='"+edid+"'";
                    boolean success=obj.executeCommand(up);
                        if(success)
                            {
                                out.println("<script>alert('Successfully Update')</script>");
                            }
                        else
                            {
                                out.println("<script>alert('Failed to Update')</script>");
                   
                            }  
               
                 
            }
            }
           
           
           
           
                delid=request.getParameter("delid");      
            if(delid!=null)
            {
            String del="delete from tbl_packagecategory where packagecat_id="+delid+"";
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
           
                editcatId=edid;
                editcatname=request.getParameter("edcatname");
           
           
            }
           
           
            %>
<!DOCTYPE html>
   
   
   
   
         <div id="tab">
            <form id="form1" name="form1" method="post" action="">
                <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                       Package Category Name
                    </td>
                    <td> <input type="hidden" name="txtdid" id="dname" value="<%=editcatId %>">
                        <input type="text" name="dname" id="dname" required="required" autocomplete="off" value="<%=editcatname %>">
                    </td>
                       
                       
                   
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" id="category_save" name="btn_save" value="save">
                   
                        <input type="reset" id="category_cancel" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <br>
    <br>
     <table border="2" align="center">
        <tr>
            <th>SI.NO</th>
            <th> Package category </th>
            <th> Action </th>
            
        </tr>
       
              <%
            String Sel="select*from tbl_packagecategory";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
        <tr>
             <td> <%=rs.getString("packagecat_id")%>
            <td> <%=rs.getString("packagecat_name")%>
            </td>
            <td><a href="PackageCategory.jsp?delid=<%=rs.getString("packagecat_id")%>">Delete</a> | <a href="PackageCategory.jsp?edid=<%=rs.getString("packagecat_id")%>&edcatname=<%=rs.getString("packagecat_name")%>">Edit</a></td>
          
           
           
        </tr>
        <%
            }
            %>
    
    </table>
    </div>
    </html>


