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

                            <h1>Search Gifts</h1>
                            <form>
                                <div id="tab" align="center" style="border: none">
                                    <select name="txttype" id="txttype" style="width: 400px">
                                        <option>----select----</option>

                                    <%
                                        String Sel = "select * from tbl_gifttype";
                                        ResultSet rs = obj.selectCommand(Sel);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("gifttype_id")%>"><%=rs.getString("gifttype_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <input type="submit" style="width: 100px" name="btnsubmit" id="btnsubmit"  value="Search"> 

                            </div>
                        </form>
<br><br><br><br>
                        <%
                            if (request.getParameter("btnsubmit") != null) {
                        %>



                        <%
                            int i = 0;
                            String Sel1 = "select * from tbl_gifts g inner join tbl_gifttype gt on g.gifttype_id=gt.gifttype_id where gt.gifttype_id='" + request.getParameter("txttype") + "'";
                            //                       out.print(Sel1);
                            ResultSet rs1 = obj.selectCommand(Sel1);
                            while (rs1.next()) {
                                i++;

                        %>



                        <div class="gal1">
                            <div class="photo1"><a href="../Assets/GiftPhotos/<%=rs1.getString("gifts_photo")%>" rel="prettyPhoto[pp_gal1]" title="<%=rs1.getString("gifts_name")%>"><img width="250" height="153" src="../Assets/GiftPhotos/<%=rs1.getString("gifts_photo")%>"></a></div>
                            <div class="caption">
                                Name:<%=rs1.getString("gifts_name")%>
                                <br>
                                Item:<%=rs1.getString("gifts_item")%>
                                <br>
                                Rate:<%=rs1.getString("gifts_rate")%>
                                <br>
                                <br>
                                <a href="GiftOrder.jsp?giftsid=<%=rs1.getString("gifts_id")%>">Send Order</a>
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
        <script>
            $("a[rel^='prettyPhoto']").prettyPhoto({animation_speed: 'normal', theme: 'dark', social_tools: false, allow_resize: true, default_width: 500, default_height: 344});
        </script>
    </body>
</html>









