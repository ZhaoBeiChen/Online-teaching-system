<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<%@page import="Model.Course" %>
<%@page import="com.opensymphony.xwork2.ActionContext" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>首页 - 网上教学系统</title>

<!-- javascripts -->
<script src="js/jquery.js"></script>
<script src="js/jquery-ui-1.10.4.min.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- charts scripts -->
<script src="assets/jquery-knob/js/jquery.knob.js"></script>
<script src="js/jquery.sparkline.js" type="text/javascript"></script>
<script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
<script src="js/owl.carousel.js"></script>
<!-- jQuery full calendar -->
<
<script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
<!--script for this page only-->
<script src="js/calendar-custom.js"></script>
<script src="js/jquery.rateit.min.js"></script>
<!-- custom select -->
<script src="js/jquery.customSelect.min.js"></script>
<script src="assets/chart-master/Chart.js"></script>

<!--custome script for all page-->
<script src="js/scripts.js"></script>
<!-- custom script for this page-->
<script src="js/sparkline-chart.js"></script>
<script src="js/easy-pie-chart.js"></script>
<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="js/jquery-jvectormap-world-mill-en.js"></script>
<script src="js/xcharts.min.js"></script>
<script src="js/jquery.autosize.min.js"></script>
<script src="js/jquery.placeholder.min.js"></script>
<script src="js/gdp-data.js"></script>
<script src="js/morris.min.js"></script>
<script src="js/sparklines.js"></script>
<script src="js/charts.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script>

    //knob
    $(function () {
        $(".knob").knob({
            'draw': function () {
                $(this.i).val(this.cv + '%')
            }
        })
    });

    //carousel
    $(document).ready(function () {
        $("#owl-slider").owlCarousel({
            navigation: true,
            slideSpeed: 300,
            paginationSpeed: 400,
            singleItem: true

        });
    });

    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

    /* ---------- Map ---------- */
    $(function () {
        $('#map').vectorMap({
            map: 'world_mill_en',
            series: {
                regions: [{
                    values: gdpData,
                    scale: ['#000', '#000'],
                    normalizeFunction: 'polynomial'
                }]
            },
            backgroundColor: '#eef3f7',
            onLabelShow: function (e, el, code) {
                el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
            }
        });
    });


</script>
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet"/>
    <link href="css/font-awesome.css" rel="stylesheet"/>
    <!-- full calendar css-->
    <link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet"/>
    <link href="assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet"/>
    <!-- easy pie chart-->
    <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"
          media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
    <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
    <link rel="stylesheet" href="css/fullcalendar.css">
    <link href="css/widgets.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>
    <link href="css/xcharts.min.css" rel=" stylesheet">
    <link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
<%
    String username = (String) ActionContext.getContext().getSession().get("username");
    String usertype = (String) ActionContext.getContext().getSession().get("usertype");
    if (usertype == null) {
        response.getWriter().print("<script>alert('请先登录!');window.location.href='/login.jsp'</script>");
        return;
    }
%>
<!-- container section start -->
<section id="container" class="">


    <header class="header dark-bg">
        <div class="toggle-nav">
            <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
        </div>

        <!--logo start-->
        <a href="/Index" class="logo">网上教学 <span class="lite">系统</span></a>
        <!--logo end-->

        <div class="nav search-row" id="top_menu">
            <!--  search form start -->
            <ul class="nav top-menu">
                <li>
                    <form class="navbar-form" action="Search" method="post">
                        <input name="keyword" class="form-control" placeholder="Search" type="text">
                        <select name="condition" class="btn btn-primary selectpicker">
                            <option value="all">全部</option>
                            <option value="article">文章</option>
                            <option value="courseware">课件</option>
                            <option value="course">课程相关</option>
                        </select>
                        <input type="submit" class="btn btn-success" href="" title="Bootstrap 3 themes generator"
                               value="搜索"></input>
                    </form>
                </li>
            </ul>
            <!--  search form end -->
        </div>

        <div class="top-nav notification-row">
            <!-- notificatoin dropdown start-->
            <ul class="nav pull-right top-menu">
                <!-- alert notification end-->
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span>
                        <span class="username"><%=username%></span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <div class="log-arrow-up"></div>
                        <li class="eborder-top">
                            <a href="personalInformation.jsp"><i class="icon_profile"></i> 我的资料</a>
                        </li>
                        <li>
                            <a href="/Logout"><i class="icon_key_alt"></i> 登出</a>
                        </li>
                    </ul>
                </li>
                <!-- user login dropdown end -->
            </ul>
            <!-- notificatoin dropdown end-->
        </div>
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="active">
                    <a class="" href="/Index">
                        <i class="icon_house_alt"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_document_alt"></i>
                        <span>文章</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="/Articles">查看文章</a></li>
                        <%
                            if (usertype != null && (usertype.equals("teacher"))) {
                        %>
                        <li><a class="" href="/articlesadd.jsp">添加文章</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_desktop"></i>
                        <span>课件</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="/Coursewares">查看课件</a></li>
                        <%
                            if (usertype != null && (usertype.equals("teacher"))) {
                        %>
                        <li><a class="" href="coursewaresadd.jsp">添加课件</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_genius"></i>
                        <span>课程信息</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="/Courses">查看课程</a></li>
                        <%
                            if (usertype != null && (usertype.equals("admin"))) {
                        %>
                        <li><a class="" href="coursesadd.jsp">添加课程</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_piechart"></i>
                        <span>开课信息</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="/Offered">查看开课</a></li>
                        <%
                            if (usertype != null && (usertype.equals("admin"))) {
                        %>
                        <li><a class="" href="offeredadd.jsp">添加开课</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_table"></i>
                        <span>已选课程</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="/Selected">查看已选</a></li>
                        <%
                            if (usertype != null && (usertype.equals("admin"))) {
                        %>
                        <li><a class="" href="selectedadd.jsp">添加已选</a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <%
                    if (usertype != null && (usertype.equals("teacher"))) {
                %>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_table"></i>
                        <span>消息管理</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="ClassListForMessage">发布消息</a></li>
                        <li><a class="" href="MessageList">消息列表</a></li>
                    </ul>
                </li>
                <%
                    }
                %>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-laptop"></i> 首页</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.jsp">首页</a></li>
                        <li><i class="fa fa-laptop"></i>统计</li>
                    </ol>
                </div>
            </div>
                          <script>
                            $(document).ready(function(){
                                $.get("/JSONCounts",function(data,status){
                                $("#userCount").html(data.countView.userCount);
                                $("#offeredCount").html(data.countView.offeredCount);
                                $("#articleCount").html(data.countView.articleCount);
                                $("#coursewareCount").html(data.countView.coursewareCount);
                                });
                                $.get("/JSONMessages",function(data,status){
                                var length=0;
                                for(var key in data.messageViewList){
                                   length++;
                                }
                                for(var i = 0 ; i < length ; i++){
                                    $("#msg"+(i+1)+"-title").text(data.messageViewList[i].name+" - "+data.messageViewList[i].author.name);
                                    $("#msg"+(i+1)+"-content").text(data.messageViewList[i].content);
                                    }
                                });
                            });
                          </script>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="info-box blue-bg">
                        <i class="fa fa-users"></i>
                        <div class="count" id="userCount">6</div>
                        <div class="title">用户数</div>
                    </div><!--/.info-box-->
                </div><!--/.col-->

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="info-box brown-bg">
                        <i class="fa fa-book"></i>
                        <div class="count" id="offeredCount">7</div>
                        <div class="title">开设课程</div>
                    </div><!--/.info-box-->
                </div><!--/.col-->

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="info-box dark-bg">
                        <i class="fa fa-paperclip"></i>
                        <div class="count" id="articleCount">4</div>
                        <div class="title">文章数</div>
                    </div><!--/.info-box-->
                </div><!--/.col-->

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="info-box green-bg">
                        <i class="fa fa-cloud-download"></i>
                        <div class="count" id="coursewareCount">1</div>
                        <div class="title">课件数</div>
                    </div><!--/.info-box-->
                </div><!--/.col-->


            </div><!--/.row-->

            <div class="panel-group m-bot20" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" id="msg1-title" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseOne">
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" id="msg1-content">
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" id="msg2-title" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseTwo">
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body" id="msg2-content">
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" id="msg3-title" data-toggle="collapse" data-parent="#accordion"
                               href="#collapseThree">
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body" id="msg3-content">
                        </div>
                    </div>
                </div>
            </div>

            <%--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/">免费网站模板</a></div>--%>


            <div class="row">
                <div class="col-lg-9 col-md-12">

                    <%--<div class="panel panel-default">--%>
                    <%--<div class="panel-heading">--%>
                    <%--<h2><i class="fa fa-map-marker red"></i><strong>Countries</strong></h2>--%>
                    <%--<div class="panel-actions">--%>
                    <%--<a href="index.jsp#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>--%>
                    <%--<a href="index.jsp#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>--%>
                    <%--<a href="index.jsp#" class="btn-close"><i class="fa fa-times"></i></a>--%>
                    <%--</div>	--%>
                    <%--</div>--%>
                    <%--<div class="panel-body-map">--%>
                    <%--<div id="map" style="height:380px;"></div>	--%>
                    <%--</div>--%>
                    <%----%>
                    <%--</div>--%>
                </div>
                <div class="col-md-3">

                </div>


            </div>


            <!-- Today status end -->


            <div class="row">

                <div class="col-lg-9 col-md-12">

                </div><!--/col-->
                <div class="col-md-3">


                </div>
                <div class="col-md-3">



                </div><!--/col-->
                <div class="col-md-3">



                </div><!--/col-->

            </div>


            <!-- statics end -->


            <!-- project team & activity start -->
            <div class="row">
                <div class="col-md-4 portlets">

                </div>

                <div class="col-lg-8">

                </div>
            </div>
            <br><br>

            <div class="row">
                <div class="col-md-6 portlets">


                </div>

                <div class="col-md-6 portlets">


                </div>

            </div>
            <!-- project team & activity end -->

        </section>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

</body>
</html>
