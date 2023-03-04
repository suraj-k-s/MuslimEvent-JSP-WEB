<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Search Event Organization</title>
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

                            <h1>Search Event Organization</h1>
                            <div id="tab" align="center" style="border: none">
                                <form id="form2" name="form2" method="post" action="">
                                    <select name="seldistrict" style="width: 300px" onchange="getplace(this.value)">
                                        <option>----select----</option>
                                    <%
                                        String Sel = "select*from tbl_district";
                                        ResultSet rs = obj.selectCommand(Sel);
                                        while (rs.next()) {
                                    %>

                                    <option value="<%=rs.getString("district_id")%>"> <%=rs.getString("district_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <select name="selplace" style="width: 300px" id="selplace">
                                    <option>----select----</option>

                                </select>

                                <input type="submit" style="width: 100px" name="btnsubmit" id="btnsubmit"  value="Search"> 


                            </form>
                        </div>
                        <br><br><br><br>
                        <%
                            if (request.getParameter("btnsubmit") != null) {
                        %>


                        <%
                            int i = 0;
                            String sel2 = "select * from tbl_eventorg where place_id='" + request.getParameter("selplace") + "'";
                            ResultSet rs2 = obj.selectCommand(sel2);
                            while (rs2.next()) {
                                i++;

                        %>



                        <div class="gal1">
                            <div class="photo1"><img width="250" height="153" src="../Assets/EventOrgLogo/<%=rs2.getString("eventorg_logo")%>"></div>

                            <div class="caption">
                                Name:<%=rs2.getString("eventorg_name")%>
                                <br>
                                Contact:<%=rs2.getString("eventorg_contact")%>
                                <br>
                                Email:<%=rs2.getString("eventorg_email")%>
                                <br>
                                Address:<%=rs2.getString("eventorg_address")%>
                                <br>
                                Date of joining:<%=rs2.getString("eventorg_doj")%>
                                <br>
                                <br>
                                <a href="OrganizationPackages.jsp?eid=<%=rs2.getString("eventorg_id")%>">View Packages</a>
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









