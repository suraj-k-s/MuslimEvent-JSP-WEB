<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Package Booking</title>
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

                            <h1>Event Organization Package</h1>
                            <div id="tab" align="center">
                                <form  method="POST"  action="">
                                    <table border="0" align="center" cellpadding="10">

                                    <%                                                          String packbookrequiredate = "";
                                        String packbookbookdate = "";

                                        String msg = "";

                                        if (request.getParameter("btnsubmit") != null) {
                                            packbookrequiredate = request.getParameter("txtrequiredate");

                                            packbookbookdate = request.getParameter("curdate");

                                            String ins = "insert into tbl_packagebook(packbook_bookdate,packbook_requiredate,packbook_bookstatus,packbook_cstatus,user_id,packages_id) values(curdate(),'" + request.getParameter("txtrequiredate") + "',0,0,'" + session.getAttribute("uid") + "','" + request.getParameter("packageid") + "')";
                                            //           out.println(ins);
                                            boolean bol = obj.executeCommand(ins);
                                            if (bol == true) {
                                                response.sendRedirect("Payment.jsp");
                                                out.println("<script>alert('successfully inserted')</script>");

                                            } else {
                                                out.println("<script>alert('failed to insert')</script>");
                                            }
                                        }


                                    %>




                                    <%                        int i1 = 0;
                                        String Sel1 = "select * from tbl_packages pck inner join tbl_packagecategory pkcat on pck.packagecat_id=pkcat.packagecat_id inner join tbl_eventorg eor on pck.eventorg_id=eor.eventorg_id where packages_id='" + request.getParameter("packageid") + "'";
                                        //                  out.println(Sel1);
                                        ResultSet rs1 = obj.selectCommand(Sel1);
                                        if (rs1.next()) {
                                            i1++;

                                    %>

                                    <tr>
                                        <td colspan="2">
                                            <img src="../Assets/PackageDetails/<%=rs1.getString("packages_details")%>" width="350" height="300">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td>
                                        <td><%=rs1.getString("packages_name")%></td>
                                    </tr>

                                    <tr>

                                        <td>Category:</td>
                                        <td><%=rs1.getString("packagecat_name")%></td>
                                    </tr>
                                    <tr>

                                        <td>Rate:</td>
                                        <td><%=rs1.getString("packages_rate")%></td>
                                    </tr>


                                    <tr>
                                        <td>
                                            Require Date
                                            <input type="Date"  name="txtrequiredate" id="txtrequiredate">
                                        </td>
                                    </tr>
                                </table>

                                <form  method="POST" action="">
                                    <table border="0" align="center" cellpadding="5">
                                        <tr>
                                            <td colspan="2" align="center"> 

                                                <br> 

                                                <h3>Organization Details</h3></td>
                                        </tr>

                                        <tr>
                                            <td>Name</td>
                                            <td><%=rs1.getString("eventorg_name")%></td>
                                        </tr>
                                        <tr>
                                            <td>Contact</td>
                                            <td><%=rs1.getString("eventorg_contact")%></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><%=rs1.getString("eventorg_email")%></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><%=rs1.getString("eventorg_address")%></td>
                                        </tr>
                                        <tr>
                                            <td>Licence Number</td>
                                            <td><%=rs1.getString("eventorg_licno")%></td>
                                        </tr>
                                        <tr>

                                            <td>Logo</td>
                                            <td><img src="../Assets/EventOrgLogo/<%=rs1.getString("eventorg_logo")%>" width="100" height="100"></td>

                                        </tr>
                                        <tr>

                                        <tr>
                                            <td colspan="2">
                                                <input type="submit" value="Book Now" name="btnsubmit">
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










