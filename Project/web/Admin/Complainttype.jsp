<%-- 
    Document   : Type
    Created on : 15 Jan, 2021, 2:03:48 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="tem.jsp" %>
         
        <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Type</title>
    </head>
    <body>
        <%
            String complainttype_name="",delid="",edid="",editcomplainttypeId="",editcomplainttypename="";;
           
                     
            if(request.getParameter("btn_save")!=null)
            {
              
                  edid=request.getParameter("txtdid");
                    if(edid.equals(""))
                {
               
               
                    String InsQry="insert into tbl_complainttype(complainttype_name) values('"+request.getParameter("dname")+"')";
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
            
                    String up="update tbl_complainttype set complainttype_name='"+request.getParameter("dname")+"' where complainttype_id='"+edid+"'";
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
           String del="delete from tbl_complainttype where complainttype_id="+delid+"";
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
           
                editcomplainttypeId=edid;
                editcomplainttypename=request.getParameter("edcomplainttypename");
            }
           %>
            
             <!DOCTYPE html>
   
       <div id="tab">
          <form id="form1" name="form1" method="post" action="">
                <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                       Complaint Type 
                    </td>
                    <td> <input type="hidden" name="txtdid" required="required" id="dname" value="<%=editcomplainttypeId %>">
                        <input type="text" name="dname" id="dname" value="<%=editcomplainttypename %>">
                    </td>
                       
                       
                   
                </tr>
                <tr>
                     <td colspan="2" align="center">
                        <input type="submit" id="complainttype_save" name="btn_save" value="save">
                    
                        <input type="reset" id="complainttype_cancel" name="btn_cancel" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
                    <br>
                    <br>
                    
    </body>
     <table border="2" align="center">
        <tr>
            <th> Complaint </th>
            <th>Action</th>
           

        </tr>
              <%
            String Sel="select*from tbl_complainttype";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
                <tr>
                    
                    <td> <%=rs.getString("Complainttype_name")%></td>
                 <td><a href="Complainttype.jsp?delid=<%=rs.getString("complainttype_id")%>">Delete</a> | <a href="Complainttype.jsp?edid=<%=rs.getString("complainttype_id")%>&edcomplainttypename=<%=rs.getString("complainttype_name")%>">Edit</a></td>
\
           
           
      </tr>
        <%
            }
            %>
    
    </table>
             </div>
    </body>
    </html>



