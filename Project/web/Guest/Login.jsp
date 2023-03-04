


<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en"> <jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
        <head>
        <%
            if (request.getParameter("btn_Login") != null) {

                String Selz = "select * from tbl_admin where admin_username='" + request.getParameter("uname") + "' and admin_password='" + request.getParameter("pname") + "'";
                ResultSet rsz = obj.selectCommand(Selz);

                String Sel = "select * from tbl_user where user_username='" + request.getParameter("uname") + "' and user_password='" + request.getParameter("pname") + "'";
                ResultSet rs = obj.selectCommand(Sel);

                String Sel1 = "select * from tbl_eventorg where eventorg_username='" + request.getParameter("uname") + "' and eventorg_password='" + request.getParameter("pname") + "'";
                ResultSet rs1 = obj.selectCommand(Sel1);

                String Sel2 = "select * from tbl_eventworkers where eventworker_username='" + request.getParameter("uname") + "' and eventworker_password='" + request.getParameter("pname") + "'";
                ResultSet rs2 = obj.selectCommand(Sel2);

                String Sel3 = "select * from tbl_hpbranch where hpbranch_username='" + request.getParameter("uname") + "' and hpbranch_password='" + request.getParameter("pname") + "'";
                ResultSet rs3 = obj.selectCommand(Sel3);

                if (rs.next()) {

                    session.setAttribute("uid", rs.getString("user_id"));
                    session.setAttribute("uname", rs.getString("user_name"));

                    response.sendRedirect("../User/index.html");
                } else if (rs1.next()) {

                    session.setAttribute("eid", rs1.getString("eventorg_id"));
                    session.setAttribute("ename", rs1.getString("eventorg_name"));

                    response.sendRedirect("../Organisation/HomePage.jsp");
                } else if (rsz.next()) {

                    response.sendRedirect("../Admin/Homeage.jsp");
                } else if (rs2.next()) {

                    session.setAttribute("wid", rs2.getString("eventworker_id"));
                    session.setAttribute("wname", rs2.getString("eventworker_name"));

                    response.sendRedirect("../Worker/HomePage.jsp");
                } else if (rs3.next()) {

                    session.setAttribute("hid", rs3.getString("hpbranch_id"));
                    session.setAttribute("hname", rs3.getString("hpbranch_name"));

                    response.sendRedirect("../Branch/HomePage.jsp");
                } else {
                    out.println("<script>alert('Invalid User')</script>");
                }
            }
        %>

        <title>Login V3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="Login_v3/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="Login_v3/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="Login_v3/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="Login_v3/css/util.css">
        <link rel="stylesheet" type="text/css" href="Login_v3/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <form method="post">
            <div class="limiter">
                <div class="container-login100" style="background-image: url('Login_v3/images/bg-01.jpg');">
                    <div class="wrap-login100">
                        <form class="login100-form validate-form">
                            <span class="login100-form-logo">
                                <i class="zmdi zmdi-landscape"></i>
                            </span>

                            <span class="login100-form-title p-b-34 p-t-27">
                                Log in
                            </span>

                            <div class="wrap-input100 validate-input" data-validate = "Enter username">
                                <input class="input100" type="text" name="uname" placeholder="Username">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>

                            <div class="wrap-input100 validate-input" data-validate="Enter password">
                                <input class="input100" type="password" name="pname" placeholder="Password">
                                <span class="focus-input100" data-placeholder="&#xf191;"></span>
                            </div>

                            <div class="container-login100-form-btn">
                                <button type="submit" name="btn_Login" class="login100-form-btn">
                                    Login
                                </button>
                            </div>
                            <div class="text-center p-t-90">
                                <a class="txt1" href="signup.html">
                                    Sign Up ->
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <div id="dropDownSelect1"></div>
        </form>
        <!--===============================================================================================-->
        <script src="Login_v3/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_v3/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_v3/vendor/bootstrap/js/popper.js"></script>
        <script src="Login_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_v3/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="Login_v3/vendor/daterangepicker/moment.min.js"></script>
        <script src="Login_v3/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="Login_v3/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="Login_v3/js/main.js"></script>

    </body>
</html>