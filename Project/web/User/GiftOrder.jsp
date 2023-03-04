<!DOCTYPE HTML>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<html lang="en">
    <head>
        <title>Gift Order</title>
        <script>
            function fnTotalCount() {

                var ProductRate = parseInt(document.getElementById("txtRate").value);
                var count = parseInt(document.getElementById("txtCount").value);
                var TotalAmount = ProductRate * count;
                document.getElementById("txtTotalRate").value = TotalAmount;

            }
        </script>
        <meta charset="utf-8">      
        <meta name="description" content="Description goes here">
        <meta name="keywords" content="Keywords goes here">     

        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/preview.css" type="text/css">
        <link rel="stylesheet" href="form.css" type="text/css">
        <script type="text/javascript" src="js/main.js"></script>


    </head>
    <%
        if (request.getParameter("btn_save") != null) {

            String Ins = "insert into tbl_giftbook(gifts_id,user_id,gift_count,gift_trate,gb_orderdate) values('" + request.getParameter("giftsid") + "','" + session.getAttribute("uid") + "','" + request.getParameter("txtCount") + "','" + request.getParameter("txtTotalRate") + "',curdate())";
            //          out.println(Ins);
            boolean success = obj.executeCommand(Ins);
            if (success) {
                response.sendRedirect("Payment.jsp");
                out.println("<script>alert('successfully inserted')</script>");
            } else {
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

                        <h1>Profile</h1>
                        <div id="tab" align="center">
                            <form  method="POST" action="">
                                <table border="0" align="center" cellpadding="10">


                                    <%
                                        int i = 0;
                                        String Sel = "select * from tbl_gifts gts inner join tbl_gifttype gtp on gts.gifttype_id=gtp.gifttype_id where gifts_id='" + request.getParameter("giftsid") + "'";
                                        //    out.println(Sel);
                                        ResultSet rs = obj.selectCommand(Sel);
                                        if (rs.next()) {
                                            i++;

                                    %>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <img src="../Assets/GiftPhotos/<%=rs.getString("gifts_photo")%>" width="250" height="200" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td>
                                        <td><%=rs.getString("gifts_name")%></td>
                                    </tr>

                                    <tr>

                                        <td>Category:</td>
                                        <td><%=rs.getString("gifttype_name")%></td>
                                    </tr>
                                    <tr>

                                        <td>Rate:</td>
                                        <td><%=rs.getString("gifts_rate")%></td>
                                    <input type="hidden" name="txtRate" id="txtRate" value="<%=rs.getString("gifts_rate")%>">
                                    </tr>

                                    <tr>
                                        <td>
                                            Count
                                        </td>
                                        <td>
                                            <input type="number" min="1" value="1" name="txtCount" id="txtCount" onchange="fnTotalCount()">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Total Rate
                                        </td>
                                        <td>
                                            <input type="text" min="1" name="txtTotalRate" readonly="readonly" id="txtTotalRate" value="<%=rs.getString("gifts_rate")%>">
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" value="Order Now" name="btn_save">
                                        </td>
                                    </tr>
                                    <%

                                        }


                                    %>

                                </table>
                            </form>
                        </div>

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