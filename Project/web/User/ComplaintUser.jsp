<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
            <title>Complaint User Forum</title>
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

        String complaintcontent = "";
        String complaints = "";
        String complainttype = "";
        String complaintdata = "";

        String msg = "";

        if (request.getParameter("btnsubmit") != null) {
            complaintcontent = request.getParameter("txtcomplaintcontent");

            complainttype = request.getParameter("txtcomplainttype");

            complaintdata = request.getParameter("txtcomplaintdata");

            String ins = "insert into tbl_complaints(complaint_content,complainttype_id,complaint_data,complaint_date,user_id) values('" + complaintcontent + "','" + complainttype + "','" + complaintdata + "',curdate(),'" + session.getAttribute("uid") + "')";
            //out.println(ins);
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
                                        <td>Complaint Type</td> 

                                        <td>
                                            <select name="txtcomplainttype" id="txtcomplainttype">
                                                <option value="">----select----</option>
                                                <%                                String Sel = "select*from tbl_complainttype";
                                                    ResultSet rs = obj.selectCommand(Sel);
                                                    while (rs.next()) {
                                                %>

                                                <option value="<%=rs.getString("complainttype_id")%>"> <%=rs.getString("complainttype_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                    </tr>

                                    <tr>
                                        <td>Complaint Content</td>
                                        <td><input type="txtcomplaintcontent" name="txtcomplaintcontent" required="required" autocomplete="off" id="txtcomplaintcontent"></textarea></td>
                                    </tr>
                                    </tr>

                                    <tr>
                                        <td>Complaint Data</td>
                                        <td><textarea name="txtcomplaintdata" id="txtcomplaintdata"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" cellpadding="5">
                                            <input type="SUBMIT" name="btnsubmit" id="btnsubmit" value="Send Complaint">
                                        </td>
                                    </tr>
                                </table>
                                <table border="2" align="center">

                                    <tr>
                                        <td>SI.NO</td>

                                        <td>Type</td>
                                        <td>Content</td>
                                        <td>Date</td>
                                        <td>Data</td>
                                        <td>Reply</td>
                                        <td>Reply Date</td>
                                    </tr>
                                    <%                     int j14 = 0;
                                        String sel14 = "select * from tbl_complaints c inner join tbl_complainttype t on t.complainttype_id=c.complainttype_id inner join tbl_user cf on c.user_id=cf.user_id where c.user_id='" + session.getAttribute("uid") + "'";

                                        ResultSet rs14 = obj.selectCommand(sel14);
                                        while (rs14.next()) {

                                            j14++;
                                    %>

                                    <tr>
                                        <td><%=j14%></td>

                                        <td><%=rs14.getString("complainttype_name")%></td>

                                        <td><%=rs14.getString("complaint_content")%></td>

                                        <td><%=rs14.getString("complaint_date")%></td>

                                        <td><%=rs14.getString("complaint_data")%></td>

                                        <td><%=rs14.getString("complaint_reply")%></td>

                                        <td><%=rs14.getString("complaint_replydate")%></td>

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









