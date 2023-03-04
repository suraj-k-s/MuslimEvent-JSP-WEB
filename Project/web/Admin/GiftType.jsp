<%-- 
    Document   : GiftType
    Created on : 10 Mar, 2021, 7:53:49 PM
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
        <title>Gift Type</title>
    </head>
    <body>
        <%
            String gifttype_name="",delid="",edid="",editgifttypeId="",editgifttypename="";;
           
                     
            if(request.getParameter("btn_save")!=null)
            {
              
                  edid=request.getParameter("txtdid");
                    if(edid.equals(""))
                {
               
               
                    String InsQry="insert into tbl_gifttype(gifttype_name) values('"+request.getParameter("dname")+"')";
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
            
                    String up="update tbl_gifttype set gifttype_name='"+request.getParameter("dname")+"' where gifttype_id='"+edid+"'";
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
           String del="delete from tbl_gifttype where gifttype_id="+delid+"";
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
           
                editgifttypeId=edid;
                editgifttypename=request.getParameter("edgifttypename");
            }
           %>
            
             <!DOCTYPE html>
   
       <div id="tab">
          <form id="form1" name="form1" method="post" action="">
                <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                       Gift Type 
                    </td>
                    <td> <input type="hidden" name="txttype" required="required" autocomplete="off" id="txttype" value="<%=editgifttypeId %>">
                        <input type="text" name="dname" id="dname" required="required" autocomplete="off" value="<%=editgifttypename %>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" id="gifttype_save" name="btn_save" value="Save">
                   
                        <input type="reset" id="gifttype_cancel" name="btn_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <br>
    <br>
     <table border="2" align="center">
        <tr>
            <th> Gift </th>
            <th> Action </th>
        </tr>
       
              <%
            String Sel="select*from tbl_gifttype";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
        <tr>
            <td> <%=rs.getString("gifttype_name")%>
            </td>
            <td><a href="GiftType.jsp?delid=<%=rs.getString("gifttype_id")%>">Delete</a> | <a href="GiftType.jsp?edid=<%=rs.getString("gifttype_id")%>&edgifttypename=<%=rs.getString("gifttype_name")%>">Edit</a></td>
            
           
           
        </tr>
        <%
            }
            %>
    
    </table>
    </div>
    </html>



