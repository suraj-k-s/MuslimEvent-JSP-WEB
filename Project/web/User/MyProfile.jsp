<!DOCTYPE HTML>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<html lang="en">
    <head>
        <title>more</title>
        <meta charset="utf-8">      
        <meta name="description" content="Description goes here">
        <meta name="keywords" content="Keywords goes here">     

        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/preview.css" type="text/css">
        <link rel="stylesheet" href="form.css" type="text/css">
        <script type="text/javascript" src="js/main.js"></script>


    </head>
    <%

        String uid = "", user_photo = "", user_name = "", user_email = "", user_address = "", user_contact = "";

        uid = session.getAttribute("uid").toString();

        String sel = "select * from tbl_user u inner join tbl_place p on u.place_id=p.place_id inner join tbl_district dis on p.district_id=dis.district_id where user_id='" + uid + "'";
        ResultSet rs = obj.selectCommand(sel);
        if (rs.next()) {
            user_photo = rs.getString("user_photo");
            user_name = rs.getString("user_name");
            user_address = rs.getString("user_address");
            user_contact = rs.getString("user_contact");
            user_email = rs.getString("user_email");
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

                        <h1>Profile</h1>
                        <div id="tab" align="center">
                            <table border="3" align="center" cellpadding="5">
                                <tr>
                                    <td colspan="2" align="center"><img style="border-radius: 50%" src="../Assets/User_Photo/<%=rs.getString("user_photo")%>" width="100" height="100"></td>
                                </tr>


                                <tr>
                                    <td>Name</td>
                                    <td><%=user_name%></td>
                                </tr>  
                                <tr>
                                    <td> Address</td>
                                    <td> <%=user_address%></td>
                                </tr>

                                <tr>
                                    <td>Contact</td>
                                    <td><%=user_contact%></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><%=user_email%></td>
                                </tr>

                                <tr>
                                    <td>Place</td>
                                    <td><%=rs.getString("place_name")%></td>
                                </tr>

                                <tr> 
                                    <td>District</td>
                                    <td><%=rs.getString("district_name")%></td>
                                </tr>

                            </table>
                        </div>

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