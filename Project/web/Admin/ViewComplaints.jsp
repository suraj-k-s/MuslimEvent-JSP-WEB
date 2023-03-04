<%-- 
    Document   : ViewUserComplaints
    Created on : 8 Mar, 2021, 2:22:19 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
 <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
     
     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="tem.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaint Forum</title>
    </head>
    <body>
        <div id="tab">
        <h3 align="center">Event Organization Complaints</h3>
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Non Verified</th>
            </tr>   
            <tr>
                <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
           <%
                    
                        int i=0;
                        String sel="select * from tbl_complaints c inner join tbl_eventorg cf on c.eventorg_id=cf.eventorg_id where complaint_replystatus='0'";
                        ResultSet rs=obj.selectCommand(sel);
                        while (rs.next())
                        {
                            i++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs.getString("eventorg_name")%></td>
                        
                        <td><%=rs.getString("eventorg_contact")%></td>
                        
                        <td><%=rs.getString("complaint_content")%></td>
                        
                        <td><%=rs.getString("complaint_date")%></td>
                        
                        <td><%=rs.getString("complaint_data")%></td>
                        
                        <td><a href="Reply.jsp?cid=<%=rs.getString("complaint_id")%>">Reply</a></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
        <br>
        <br>
        <br>
        
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Verified</th>
            </tr> 
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
            <%
                    
                        int i1=0;
                        String sel1="select * from tbl_complaints c inner join tbl_eventorg cf on c.eventorg_id=cf.eventorg_id where complaint_replystatus='1'";
                        ResultSet rs1=obj.selectCommand(sel1);
                        while (rs1.next())
                        {
                            i++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs1.getString("eventorg_name")%></td>
                        
                        <td><%=rs1.getString("eventorg_contact")%></td>
                        
                        <td><%=rs1.getString("complaint_content")%></td>
                        
                        <td><%=rs1.getString("complaint_date")%></td>
                        
                        <td><%=rs1.getString("complaint_data")%></td>
                        
                        <td><%=rs1.getString("complaint_reply")%></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
        
        
        <hr>
        <br>
        <br>
        <br>
        <br>
        
        <h3 align="center">Event Workers Complaints</h3>
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center"colspan="7">Non Verified</th>
            </tr>   
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
           <%
                    
                        int j=0;
                        String sel2="select * from tbl_complaints c inner join tbl_eventworkers cf on c.eventworker_id=cf.eventworker_id where complaint_replystatus='0'";
                        ResultSet rs2=obj.selectCommand(sel2);
                        while (rs2.next())
                        {
                            j++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs2.getString("eventworker_name")%></td>
                        
                        <td><%=rs2.getString("eventworker_contact")%></td>
                        
                        <td><%=rs2.getString("complaint_content")%></td>
                        
                        <td><%=rs2.getString("complaint_date")%></td>
                        
                        <td><%=rs2.getString("complaint_data")%></td>
                        
                        <td><a href="Reply.jsp?cid=<%=rs2.getString("complaint_id")%>">Reply</a></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
        
        <br>
        <br>
        <br>
        
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Verified</th>
            </tr> 
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
            <%
                    
                        int j21=0;
                         String sel21="select * from tbl_complaints c inner join tbl_eventworkers cf on c.eventworker_id=cf.eventworker_id where complaint_replystatus='1'";
                        ResultSet rs21=obj.selectCommand(sel21);
                        while (rs21.next())
                        {
                            j21++;
                            
                    %>
                  <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs21.getString("eventworker_name")%></td>
                        
                        <td><%=rs21.getString("eventworker_contact")%></td>
                        
                        <td><%=rs21.getString("complaint_content")%></td>
                        
                        <td><%=rs21.getString("complaint_date")%></td>
                        
                        <td><%=rs21.getString("complaint_data")%></td>
                        
                        <td><%=rs21.getString("complaint_reply")%></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
        <hr>
        
        <br>
        <br>
        <br>
        
        
        <h3 align="center">HP Branch Complaints</h3>
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Non Verified</th>
            </tr>   
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
           <%
                    
                        int k=0;
                        String sel3="select * from tbl_complaints c inner join tbl_hpbranch cf on c.hpbranch_id=cf.hpbranch_id where complaint_replystatus='0'";
                        ResultSet rs3=obj.selectCommand(sel3);
                        while (rs3.next())
                        {
                            k++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs3.getString("hpbranch_name")%></td>
                        
                        <td><%=rs3.getString("hpbranch_contact")%></td>
                        
                        <td><%=rs3.getString("complaint_content")%></td>
                        
                        <td><%=rs3.getString("complaint_date")%></td>
                        
                        <td><%=rs3.getString("complaint_data")%></td>
                        
                        <td><a href="Reply.jsp?cid=<%=rs3.getString("complaint_id")%>">Reply</a></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
        <br>
        <br>
        <br>
        
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Verified</th>
            </tr> 
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
            <%
                    
                        int k31=0;
                        String sel31="select * from tbl_complaints c inner join tbl_hpbranch cf on c.hpbranch_id=cf.hpbranch_id where complaint_replystatus='1'";
                        ResultSet rs31=obj.selectCommand(sel31);
                        while (rs31.next())
                        {
                            k31++;
                            
                    %>
                  <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs31.getString("hpbranch_name")%></td>
                        
                        <td><%=rs31.getString("hpbranch_contact")%></td>
                        
                        <td><%=rs31.getString("complaint_content")%></td>
                        
                        <td><%=rs31.getString("complaint_date")%></td>
                        
                        <td><%=rs31.getString("complaint_data")%></td>
                        
                        <td><%=rs31.getString("complaint_reply")%></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
         <hr>
        
       
        
        <h3 align="center">User Complaints</h3>
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Non Verified</th>
            </tr>   
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
           <%
                    
                        int m=0;
                        String sel4="select * from tbl_complaints c inner join tbl_user cf on c.user_id=cf.user_id where complaint_replystatus='0'";
                        ResultSet rs4=obj.selectCommand(sel4);
                        while (rs4.next())
                        {
                            m++;
                            
                    %>
                    <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs4.getString("user_name")%></td>
                        
                        <td><%=rs4.getString("user_contact")%></td>
                        
                        <td><%=rs4.getString("complaint_content")%></td>
                        
                        <td><%=rs4.getString("complaint_date")%></td>
                        
                        <td><%=rs4.getString("complaint_data")%></td>
                        
                        <td><a href="Reply.jsp?cid=<%=rs4.getString("complaint_id")%>">Reply</a></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
        <br>
        <br>
        <br>
        
        <table border="2" align="center" cellpadding="5">
            <tr>
                <th align="center" colspan="7">Verified</th>
            </tr> 
             <tr>
                          <td>SI.NO</td>
                          <td>Name</td>
                          <td>Contact</td>
                          <td>Content</td>
                          <td>Date</td>
                          <td>Data</td>
                          <td>Action</td>
            </tr>
            <%
                    
                        int m41=0;
                        String sel41="select * from tbl_complaints c inner join tbl_user cf on c.user_id=cf.user_id where complaint_replystatus='1'";
                        ResultSet rs41=obj.selectCommand(sel41);
                        while (rs41.next())
                        {
                            m41++;
                            
                    %>
                  <tr>
                        <td><%=i%></td>
                        
                        <td><%=rs41.getString("user_name")%></td>
                        
                        <td><%=rs41.getString("user_contact")%></td>
                        
                        <td><%=rs41.getString("complaint_content")%></td>
                        
                        <td><%=rs41.getString("complaint_date")%></td>
                        
                        <td><%=rs41.getString("complaint_data")%></td>
                        
                        <td><%=rs41.getString("complaint_reply")%></td>
                        
                    </tr>   
                    <%
                            
                       }
                    
                    %>
        </table>
    </body>
</div>
</html>
   