<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>

<%@page import="java.sql.ResultSet"%>
<option>----select----</option>
<%
    String Sel1 = "select*from tbl_place where district_id='"+request.getParameter("disid")+"'";
    ResultSet rs1 = obj.selectCommand(Sel1);
    while (rs1.next()) {
%>

<option value="<%=rs1.getString("Place_id")%>"> <%=rs1.getString("Place_name")%></option>
<%
    }
%>