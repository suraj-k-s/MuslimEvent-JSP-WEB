<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
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
            <title>View Worker Media</title>
            <script src="../AjaxPages/jQuery.js" type="text/javascript"></script>
            <script>
                function getsevent(did)

                        //alert(a);
                        $.ajax( {url: "AjaxPlace.jsp?cid="did,
                            success: function(result) {
                                $("#selplace").html(result);
                            }}
                    )
            </script>
        <%           String gifttype = "";
            String msg = "";
            String delid = "";

            gifttype = request.getParameter("albumid");

            delid = request.getParameter("delid");

            if (delid != null) {

                String del = "delete from tbl_albummedia where alm_id='" + delid + "'";
                boolean bol = obj.executeCommand(del);
                out.println(bol);
                if (bol == true) {
                    msg = "Record Deleted...";

                } else {
                    msg = "";
                    out.println(del);
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
                        

                        <div id="tab" align="center" style="border: none">

                          
                                <table border="2" align="center" cellpadding="10" style="border-collapse:collapse;">

                                    <tr>
                                        <td>SI.NO</td>

                                        <td>Media File</td>
                                        <td>Caption</td>
                                        <td>Action</td>
                                    </tr>

                                    <%                        int i = 0;
                                        String sel1 = "select * from tbl_albummedia alm inner join  tbl_workeralbum walm on alm.wa_id=walm.wa_id where walm.wa_id='" + request.getParameter("waid") + "'";
                    //                       out.print(sel1);
                                        ResultSet rs1 = obj.selectCommand(sel1);
                                        while (rs1.next()) {
                                            i++;

                                    %>
                                    <tr>
                                        <td><%=i%></td>

                                        <td><img src="../Assets/AlbumMedia/<%=rs1.getString("alm_file")%>" width="150" height="150"></td>
                                        <td><%=rs1.getString("alm_caption")%></td>
                                        <td><a href="ViewWorkerAlbum.jsp?delid=<%=rs1.getString("alm_id")%>">Delete</a></td>



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
        <script src="../AjaxPages/jQuery.js"></script>
        <script>
            function getplace(did)
            {
                // alert(did);  

                $.ajax({url: "../AjaxPages/AjaxPlace.jsp?disid=" + did,
                    success: function(result) {
                        //     alert(result);
                        $("#selplace").html(result);
                    }});
            }
        </script>
        <script>
        $("a[rel^='prettyPhoto']").prettyPhoto({animation_speed: 'normal', theme: 'dark', social_tools: false, allow_resize: true, default_width: 500, default_height: 344});
        </script>

    </body>
</html>









