<%-- 
    Document   : ProductStock
    Created on : 13 Feb, 2021, 12:34:29 PM
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

        <title>Product stock</title>

    </head>

    <body>

             <%
            String quantity="",delid="",edid="";
           
                   
                   
            if(request.getParameter("btn_Add Stock")!=null)
            {
             
               
                    String InsQry="insert into tbl_pstock(product_id,pstock_qty,pstock_date) values('"+request.getParameter("pid")+"','"+request.getParameter("dname")+"',curdate())";
                boolean success=obj.executeCommand(InsQry);
      //         out.println(InsQry);
                if(success)
                {
                    out.println("<script>alert('successfully inserted')</script>");
                }
                else
                {
                    out.println("<script>alert('failed to insert')</script>");
                   
                }
               
             }
//                else
//                {
//                    String up="update tbl_pstock set pstock_qty='"+request.getParameter("dname")+"' where pstock_id='"+edid+"'";
//                    boolean success=obj.executeCommand(up);
//                        if(success)
//                            {
//                                out.println("<script>alert('successfully Update')</script>");
//                            }
//                        else
//                            {
//                                out.println("<script>alert('failed to Update')</script>");
//                   
//                            }  
//               
//                 
//            }
            //}
           
           
           
           
//          delid=request.getParameter("delid");      
//           if(delid!=null)
//           {
//            String del="delete from tbl_pstock where pstock_id="+delid+"";
//          boolean bol=obj.executeCommand(del);
//            if(bol==true)
//            {
//            out.println("<script>alert('Record delete')</script>");
//            }
//            else
//            {
//           out.println(del);
//           }
//            }
           
           
            %>
<!DOCTYPE html>
   
   
   
          <div id="tab">

            <form id="form1" name="form1" method="post" action="">
                <table border="3" align="center" cellpadding="5">
                <tr>
                    <td>
                       Quantity
                    </td>
                    <td>
                        <input type="text" name="dname" id="dname" value="">
                    </td>
                       
                       
                   
                </tr>
                <tr>
                     <td colspan="2" align="center">
                        <input type="submit" name="btn_Add Stock" value="Addstock">
                    </td>
                   
                </tr>
            </table>
          </div>
        </form>
    </body>
    </html>


