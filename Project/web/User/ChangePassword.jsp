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

        String uid = "", user_CurrentPassword = "", current_password = "", New_password = "", Confirm_password = "";

        uid = session.getAttribute("uid").toString();
        if (request.getParameter("btn_save") != null) {
            current_password = request.getParameter("txtcurrentPassword");
            New_password = request.getParameter("txtnewpassword");
            Confirm_password = request.getParameter("txtconfirmpassword");

            String sel = "select * from tbl_user where user_id='" + uid + "'";
            ResultSet rs = obj.selectCommand(sel);
            if (rs.next()) {

                user_CurrentPassword = rs.getString("user_password");

            }

            if (user_CurrentPassword.equals(current_password)) {
                if (New_password.equals(Confirm_password)) {

                    String up = "update tbl_user set user_password='" + New_password + "'where user_id='" + uid + "'";
                    boolean success = obj.executeCommand(up);
                    if (success) {
                        out.println("<script>alert('successfully updated')</script>");

                    } else {
                        out.println("<script>alert('failed to update')</script>");

                    }
                } else {
                    out.println("<script>alert('confirmPassword mismatched')</script>");
                }
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

                        <h1>Change Password</h1>
                        <div id="tab" align="center">
                            <br><br>
                            <form id="form2" name="form2" method="post" action="">
                                <table border="3" align="center" cellpadding="5">
                                    <tr>
                                        <td>
                                            Current Password
                                        </td>
                                        <td><input type="password" id="password" name="txtcurrentPassword" ></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            New Password
                                        </td>
                                        <td>
                                            <input type="password" name="txtnewpassword" id="newpassword">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Confirm Password
                                        </td>
                                        <td>
                                            <input type="password" name="txtconfirmpassword" id="confirmpassword">

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" name="btn_save" value="Update">

                                            <input type="reset" name="cancel" value="Cancel">
                                        </td>
                                    </tr>



                            </form>
                            </table>
                                <br><br>
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