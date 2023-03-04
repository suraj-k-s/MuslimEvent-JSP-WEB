


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

    <%

        String giftfeatures = "";
        String giftitems = "";

        String msg = "";

        if (request.getParameter("btnsubmit") != null) {
            giftfeatures = request.getParameter("txtfeature");

            giftitems = request.getParameter("txtitem");

            String ins = "insert into tbl_giftrequest(gr_feature,gr_items,gr_requestdate,gr_vstatus,gr_cstatus,user_id,gifttype_id) values('" + giftfeatures + "','" + giftitems + "',curdate(),0,0,'" + session.getAttribute("uid") + "','" + request.getParameter("selgifttype") + "')";
           
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

                        <title>Customized Gift Request</title>
                        <div id="tab" align="center">
                            <form id="form1" name="form1" method="post" action="">
                                <table border="3" align="center" cellpadding="5">

                                    <tr>
                                        <td>
                                            Gift Type
                                        </td>

                                        <td>
                                            <select name="selgifttype" onchange="getplace(this.value)">
                                                <option>----select----</option>
                                                <%                                String Sel = "select*from tbl_gifttype";
                                                    ResultSet rs = obj.selectCommand(Sel);
                                                    while (rs.next()) {
                                                %>

                                                <option value="<%=rs.getString("gifttype_id")%>"> <%=rs.getString("gifttype_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>

                                    </tr>
                                    <tr>
                                        <td>Features</td>
                                        <td><textarea name="txtfeature" id="txtfeature"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>Items</td>
                                        <td><textarea name="txtitem" id="txtitem"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" cellpadding="5">
                                            <input type="SUBMIT" name="btnsubmit" id="btnsubmit" value="Send Request">
                                        </td>
                                    </tr>
                                </table>
                                <table border="2" align="center">
                                    <tr>
                                        <td>SI.NO</td>
                                        <td>Gift Type</td>
                                        <td>Feature</td>
                                        <td>Items</td>

                                    </tr>
                                    <%
                                        int i = 0;
                                        String sel2 = "select * from tbl_giftrequest g inner join tbl_gifttype p on g.gifttype_id=p.gifttype_id where user_id='" + session.getAttribute("uid") + "'";
                                        ResultSet rs2 = obj.selectCommand(sel2);
                                        while (rs2.next()) {
                                            i++;

                                    %>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=rs2.getString("gifttype_name")%></td>
                                        <td><%=rs2.getString("gr_feature")%></td>
                                        <td><%=rs2.getString("gr_items")%></td>

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









