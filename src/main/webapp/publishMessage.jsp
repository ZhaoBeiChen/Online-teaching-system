<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>网上教学系统</title>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
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
                          <span>文章</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="articles.jsp">查看文章</a></li>
                          <li><a class="" href="articlesadd.jsp">添加文章</a></li>
                      </ul>
                  </li>       
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>课件</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="coursewares.jsp">查看课件</a></li>
                          <li><a class="" href="coursewaresadd.jsp">添加课件</a></li>
                      </ul>
                  </li>
                  <li>
                      <a class="" href="courses.jsp.jsp">
                          <i class="icon_genius"></i>
                          <span>课程信息</span>
                      </a>
                  </li>
                  <li>                     
                      <a class="" href="offered.jsp">
                          <i class="icon_piechart"></i>
                          <span>开课信息</span>
                          
                      </a>
                                         
                  </li>
                             
                  <li class="sub-menu">
                      <a href="selected.jsp" class="">
                          <i class="icon_table"></i>
                          <span>已选课程</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <%--<ul class="sub">--%>
                          <%--<li><a class="" href="basic_table.jsp">Basic Table</a></li>--%>
                      <%--</ul>--%>
                  </li>
                  
                  <li class="sub-menu ">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>消息管理</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">                          
                          <li><a class="" href="profile.jsp">发布消息</a></li>
                          <li><a class="" href="login.jsp"><span>修改消息</span></a></li>
                          <%--<li><a class="active" href="blank.jsp">Blank Page</a></li>--%>
                          <%--<li><a class="" href="404.jsp">404 Error</a></li>--%>
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
					<h3 class="page-header"><i class="fa fa fa-bars"></i> 发布消息</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.jsp">首页</a></li>
						<li><i class="fa fa-bars"></i>发布消息</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
              <section class="panel">
                  <header class="panel-heading">
                      填写发布信息
                  </header>
                  <div class="panel-body">
                      <form class="form-horizontal " action="MessageAdd" method="post">
                          <!--date picker start-->

                          <div class="form-group">
                              <label class="control-label col-sm-4">标题</label>
                              <div class="col-sm-6">
                                  <input id="cp1" type="text" value="" name="message.name" size="16" class="form-control">
                              </div>
                          </div>

                          <div class="form-group">
                              <label class="control-label col-sm-4">内容</label>
                              <div class="col-sm-6">
                                  <div class="input-prepend">
                                      <input id="reservation" type="text" name="message.content" class=" form-control" />
                                  </div>
                              </div>
                          </div>



                          <div class="form-group">
                              <label class="control-label col-sm-4"></label>
                              <div class="col-sm-6">
                                  <div class="input-prepend">
                                      <input type="submit" class="btn btn-success btn-block" value="发布消息">
                                  </div>
                              </div>
                          </div>

                      </form>


                  </div>
              </section>

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
