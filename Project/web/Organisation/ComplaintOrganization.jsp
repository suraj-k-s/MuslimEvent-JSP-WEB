<%-- 
    Document   : ComplaintOrganization
    Created on : 8 Mar, 2021, 1:13:23 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint User Forum</title> <%@include file="tem.jsp" %>
    </head>
    <%
        
           String complaintcontent="";
            String complaints="";
             String complainttype="";
             
             String complaintdata="";
        
        
        String msg="";
        
         if(request.getParameter("btnsubmit")!=null)
            {
             complaintcontent=request.getParameter("txtcomplaintcontent");
            
             complainttype=request.getParameter("txtcomplainttype");
             
             complaintdata=request.getParameter("txtcomplaintdata");
             
             
             
             
             
              String ins="insert into tbl_complaints(complaint_content,complainttype_id,complaint_data,complaint_date,eventorg_id) values('"+complaintcontent+"','"+complainttype+"','"+complaintdata+"',curdate(),'"+session.getAttribute("eid")+"')";
              //out.println(ins);
              boolean bol= obj.executeCommand(ins);
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
        
        %>
        
        <body>
            <div id="tab">
            <form id="form1" name="form1" method="post" action="">
                <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>Complaint Type</td> 
                       
                     <td>
                        <select name="txtcomplainttype" id="txtcomplainttype">
                            <option value="">----select----</option>
                            <%
            String Sel="select*from tbl_complainttype";
           ResultSet rs=obj.selectCommand(Sel);
            while(rs.next())
            {
                %>
               
                <option value="<%=rs.getString("complainttype_id")%>"> <%=rs.getString("complainttype_name")%></option>
                <%
            }
            %>
              </select>
                </tr>
                <tr>
                    <td>Complaint Content</td>
                    <td><input type="txtcomplaintcontent" name="txtcomplaintcontent" required="required" autocomplete="off" id="txtcomplaintcontent"></textarea></td>
                </tr>
               
               <tr>
                    <td>Complaint Data</td>
                    <td><textarea name="txtcomplaintdata" id="txtcomplaintdata"></textarea></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center" cellpadding="5">
                        <input type="SUBMIT" name="btnsubmit" id="btnsubmit" value="Send Complaint">
                    </td>
                </tr>
                </table>
               <table border="2" align="center">

                <tr>
                    <td>SI.NO</td>

                    <td>Type</td>
                    <td>Content</td>
                    <td>Date</td>
                    <td>Data</td>
                    <td>Reply</td>
                    <td>Reply Date</td>
                </tr>
                <%                     int j14 = 0;
                    String sel14 = "select * from tbl_complaints c inner join tbl_complainttype t on t.complainttype_id=c.complainttype_id inner join tbl_eventorg cf on c.eventorg_id=cf.eventorg_id where c.eventorg_id='" + session.getAttribute("eid") + "'";

                    ResultSet rs14 = obj.selectCommand(sel14);
                    while (rs14.next()) {

                        j14++;
                %>

                <tr>
                    <td><%=j14%></td>

                    <td><%=rs14.getString("complainttype_name")%></td>

                    <td><%=rs14.getString("complaint_content")%></td>

                    <td><%=rs14.getString("complaint_date")%></td>

                    <td><%=rs14.getString("complaint_data")%></td>
                    
                    <td><%=rs14.getString("complaint_reply")%></td>
                    
                    <td><%=rs14.getString("complaint_replydate")%></td>

                </tr>


                <%

                    }

                %>
            </table>

         </form>
            </div>
    </body>
</html>