<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Search Event Workers</title>
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
                            <form>
                                <div id="tab" align="center" style="border: none">
                                    <table>
                                        <tr>
                                            <td>
                                                District
                                            </td>

                                            <td>
                                                <select name="seldistrict" style="width: 150px" onchange="getplace(this.value)">
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


                                        </td>
                                        <td>
                                            Place
                                        </td>

                                        <td>
                                            <select name="selplace" style="width: 150px" id="selplace">
                                                <option>----select----</option>

                                            </select>


                                        </td>
                                        <td>Work</td>


                                        <td>
                                            <select name="txteventworkercat" style="width: 150px" id="txteventworkercat">
                                                <option>----select----</option>

                                                <%
                                                    String Sel3 = "select * from tbl_eventworkercat";
                                                    ResultSet rs3 = obj.selectCommand(Sel3);
                                                    while (rs3.next()) {
                                                %>
                                                <option value="<%=rs3.getString("eventworkcat_id")%>"><%=rs3.getString("eventworkcat_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                                        <td colspan="2" align="center">
                                            <input type="submit" name="btnsubmit" style="width: 100px" id="btnsubmit"  value="Search"> </td>

                                    </tr>
                                </table>
                        </form>
                        <br><br><br><br>
                        <%
                            if (request.getParameter("btnsubmit") != null) {
                        %>



                        <%
                            int i = 0;
                            String Sel2 = "select * from tbl_eventworkers where place_id='" + request.getParameter("selplace") + "' and eventworkcat_id='" + request.getParameter("txteventworkercat") + "'";
                            ResultSet rs2 = obj.selectCommand(Sel2);
                            while (rs2.next()) {
                                i++;

                        %>



                        <div class="gal1">
                            <div class="photo1"><img width="250" height="153" src="../Assets/EventPhoto/<%=rs2.getString("eventworker_photo")%>"></div>

                            <div class="caption">
                                Name:<%=rs2.getString("eventworker_name")%>
                                <br>
                                Contact:<%=rs2.getString("eventworker_contact")%>
                                <br>
                                Email:<%=rs2.getString("eventworker_email")%>
                                <br>
                                Address:<%=rs2.getString("eventworker_address")%>
                                <br>
                                Gender:<%=rs2.getString("eventworker_gender")%>
                                <br>
                                <br>
                                <a href="ViewWorkerAlbum.jsp?waid=<%=rs2.getString("eventworker_id")%>">View Works</a>
                                
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









