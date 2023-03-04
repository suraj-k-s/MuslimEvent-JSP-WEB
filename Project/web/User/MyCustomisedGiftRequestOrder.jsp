<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
           <title>Customized Gift Request Order </title>
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


                            <div id="tab" align="center">
                                <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
            <tr>
                <td>SI.NO</td>
                <td>Gift Type</td>
                <td>Feature</td>
                <td>Items</td>
                <td>Rate</td>
                <td>Request Date</td>
                <td>Order Status</td>
                 <td>Action</td>
               
            </tr>
            <%

                int i = 0;
                String vstatus="0",cstatus="0";
                String Sel= "select * from tbl_giftrequest o inner join tbl_gifttype p on o.gifttype_id=p.gifttype_id where o.user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs = obj.selectCommand(Sel);
 //               out.print(Sel);
                while (rs.next()) {
                    vstatus=rs.getString("gr_vstatus");
                    cstatus=rs.getString("gr_cstatus");
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("gifttype_name")%></td>
                <td><%=rs.getString("gr_feature")%></td>
                <td><%=rs.getString("gr_items")%></td>
                 <td><%=rs.getString("gr_rate")%></td>
                <td><%=rs.getString("gr_requestdate")%></td>
                <% 
                    if(vstatus.equals("0")){
                        %>
                        <td>Not Verified</td>
                <%
                    }else if(vstatus.equals("1") && cstatus.equals("0")){
                %>
                        
                <td style="background-color:#0099ff;color: #000000">Verified</td>
                <%
                  }else if(vstatus.equals("1") && cstatus.equals("1"))
                    {
                  %>
                  <td style="background-color: greenyellow;color: #000000">Delivered</td>
                  <td><a href="Payment.jsp">Payment</a></td>
                  
                  <%
                    }
                   %>
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









