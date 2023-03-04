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
              <a href="District.jsp">District
              </a>
          </li>
           <li class="sub-menu">
               <a href="Place.jsp">Place
              </a>
          </li>
          <li class="sub-menu">
               <a href="Complainttype.jsp">Complaint Type
              </a>
          </li>
          <li class="sub-menu">
               <a href="Designation.jsp">Designation
              </a>
          </li>
          
          <li class="sub-menu">
               <a href="Dresscategory.jsp">Dress Category
              </a>
          </li>
           <li class="sub-menu">
               <a href="Eventorgcategory.jsp">Event Organization Category
              </a>
          </li>
          <li class="sub-menu">
               <a href="Eventworkcategory.jsp">Event Worker Category
              </a>
          </li>
           <li class="sub-menu">
               <a href="GiftType.jsp">Gift Type
              </a>
          </li>
           <li class="sub-menu">
               <a href="ProductCategory.jsp">Product Category
              </a>
          </li>
          <li class="sub-menu">
               <a href="PackageCategory.jsp">Package Category
              </a>
          </li>
          <li class="sub-menu">
               <a href="NewHpBranchList.jsp">HP Branch List
              </a>
          </li>
          <li class="sub-menu">
               <a href="EventOrganizationList.jsp">Event Organization List
              </a>
          </li>
          <li class="sub-menu">
               <a href="EventWorkersList.jsp">Event Workers List
              </a>
          </li>
          <li class="sub-menu">
               <a href="GiftGallery.jsp">Gift Gallery
              </a>
          </li>
          <li class="sub-menu">
               <a href="GiftProducts.jsp">Gift Products
              </a>
          </li>
          <li class="sub-menu">
               <a href="Reply.jsp">Reply
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewComplaints.jsp">View Complaints
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewCustomisedGiftRequest.jsp">View Customized Gift Request
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewEventWorkersList.jsp">View Event Workers List
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewEventworkerPackages.jsp">View Event worker Packages
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewGiftOrders.jsp">View Gift Orders
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewOrganizationList.jsp">View Organization List
              </a>
          </li>
           <li class="sub-menu">
               <a href="ViewOrganizationPackages.jsp">View Organization Packages
              </a>
          </li>
             <li class="sub-menu">
               <a href="ViewgiftRequest.jsp">View Gift Request
              </a>
          </li>
        
      </div>
    </aside>
          
          
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>USER VISITS</h3>
            </div>
            <div class="custom-bar-chart">
              <ul class="y-axis">
                <li><span>10.000</span></li>
                <li><span>8.000</span></li>
                <li><span>6.000</span></li>
                <li><span>4.000</span></li>
                <li><span>2.000</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">JAN</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">FEB</div>
                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">MAR</div>
                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">APR</div>
                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">MAY</div>
                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">JUN</div>
                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
              <div class="bar">
                <div class="title">JUL</div>
                <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div>
              </div>
            </div>
            <!--custom chart end-->
            <div class="row mt">
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>SERVER LOAD</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 70,
                        color: "#FF6B6B"
                      },
                      {
                        value: 30,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>Usage<br/>Increase:</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>21%</h2>
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>DROPBOX STATICS</h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 60,
                        color: "#1c9ca7"
                      },
                      {
                        value: 40,
                        color: "#f68275"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p>April 17, 2019</p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                    </div>
                    <div class="pull-right">
                      <h5>60% Used</h5>
                    </div>
                  </footer>
                </div>
                <!--  /darkblue panel -->
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <!-- REVENUE PANEL -->
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>USAGE</h5>
                  </div>
                  <div class="chart mt">
                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                  </div>
                  <p class="mt"><br/>Monthly</p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
            <div class="row">
              <!-- WEATHER PANEL -->
             
              <!-- /col-md-4-->
             
              </div>
              <!-- /col-md-8  -->
            </div>
            
          <div class="col-lg-3 ds">
            <!--COMPLETED ACTIONS DONUTS CHART-->
            <div class="donut-main">
              <h4>COMPLETED ACTIONS & PROGRESS</h4>
              <canvas id="newchart" height="130" width="130"></canvas>
              <script>
                var doughnutData = [{
                    value: 70,
                    color: "#4ECDC4"
                  },
                  {
                    value: 30,
                    color: "#fdfdfd"
                  }
                ];
                var myDoughnut = new Chart(document.getElementById("newchart").getContext("2d")).Doughnut(doughnutData);
              </script>
            </div>
            <!--NEW EARNING STATS -->
            <div class="panel terques-chart">
              <div class="panel-body">
                <div class="chart">
                  <div class="centered">
                   
                  </div>
                  <br>
                  <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
                </div>
              </div>
            </div>
           
            <!-- CALENDAR-->
            <div id="calendar" class="mb">
              <div class="panel green-panel no-margin">
                <div class="panel-body">
                  <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                    <div class="arrow"></div>
                    <h3 class="popover-title" style="disadding: none;"></h3>
                    <div id="date-popover-content" class="popover-content"></div>
                  </div>
                  <div id="my-calendar"></div>
                </div>
              </div>
            </div>
            <!-- / calendar -->
          </div>
          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>CoffeeMates</strong>. All Rights Reserved
        </p>
       
        <a href="temp4/index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
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
