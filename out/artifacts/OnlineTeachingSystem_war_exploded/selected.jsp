<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="View.SelectedView"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Blank | Creative - Bootstrap 3 Responsive Admin Template</title>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="styl  esheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
  </head>

  <body>
  <!-- container section start -->
  <section id="container" class="">
      <!--header start-->
      
      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
            </div>

            <!--logo start-->
            <a href="index.jsp" class="logo">网上教学 <span class="lite">系统</span></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    全部 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">全部</a></li>
                                    <li><a href="#">课程信息</a></li>
                                    <li><a href="#">文章</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">课件</a></li>
                                </ul>
                            </div><!-- /btn-group -->
                            <input type="submit" class="btn btn-success" href="" title="Bootstrap 3 themes generator" value="搜索"></input>
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    <!-- task notificatoin start -->
                    <%--<li id="task_notificatoin_bar" class="dropdown">--%>
                        <%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
                            <%--<span class="icon-task-l"></span>--%>
                            <%--<span class="badge bg-important">5</span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu extended tasks-bar">--%>
                            <%--<div class="notify-arrow notify-arrow-blue"></div>--%>
                            <%--<li>--%>
                                <%--<p class="blue">You have 5 pending tasks</p>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<div class="task-info">--%>
                                        <%--<div class="desc">Design PSD </div>--%>
                                        <%--<div class="percent">90%</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="progress progress-striped">--%>
                                        <%--<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">--%>
                                            <%--<span class="sr-only">90% Complete (success)</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<div class="task-info">--%>
                                        <%--<div class="desc">--%>
                                            <%--Project 1--%>
                                        <%--</div>--%>
                                        <%--<div class="percent">30%</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="progress progress-striped">--%>
                                        <%--<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">--%>
                                            <%--<span class="sr-only">30% Complete (warning)</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<div class="task-info">--%>
                                        <%--<div class="desc">Digital Marketing</div>--%>
                                        <%--<div class="percent">80%</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="progress progress-striped">--%>
                                        <%--<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">--%>
                                            <%--<span class="sr-only">80% Complete</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<div class="task-info">--%>
                                        <%--<div class="desc">Logo Designing</div>--%>
                                        <%--<div class="percent">78%</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="progress progress-striped">--%>
                                        <%--<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%">--%>
                                            <%--<span class="sr-only">78% Complete (danger)</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<div class="task-info">--%>
                                        <%--<div class="desc">Mobile App</div>--%>
                                        <%--<div class="percent">50%</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="progress progress-striped active">--%>
                                        <%--<div class="progress-bar"  role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">--%>
                                            <%--<span class="sr-only">50% Complete</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>

                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li class="external">--%>
                                <%--<a href="#">See All Tasks</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <!-- task notificatoin end -->
                    <!-- inbox notificatoin start-->
                    <%--<li id="mail_notificatoin_bar" class="dropdown">--%>
                        <%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
                            <%--<i class="icon-envelope-l"></i>--%>
                            <%--<span class="badge bg-important">5</span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu extended inbox">--%>
                            <%--<div class="notify-arrow notify-arrow-blue"></div>--%>
                            <%--<li>--%>
                                <%--<p class="blue">You have 5 new messages</p>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="photo"><img alt="avatar" src="./img/avatar-mini.jpg"></span>--%>
                                    <%--<span class="subject">--%>
                                    <%--<span class="from">Greg  Martin</span>--%>
                                    <%--<span class="time">1 min</span>--%>
                                    <%--</span>--%>
                                    <%--<span class="message">--%>
                                        <%--I really like this admin panel.--%>
                                    <%--</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="photo"><img alt="avatar" src="./img/avatar-mini2.jpg"></span>--%>
                                    <%--<span class="subject">--%>
                                    <%--<span class="from">Bob   Mckenzie</span>--%>
                                    <%--<span class="time">5 mins</span>--%>
                                    <%--</span>--%>
                                    <%--<span class="message">--%>
                                     <%--Hi, What is next project plan?--%>
                                    <%--</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="photo"><img alt="avatar" src="./img/avatar-mini3.jpg"></span>--%>
                                    <%--<span class="subject">--%>
                                    <%--<span class="from">Phillip   Park</span>--%>
                                    <%--<span class="time">2 hrs</span>--%>
                                    <%--</span>--%>
                                    <%--<span class="message">--%>
                                        <%--I am like to buy this Admin Template.--%>
                                    <%--</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="photo"><img alt="avatar" src="./img/avatar-mini4.jpg"></span>--%>
                                    <%--<span class="subject">--%>
                                    <%--<span class="from">Ray   Munoz</span>--%>
                                    <%--<span class="time">1 day</span>--%>
                                    <%--</span>--%>
                                    <%--<span class="message">--%>
                                        <%--Icon fonts are great.--%>
                                    <%--</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">See all messages</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <!-- inbox notificatoin end -->
                    <!-- alert notification start-->
                    <%--<li id="alert_notificatoin_bar" class="dropdown">--%>
                        <%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>

                            <%--<i class="icon-bell-l"></i>--%>
                            <%--<span class="badge bg-important">7</span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu extended notification">--%>
                            <%--<div class="notify-arrow notify-arrow-blue"></div>--%>
                            <%--<li>--%>
                                <%--<p class="blue">You have 4 new notifications</p>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="label label-primary"><i class="icon_profile"></i></span> --%>
                                    <%--Friend Request--%>
                                    <%--<span class="small italic pull-right">5 mins</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="label label-warning"><i class="icon_pin"></i></span>  --%>
                                    <%--John location.--%>
                                    <%--<span class="small italic pull-right">50 mins</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="label label-danger"><i class="icon_book_alt"></i></span> --%>
                                    <%--Project 3 Completed.--%>
                                    <%--<span class="small italic pull-right">1 hr</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">--%>
                                    <%--<span class="label label-success"><i class="icon_like"></i></span> --%>
                                    <%--Mick appreciated your work.--%>
                                    <%--<span class="small italic pull-right"> Today</span>--%>
                                <%--</a>--%>
                            <%--</li>                            --%>
                            <%--<li>--%>
                                <%--<a href="#">See all notifications</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span>
                            <span class="username">苦逼学生A</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i> 我的资料</a>
                            </li>
                            <%--<li>--%>
                                <%--<a href="#"><i class="icon_mail_alt"></i> My Inbox</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#"><i class="icon_clock_alt"></i> Timeline</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#"><i class="icon_chat_alt"></i> Chats</a>--%>
                            <%--</li>--%>
                            <li>
                                <a href="login.jsp"><i class="icon_key_alt"></i> 登出</a>
                            </li>
                            <%--<li>--%>
                                <%--<a href="documentation.jsp"><i class="icon_key_alt"></i> Documentation</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="documentation.jsp"><i class="icon_key_alt"></i> Documentation</a>--%>
                            <%--</li>--%>
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
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="">
                      <a class="" href="index.jsp">
                          <i class="icon_house_alt"></i>
                          <span>首页</span>
                      </a>
                  </li>
				  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Forms</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="form_component.jsp">Form Elements</a></li>
                          <li><a class="" href="form_validation.jsp">Form Validation</a></li>
                      </ul>
                  </li>       
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>UI Fitures</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="general.jsp">Components</a></li>
                          <li><a class="" href="buttons.jsp">Buttons</a></li>
                          <li><a class="" href="grids.jsp">Grids</a></li>
                      </ul>
                  </li>
                  <li>
                      <a class="" href="widgets.jsp">
                          <i class="icon_genius"></i>
                          <span>Widgets</span>
                      </a>
                  </li>
                  <li>                     
                      <a class="" href="chart-chartjs.jsp">
                          <i class="icon_piechart"></i>
                          <span>Charts</span>
                          
                      </a>
                                         
                  </li>
                             
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_table"></i>
                          <span>Tables</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="basic_table.jsp">Basic Table</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu ">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Pages</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">                          
                          <li><a class="" href="profile.jsp">Profile</a></li>
                          <li><a class="" href="login.jsp"><span>Login Page</span></a></li>
                          <li><a class="active" href="blank.jsp">Blank Page</a></li>
                          <li><a class="" href="404.jsp">404 Error</a></li>
                      </ul>
                  </li>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->

      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Pages</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
						<li><i class="fa fa-bars"></i>Pages</li>
						<li><i class="fa fa-square-o"></i>Pages</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
       <div class="row">
                                    <div class="col-lg-12">
                                        <section class="panel">
                                            <header class="panel-heading no-border">
                                                已选课程
                                            </header>
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>课程名称</th>
                                                    <th>开课老师</th>
                                                    <th>所选班级</th>
                                                    <th>老师邮箱</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                      <%
                                      List<SelectedView> selectedViews = (ArrayList<SelectedView>)ActionContext.getContext().getSession().get("selectedViews");
                                      for(SelectedView s : selectedViews){
                                      %>
                                      <tr>
                                        <td><%=s.getId()%></td>
                                        <td><%=s.getOffered().getCourse().getName()%></td>
                                        <td><%=s.getOffered().getTeacher().getName()%></td>
                                        <td><%=s.getClass1().getName()%></td>
                                        <td><%=s.getOffered().getTeacher().getEmail()%></td>
                                      </tr>
                                      <%
                                      }
                                      %>
                                          </tbody>
                                            </table>
                                        </section>
                                    </div>
                                </div>
                            </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
    <script src="js/scripts.js"></script>


  </body>
</html>
