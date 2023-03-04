<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
           <title>Worker Package Order </title>
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
                                        <td>Package Name</td>
                                        <td>Package Category</td>
                                        <td>Rate</td>
                                        <td>Require Date</td>
                                        <td>Book Date</td>
                                        <td>Order Status</td>
                                    </tr>
                                <%

                                    int i = 0;
                                    String bookstatus = "0", cstatus = "0";
                                    String Sel = "select * from tbl_workerbook o inner join tbl_workerspackage p on o.wsp_id=p.wsp_id inner join tbl_packagecategory pcat on p.packagecat_id=pcat .packagecat_id where o.user_id='" + session.getAttribute("uid") + "'";
                                    System.out.println(Sel);
                                    ResultSet rs = obj.selectCommand(Sel);
                    //                out.print(Sel);
                                    while (rs.next()) {
                                        bookstatus = rs.getString("workerbook_bookstatus");
                                        cstatus = rs.getString("workerbook_cstatus");
                                        i++;

                                %>
                                <tr>
                                <tr>
                                    <td><%=i%></td>
                                    <td><img src="../Assets/WorkersImages/<%=rs.getString("wsp_workimage")%>" width="100" height="100"></td>                   
                                    <td><%=rs.getString("packagecat_name")%></td>
                                    <td><%=rs.getString("wsp_rate")%></td>
                                    <td><%=rs.getString("workerbook_requiredate")%></td>
                                    <td><%=rs.getString("workerbook_bookdate")%></td>
                                    <%
                                        if (bookstatus.equals("0")) {
                                    %>
                                    <td>Not Verified</td>
                                    <%
                                    } else if (bookstatus.equals("1")) {
                                    %>

                                    <td style="background-color:#0099ff;color: #000000">Verified</td>
                                    <%
                                    } else if (bookstatus.equals("2")) {
                                    %>
                                    <td style="background-color: greenyellow;color: #000000">Delivered</td>

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









