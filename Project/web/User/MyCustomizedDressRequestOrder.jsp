<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Customized Gift Request Order </title>
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

        </head>
        <body>
            <div id="wrapper">
                <section>
                    <div class="dynamicContent">
                        <!--content -->		
                        <a href="index.html" class="close"></a> 		
                        <div class="box_top"></div>
                        <div class="box">


                            <div id="tab" align="center">
                                <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
                                    <tr>
                                        <td>SI.NO</td>
                                        <td>Dress Type</td>
                                        <td>Feature</td>
                                        <td>Items</td>
                                        <td>Size</td>
                                        <td>Rate</td>
                                        <td>Require Date</td>
                                        <td>Order Status</td>
                                        <td>Action</td>


                                    </tr>
                                <%                int i = 0;
                                    String vstatus = "0", cstatus = "0";
                                    String Sel = "select * from tbl_dressrequest o inner join tbl_dresscategory p on o.dresscategory_id=p.dresscategory_id where o.user_id='" + session.getAttribute("uid") + "'";
                                    ResultSet rs = obj.selectCommand(Sel);
                                    //               out.print(Sel);
                                    while (rs.next()) {
                                        vstatus = rs.getString("dr_vstatus");
                                        cstatus = rs.getString("dr_cstatus");
                                        i++;

                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rs.getString("dresscategory_name")%></td>
                                    <td><%=rs.getString("dr_feature")%></td>
                                    <td><%=rs.getString("dr_material")%></td>
                                    <td><%=rs.getString("dr_size")%></td>
                                    <td><%=rs.getString("dr_rate")%></td>
                                    <td><%=rs.getString("dr_requiredate")%></td>

                                    <%
                                        if (vstatus.equals("0")) {
                                    %>
                                    <td>Not Verified</td>
                                    <%
                                    } else if (vstatus.equals("1") && cstatus.equals("0")) {
                                    %>

                                    <td style="background-color:#0099ff;color: #000000">Verified</td>
                                    <%
                                    } else if (vstatus.equals("1") && cstatus.equals("1")) {
                                    %>
                                    <td style="background-color: greenyellow;color: #000000">Delivered</td>
                                    <td><a href="Payment.jsp">Payment</a></td>

                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }

                                %>
                            </table>
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









