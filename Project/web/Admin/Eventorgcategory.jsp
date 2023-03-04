<%-- 
    Document   : Eventorganization
    Created on : 16 Jan, 2021, 2:58:58 PM
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

        <title>Event Organization Category</title>

    </head>

    <body>

             <%
            String eventorgcat_name="",delid="",edid="",editcatId="",editcatname="";
           
                   
                   
            if(request.getParameter("btn_save")!=null)
            {
              edid=request.getParameter("txtdid");
                if(edid.equals(""))
                {
               
                    String InsQry="insert into tbl_eventorgcat(eventorgcat_name) values('"+request.getParameter("dname")+"')";
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
                    String up="update tbl_eventorgcat set eventtworkcat_name='"+request.getParameter("dname")+"' where eventorgcat_id='"+edid+"'";
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
            String del="delete from tbl_eventorgcat where eventorgcat_id="+delid+"";
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
                       Event Organization Name
                    </td>
                    <td> <input type="hidden" name="txtdid" id="dname" value="<%=editcatId %>">
                        <input type="text" name="dname" id="dname"required="required" autocomplete="off" value="<%=editcatname %>">
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
            <th> Event organization</th>
            <th>Action</th>
            
        </tr>
       
              <%
            String Sel="select*from tbl_eventorgcat";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
        <tr>
            <td> <%=rs.getString("eventorgcat_name")%>
            </td>
            <td><a href="Eventorgcategory.jsp?delid=<%=rs.getString("eventorgcat_id")%>">Delete</a> | <a href="Eventorgcategory.jsp?edid=<%=rs.getString("eventorgcat_id")%>&edcatname=<%=rs.getString("eventorgcat_name")%>">Edit</a></td>
            
           
           
        </tr>
        <%
            }
            %>
    
    </table>
    </div>
    </html>

