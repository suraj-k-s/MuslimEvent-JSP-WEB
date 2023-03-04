<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>gallery</title>
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

                            <h1>Workers package</h1>
                            <div id="tab" align="center">
                                <table border="2" align="center" cellpadding="10" style="border-collapse:collapse;">

                                    <td>SI NO</td>
                                    <td>Package category name</td>
                                    <td>Rate</td>
                                    <td>Package Details</td>
                                    <td>Package Image</td>
                                    <td>Action</td>

                                    <td>Feed Back</td>

                                <%

                                    int i = 0;
                                    String Sel1 = "select * from tbl_workerspackage pk inner join tbl_packagecategory pcat on pk.packagecat_id=pcat.packagecat_id where eventworker_id='" + request.getParameter("wid") + "'";
                                    //out.print(Sel1);
                                    ResultSet rs1 = obj.selectCommand(Sel1);
                                    while (rs1.next()) {
                                        i++;

                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rs1.getString("packagecat_name")%></td>
                                    <td><%=rs1.getString("wsp_rate")%></td>
                                    <td><img src="../Assets/WorkersDetails/<%=rs1.getString("wsp_detail")%>" width="150" height="150"></td>
                                    <td><img src="../Assets/WorkersImages/<%=rs1.getString("wsp_workimage")%>" width="150" height="150"></td>
                                    <td><a href="WorkPackageBooking.jsp?wspid=<%=rs1.getString("wsp_id")%>">Book Now</a></td>

                                    <td><a href="WorkersPackagesFeedback.jsp?wspid=<%=rs1.getString("wsp_id")%>">Send Feedback</a></td>

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









