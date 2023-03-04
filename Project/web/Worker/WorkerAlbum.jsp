<%-- 
    Document   : WorkerGallerys.jsp
    Created on : 13 Feb, 2021, 3:29:23 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
   <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Work Album</title>

    </head>
   
        <%
            String watitle="";
            String description="";
            String other="";
            String msg="",waid="",eventworkerid="",date="";
            
            if(request.getParameter("btnsubmit")!=null)
            {
                watitle=request.getParameter("txttitle");
                description=request.getParameter("txtdescription");
                date=request.getParameter("txtdate");
                other=request.getParameter("txtother");
                
                if(request.getParameter("hdid").equals(""))
                {
                
                
            String ins="insert into tbl_workeralbum(wa_title,wa_description,wa_date,wa_other,eventworker_id) values('"+ watitle +"','"+ description +"','"+ date +"','"+ other +"','"+ session.getAttribute("wid") +"')"; 
            //out.println(ins);
             boolean bol=obj.executeCommand(ins);
             if(bol==true)
             {
                 msg="record inserted";
                 
             }
             
                 else
             {
             msg="";
             out.println(ins);
             }
             
             
                }

            
            }
       
            %>
            <body>
        
              <form  method="POST">
                  <input type="hidden" name="hdid" id="hdid" value="<%= waid%>">
                 <table border="2" align="center" cellpadding="5">
                      
                
                   
                     <tr> 
                    
                        <td>Title</td>
                        <td><input type="text" name="txttitle" id="txttitle"></td>
      
                     </tr> 
                
                     <tr>  
                        
                        <td>Description</td>
                        <td><textarea id="txtdescription" name="txtdescription"></textarea></td>
                    
                     </tr>              
                     <tr>
                    
                        <td>Date</td>
                        <td><input type="date" id="txtdate" name="txtdate"></td>
                     
                     </tr>
                
                     <tr>
                      
                        <td>Other</td>
                        <td><input type="text" id="txtother" name="txtother"></td>
                        
                     </tr> 
               
                     
                     <tr>   
                        <td colspan="2" align="center">
                        <input type="submit" id="btnsubmit" name="btnsubmit" value="Set Album"> </td>
                     </tr>
                     <tr>
                         
                        <td colspan="2" align="center"></td>
                        
                     </tr>
            </table>
        </form>
                <br>
                <br>
                <br>
                <br>
                <table border="2" align="center" cellpadding="5">
                    <tr>
                        <td>SI.NO</td>
                         <td>Title</td>
                          <td>Description</td>
                           <td>Date</td>
                            <td>Other</td>
                             <td>Action</td>
                    </tr>
                    <%
                    
                        int i=0;
                        String sel="select * from tbl_workeralbum where eventworker_id='"+session.getAttribute("wid")+"'";
                        ResultSet rs=obj.selectCommand(sel);
                        while (rs.next())
                        {
                            i++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("wa_title")%></td>
                        <td><%=rs.getString("wa_description")%></td>
                        <td><%=rs.getString("wa_date")%></td>
                        <td><%=rs.getString("wa_other")%></td>
                          <td><a href="AlbumMedia.jsp?albumid=<%=rs.getString("wa_id")%>">Set Media</a></td>
                        
                    </tr>   
                    <%
                            
                        }
         
                    
                    %>
        </table>
    </body>
</html>  
