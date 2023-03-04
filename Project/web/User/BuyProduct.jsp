<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
             <title>Buy Product</title>
            <meta charset="utf-8">      
            <meta name="description" content="Description goes here">
            <meta name="keywords" content="Keywords goes here">     

            <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
            <link rel="stylesheet" href="css/preview.css" type="text/css">
            <link rel="stylesheet" href="form.css" type="text/css">
            <script type="text/javascript" src="js/main.js"></script>

            <!--[if lt IE 8]>
                <div style=' clear: both; text-align:center; position: relative;z-index:100;'>
                    <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
                </div>
            <![endif]-->
<script>
            function fnTotalCount(){
                
                var ProductRate=parseInt(document.getElementById("txtRate").value);
                var count=parseInt(document.getElementById("txtCount").value);
                var TotalAmount=ProductRate*count;
                document.getElementById("txtTotalRate").value=TotalAmount;
                
            }
        </script>
        </head>
          <%
               if(request.getParameter("btn_save")!=null)
            {
                
         
               
                    String Ins="insert into tbl_productbook(product_id,user_id,product_count,product_trate,pb_orderdate) values('"+request.getParameter("pid")+"','"+session.getAttribute("uid")+"','"+request.getParameter("txtCount")+"','"+request.getParameter("txtTotalRate")+"',curdate())";
 //                   out.println(Ins);
                boolean success=obj.executeCommand(Ins);
                if(success)
                {
                    response.sendRedirect("Payment.jsp");
                    out.println("<script>alert('successfully inserted')</script>");
                }
                else
                {
                    out.println("<script>alert('failed to insert')</script>");
                   
                }
               
                }
                    %>
        <body>
            <div id="wrapper">
                <section>
                    <div class="dynamicContent">
                        <!--content -->		
                        <a href="index.html" class="close"></a> 		
                        <div class="box_top"></div>
                        <div class="box">

                            <h1>Buy Product</h1>
                            <div id="tab" align="center">
                               <form  method="POST" action="">
                 <table border="0" align="center" cellpadding="5">
                
               
                    <%
                    
                        int i=0;
                        String Sel="select * from tbl_products pro inner join tbl_productcategory pcat on pro.productcategory_id=pcat.productcategory_id inner join tbl_hpbranch hpb on pro.hpbranch_id=hpb.hpbranch_id where product_id='"+request.getParameter("pid")+"'";
//                     out.println(Sel);
                        ResultSet rs=obj.selectCommand(Sel);
                        if (rs.next())
                        {
                            i++;
                            
                    %>
                    <tr>
                        <td colspan="2">
                        <img src="../Assets/ProductPhotos/<%=rs.getString("product_photo")%>" width="350" height="300">
                        </td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><%=rs.getString("product_name")%></td>
                    </tr>
                    
                    <tr>
                        
                        <td>Category:</td>
                        <td><%=rs.getString("productcategory_name")%></td>
                    </tr>
                     <tr>
                        
                        <td>Rate:</td>
                        <td><%=rs.getString("product_rate")%></td>
                     <input type="hidden" name="txtRate" id="txtRate" value="<%=rs.getString("product_rate")%>">
                    </tr>
                    
                 
                    
                    <tr>
                        <td>
                        Quantity:
                        <input type="number" min="1" value="1" name="txtCount" id="txtCount" onchange="fnTotalCount()">
                        </td>
                        </tr>
                        
                        <tr>
                         <td>
                            Total Rate:
                            <input type="text" min="1" name="txtTotalRate" readonly="readonly" id="txtTotalRate" value="<%=rs.getString("product_rate")%>">
                          </td>
                        </tr>
                 </table>
                        <form  method="POST" action="">
                 <table border="0" align="center" cellpadding="5">
                          <tr>
                    <td colspan="2" align="center"> 
                        <h3>Branch Details</h3></td>
                </tr>
                   
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("hpbranch_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("hpbranch_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("hpbranch_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rs.getString("hpbranch_address")%></td>
                </tr>
                 <tr>
                     <td>Landmark1</td>
                    <td><%=rs.getString("hpbranch_landmark1")%></td>
                </tr>
                 <tr>
                    <td>Landmark2</td>
                    <td><%=rs.getString("hpbranch_landmark2")%></td>
                </tr>
                 <tr>

                          <tr>
                        <td colspan="2" align="center">
                            <input type="submit" style="width: 150px" value="Order Now" name="btn_save">
                        </td>
                    </tr>
                       
                   <%
                   
                        }
         
                    
                    %>
                    
        </table>
       </form>

                        </div>

                        <div class="clear"></div>







                    </div>
                    <div class="box_bottom"></div>
                    <!--content end -->
                </div>
            </section>
        </div>
        <script>
            $("a[rel^='prettyPhoto']").prettyPhoto({animation_speed: 'normal', theme: 'dark', social_tools: false, allow_resize: true, default_width: 500, default_height: 344});
        </script>
    </body>
</html>











 