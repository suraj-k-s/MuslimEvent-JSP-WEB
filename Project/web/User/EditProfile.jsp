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
        String sel = "select * from tbl_user where user_id='" + uid + "'";
        ResultSet rs = obj.selectCommand(sel);
        if (rs.next()) {
            user_photo = rs.getString("user_photo");
            user_name = rs.getString("user_name");
            user_address = rs.getString("user_address");
            user_contact = rs.getString("user_contact");
            user_email = rs.getString("user_email");
        }

        if (request.getParameter("btn_Save") != null) {
            String up = "update tbl_user  set user_photo='" + request.getParameter("txtfile") + "' , user_name='" + request.getParameter("txtname") + "' ,user_address='" + request.getParameter("txtaddress") + "', user_contact='" + request.getParameter("txtcontact") + "', user_email='" + request.getParameter("txtemail") + "' where user_id='" + uid + "'";
            boolean success = obj.executeCommand(up);
            if (success) {
                out.println("<script> alert('Successfully Updated')</script>");

            } else {
                out.println("<script> alert('Failed to update')</script>");
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

                        <h1>Edit Profile</h1>
                        <div id="tab" align="center"><br><br>
                            <form id="form2" name="form2" method="post" action="">
                                <table border="3" align="center" cellpadding="5">
                                    <tr>
                                        <td>Photo</td>

                                        <td><input type="file" name="txtfile"  id=" user_photo" value="<%= user_photo%>"</td></tr>  


                                    <tr>
                                        <td>Name</td>

                                        <td><input type="text" name="txtname"  id="user_name" value="<%=user_name%>"</td></tr>  

                                    <tr>
                                        <td> Address</td>
                                        <td><textarea name="txtaddress" id="user_address"><%=user_address%></textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Contact</td>
                                        <td><input type="text" name="txtcontact" id="user_contact" value="<%=user_contact%>"
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input type="email" name="txtemail" id="user_email" value="<%=user_email%>"
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="Submit" id="btn_Save" name="btn_Save" value="Update">
                                        
                                            <input type="Reset" id="user_Cancel" name="btn_Cancel" value="Cancel">
                                        </td>

                                </table>
                            </form><br><br>
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