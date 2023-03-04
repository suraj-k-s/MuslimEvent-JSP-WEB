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

                            <h1>More</h1>
                            <div id="tab" align="center">
                                <table border="2" align="center" cellpadding="10" style="border-collapse:collapse;">
                                    <tr>
                                        <td>SI.NO</td>
                                        <td>Title</td>
                                        <td>Description</td>
                                        <td>Date</td>
                                        <td>Other Works</td>
                                        <td>Action</td>
                                        <td>Package</td>
                                        <td>Customized Dress</td>
                                    </tr>
                                <%

                                    int i = 0;
                                    String sel = "select * from tbl_workeralbum where eventworker_id='" + request.getParameter("waid") + "'";
                                    //                        out.print(sel);
                                    ResultSet rs = obj.selectCommand(sel);
                                    while (rs.next()) {
                                        i++;

                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rs.getString("wa_title")%></td>
                                    <td><%=rs.getString("wa_description")%></td>
                                    <td><%=rs.getString("wa_date")%></td>
                                    <td><%=rs.getString("wa_other")%></td>
                                    <td><a href="ViewWorkerMedia.jsp?waid=<%=rs.getString("wa_id")%>">View Media</a></td>
                                    <td><a href="WorkersPackage.jsp?wid=<%=rs.getString("eventworker_id")%>">View Worker Package</a></td>
                                    <td><a href="CustomizedDressRequest.jsp?waid=<%=rs.getString("eventworker_id")%>">Custom</a></td>
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









