<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Workers Package Feedback</title>
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
    <%

        String wspfcontent = "";

        String msg = "";

        if (request.getParameter("btnsubmit") != null) {
            wspfcontent = request.getParameter("txtfeedback");

            String ins = "insert into tbl_workerspackagefeedback(wpfeedback_content,wpfeedback_date,user_id,wsp_id) values('" + wspfcontent + "',curdate(),'" + session.getAttribute("uid") + "','" + request.getParameter("wspid") + "')";
            //out.println(ins);
            boolean bol = obj.executeCommand(ins);
            if (bol == true) {
                msg = "record inserted";
            } else {
                msg = "";
                out.println(ins);
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

                        <h1>feedback</h1>
                        <div id="tab" align="center">
                            <form method="POST">
                                <table border="2" align="center">
                                    <tr>
                                        <td>Feedback</td>
                                        <td><textarea name="txtfeedback" rows="10" required="required" id="txtfeedback"></textarea>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" name="btnsubmit" id="btnsubmit" value="Send">

                                        </td>
                                    </tr>

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









