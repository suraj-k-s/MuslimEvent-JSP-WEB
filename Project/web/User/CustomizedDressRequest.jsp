<%@page import="java.sql.*"%>
<jsp:useBean class="DBConnection.ConnectionClass" id="obj"></jsp:useBean>
    <!DOCTYPE HTML>
    <html lang="en">
        <head>
             <title>Customized dress Request</title>
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
       
           
            String dressfeature="",dressmaterial="",dresssize="",dressrate="";
           
           
           
            String msg="";
           
            if(request.getParameter("btnsubmit")!=null)
            {
                dressfeature=request.getParameter("txtfeatures");
                dressmaterial=request.getParameter("txtdmaterial");
                dresssize=request.getParameter("txtdsize");
                dressrate=request.getParameter("txtdrate");
                
                 
                 
               
                 
               
                   String ins="insert into tbl_dressrequest(dr_material,dr_size,dr_rate,dr_requiredate,dr_feature,dr_cstatus,dr_vstatus,user_id,dresscategory_id,eventworker_id) values('"+dressmaterial+"','"+dresssize+"','"+dressrate+"',curdate(),'"+dressfeature+"',0,0,'"+session.getAttribute("uid")+"','"+request.getParameter("txtdcategory")+"','"+request.getParameter("waid")+"')";
                    //out.println(ins);
                    boolean bol= obj.executeCommand(ins);
                    if(bol==true)
                    {
                        msg="record inserted";
                    }else{
                        msg="";
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
                            <form method="POST">
            <table border="2" align="center">
                <tr>
                    <td>Dress Type</td>
                    <td>
                <select name="txtdcategory" id="txtdcategory" required="required">
                    <option value="">---select---</option>
                     <%
                   
                    String sel="select * from tbl_dresscategory";
                    ResultSet rs= obj.selectCommand(sel);
                    while (rs.next()){
                       
                        %>
                        <option value="<%=rs.getString("dresscategory_id")%>" ><%=rs.getString("dresscategory_name")%></option>
                       
                        <%
                    }
                   
               
                %>
                </select>
                </tr>
                <tr>
                <td>Dress Material</td>
                <td><textarea name="txtdmaterial" required="required"  id="txtdmaterial"></textarea>
            </tr>
            <tr>
                <td>Dress Size</td>
                <td><input type="text" name="txtdsize" required="required" autocomplete="off" id="txtdsize"></td>
            </tr>
                <tr>
                <td>Features</td>
                <td><textarea name="txtfeatures" required="required"  id="txtfeatures"></textarea>
            </tr>
           
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" id="btnsubmit" value="Send Request">
                 
                    </td>
                <tr>
            </table>  
            <table border="2" align="center">
            <tr>
                <td>SI.NO</td>
                <td>Dress Type</td>
                <td>Material</td>
                <td>Size</td>
                <td>Features</td>
               
               
            </tr>
            <%

                int i = 0;
                String sel2 = "select * from tbl_dressrequest g inner join tbl_dresscategory p on g.dresscategory_id=p.dresscategory_id where user_id='"+session.getAttribute("uid")+"'"; 
                ResultSet rs2 = obj.selectCommand(sel2);
                while (rs2.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs2.getString("dresscategory_name")%></td>
                <td><%=rs2.getString("dr_material")%></td>
                  <td><%=rs2.getString("dr_size")%></td>
                    <td><%=rs2.getString("dr_feature")%></td>
             
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









