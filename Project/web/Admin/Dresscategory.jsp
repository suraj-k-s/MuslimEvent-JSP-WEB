<%-- 
    Document   : Dresscategory
    Created on : 16 Jan, 2021, 3:11:31 PM
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

        <title>Dress Category</title>

    </head>

    <body>

             <%
            String dresscategory_name="",delid="",edid="",editcatId="",editcatname="";
           
                   
                   
            if(request.getParameter("btn_save")!=null)
            {
              edid=request.getParameter("txtdid");
                if(edid.equals(""))
                {
               
                    String InsQry="insert into tbl_dresscategory(dresscategory_name) values('"+request.getParameter("dname")+"')";
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
                    String up="update tbl_dresscategory set dresscategory_name='"+request.getParameter("dname")+"' where dresscategory_id='"+edid+"'";
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
            String del="delete from tbl_dresscategory where dresscategory_id="+delid+"";
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
                       Dress Category Name
                    </td>
                    <td> <input type="hidden" name="txtdid" id="dname"  required="required" autocomplete="off" value="<%=editcatId %>">
                        <input type="text" name="dname" id="dname"  required="required" autocomplete="off" value="<%=editcatname %>">
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
            
            <th> Dress category</th>
            <th> Action </th>
        </tr>
       
              <%
            String Sel="select*from tbl_dresscategory";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
        <tr>
            <td> <%=rs.getString("dresscategory_name")%>
            </td>
            <td><a href="DressCategory.jsp?delid=<%=rs.getString("dresscategory_id")%>">Delete</a> | <a href="DressCategory.jsp?edid=<%=rs.getString("dresscategory_id")%>&edcatname=<%=rs.getString("dresscategory_name")%>">Edit</a></td>
            
           
           
        </tr>
        <%
            }
            %>
    
    </table>
    </div>
    </html>

