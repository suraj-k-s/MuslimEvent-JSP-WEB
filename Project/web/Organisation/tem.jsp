<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Coffee Mates-Admin</title>

  <link href="temp4/img/favicon.png" rel="icon">
  <link href="temp4/img/apple-touch-icon.png" rel="apple-touch-icon">

  
  <link href="temp4/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
  <link href="temp4/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="temp4/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="temp4/lib/gritter/css/jquery.gritter.css" />
  <link rel="stylesheet" type="text/css" href="temp4/form.css">
  <link href="temp4/css/style.css" rel="stylesheet">
  <link href="temp4/css/style-responsive.css" rel="stylesheet">
  <script src="temp4/lib/chart-master/Chart.js"></script>

</head>

<body>
  <section id="container">
   
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
     
      <a href="temp4/index.html" class="logo"><b>Coffee<span>Mates</span></b></a>
     
          
        </ul>
       
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <li><a class="logout" href="../Guest/Login.jsp">Logout</a></li>
        </ul>
      </div>
    </header>
   <aside>
      <div id="sidebar" class="nav-collapse ">
    
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><img src="temp4/img/favicon1.png" class="img-circle" width="80"></p>
          <h5 class="centered">Admin</h5>
          <li class="mt">
              <a class="active" href="Homepage.jsp">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
          
          <li class="sub-menu">
               <a href="MyProfile.jsp">My Profile 
              </a>
          <li class="sub-menu">
              <a href="EditProfile.jsp">Edit Profile
              </a>
          </li>
          <li class="sub-menu">
               <a href="ChangePassword.jsp">Change Password 
              </a>
          </li>
          <li class="sub-menu">
              <a href="AddOrganizationPackages.jsp">Add Package
              </a>
          
          </li>
          <li class="sub-menu">
              <a href="ViewPackagesOrders.jsp">View Order
              </a>
          
          </li>
         
          
          <li class="sub-menu">
              <a href="ComplaintOrganization.jsp">Complaint
              </a>
          
          </li>
        
        
      </div>
    </aside>
          

<br><br><br><br><br><br><br>


   
  <script src="temp4/lib/jquery/jquery.min.js"></script>

  <script src="temp4/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="temp4/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="temp4/lib/jquery.scrollTo.min.js"></script>
  <script src="temp4/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="temp4/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="temp4/lib/common-scripts.js"></script>
  <script type="text/javascript" src="temp4/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="temp4/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="temp4/lib/sparkline-chart.js"></script>
  <script src="temp4/lib/zabuto_calendar.js"></script>
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  </script>
</body>

</html>
