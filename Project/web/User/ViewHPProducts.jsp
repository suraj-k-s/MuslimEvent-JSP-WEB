<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
             <title>View HP Products</title>
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

                            <h1>Products</h1>
                            
                        


                       <%
                    
                        int i=0;
                        String sel="select * from tbl_products p inner join tbl_productcategory pc on p.productcategory_id=pc.productcategory_id where hpbranch_id='"+request.getParameter("hid")+"'";
//                       out.println(sel);
                        ResultSet rs=obj.selectCommand(sel);
                        while (rs.next())
                        {
                            i++;
                            
                    %>


                        <div class="gal1">
                            <div class="photo1"><img width="250" height="153" src="../Assets/ProductPhotos/<%=rs.getString("product_photo")%>"></div>

                            <div class="caption">
                                <br>
                        Type:<%=rs.getString("productcategory_name")%>
                        <br>
                        Rate:<%=rs.getString("product_rate")%>
                        <br>
                        Name:<%=rs.getString("product_name")%>
                        <br>
                        <a href="BuyProduct.jsp?pid=<%=rs.getString("product_id")%>">Buy Now</a>
                        
                        
                   
                            </div>
                        </div>





                        <%

                                
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









