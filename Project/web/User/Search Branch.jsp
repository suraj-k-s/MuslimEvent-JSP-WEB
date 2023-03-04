<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Search Branch</title>
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

                            <h1>Search Gifts</h1>
                            <div id="tab" align="center" style="border: none">
                                <form id="form2" name="form2" method="post" action="">
                                    <select name="seldistrict" style="width: 400px">
                                        <option>----select-----</option>

                                    <%
                                        String Sel = "select*from tbl_district";
                                        ResultSet rs = obj.selectCommand(Sel);
                                        while (rs.next()) {
                                    %>

                                    <option value="<%=rs.getString("District_id")%>"> <%=rs.getString("District_name")%></option>
                                    <%
                                        }
                                    %>

                                </select>

                                <input type="submit" style="width: 100px" name="btnsubmit" id="btnsubmit"  value="Search"> </td>

                            </form>
                        </div>
                        <br><br><br><br>
                        <%
                            if (request.getParameter("btnsubmit") != null) {
                        %>



                        <%
                            int i = 0;
                            String sel2 = "select * from tbl_hpbranch hb inner join tbl_place pl on hb.place_id=pl.Place_id where District_id='" + request.getParameter("seldistrict") + "'";
                            //         out.println(sel2);
                            ResultSet rs2 = obj.selectCommand(sel2);
                            while (rs2.next()) {
                                i++;

                        %>


                        <div class="gal1">
                            <div class="photo1"><img width="250" height="153" src="../Assets/BranchPhotos/<%=rs2.getString("hpbranch_photo")%>"></div>

                            <div class="caption">
                                <%=rs2.getString("hpbranch_name")%>
                                <br>
                                <%=rs2.getString("hpbranch_contact")%>
                                <br>
                                <%=rs2.getString("hpbranch_contact")%>
                                <br>
                                <%=rs2.getString("hpbranch_email")%>
                                <br>
                                <%=rs2.getString("hpbranch_address")%>
                                <br>
                                <%=rs2.getString("hpbranch_landmark1")%>
                                <br>
                                <br>
                                <a href="ViewHPProducts.jsp?hid=<%=rs2.getString("hpbranch_id")%>">View Products</a>
                            </div>
                        </div>





                        <%

                                }
                            }
                        %>



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









