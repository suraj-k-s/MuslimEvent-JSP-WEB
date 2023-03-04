<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title> Worker Package Booking</title>
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
                                <form  method="POST"  action="">
                                    <table border="0" align="center" cellpadding="10">

                                    <%

                                        String workbookrequiredate = "";
                                        String workbookbookdate = "";

                                        String msg = "";

                                        if (request.getParameter("btnsubmit") != null) {
                                            workbookrequiredate = request.getParameter("txtrequiredate");

                                            workbookbookdate = request.getParameter("curdate");

                                            String ins = "insert into tbl_workerbook(workerbook_bookdate,workerbook_requiredate,workerbook_bookstatus,workerbook_cstatus,user_id,wsp_id) values(curdate(),'" + request.getParameter("txtrequiredate") + "',0,0,'" + session.getAttribute("uid") + "','" + request.getParameter("wspid") + "')";
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
                                        String Sel1 = "select * from tbl_workerspackage pck inner join tbl_packagecategory pkcat on pck.packagecat_id=pkcat.packagecat_id inner join tbl_eventworkers eor on pck.eventworker_id=eor.eventworker_id where wsp_id='" + request.getParameter("wspid") + "'";
                                        //                  out.println(Sel1);
                                        ResultSet rs1 = obj.selectCommand(Sel1);
                                        if (rs1.next()) {
                                            i1++;

                                    %>

                                    <tr>
                                        <td colspan="2">
                                            <img src="../Assets/WorkersDetails/<%=rs1.getString("wsp_detail")%>" width="350" height="300">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Image:</td>
                                        <td><img src="../Assets/WorkersImages/<%=rs1.getString("wsp_workimage")%>" width="100" height="100"></td>
                                    </tr>

                                    <tr>

                                        <td>Category:</td>
                                        <td><%=rs1.getString("packagecat_name")%></td>
                                    </tr>
                                    <tr>

                                        <td>Rate:</td>
                                        <td><%=rs1.getString("wsp_rate")%></td>
                                    </tr>


                                    <tr>
                                        <td>
                                            Require Date
                                        </td>
                                        <td>
                                            <input type="Date" required="required" name="txtrequiredate" id="txtrequiredate">
                                        </td>
                                    </tr>
                                </table>
                                <table border="0" align="center" cellpadding="5">
                                    <tr>
                                        <td colspan="2" align="center"> 
                                            <br>

                                            <h3>Workers Details</h3></td>
                                    </tr>

                                    <tr>
                                        <td>Name</td>
                                        <td><%=rs1.getString("eventworker_name")%></td>
                                    </tr>
                                    <tr>
                                        <td>Contact</td>
                                        <td><%=rs1.getString("eventworker_contact")%></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><%=rs1.getString("eventworker_email")%></td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td><%=rs1.getString("eventworker_address")%></td>
                                    </tr>
                                    <tr>

                                        <td>Photo</td>
                                        <td><img src="../Assets/EventPhoto/<%=rs1.getString("eventworker_photo")%>" width="100" height="100"></td>

                                    </tr>
                                    <tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" style="width: 150px" value="Book Now" name="btnsubmit">
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









