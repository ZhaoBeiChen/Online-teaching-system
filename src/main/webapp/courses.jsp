<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="Model.Course"%>
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

    <title>课程信息</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!-- external css -->
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
  <%
      String username = (String)ActionContext.getContext().getSession().get("username");
      String usertype = (String)ActionContext.getContext().getSession().get("usertype");
      if(usertype==null){
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
                          <select name="condition"  class="btn btn-primary selectpicker">
                              <option value="all">全部</option>
                              <option value="article">文章</option>
                              <option value="courseware">课件</option>
                              <option value="course">课程相关</option>
                          </select>
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
                              if(usertype!=null&&(usertype.equals("teacher")))
                              {
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
                              if(usertype!=null&&(usertype.equals("teacher")))
                              {
                          %>
                              <li><a class="" href="coursewaresadd.jsp">添加课件</a></li>
                          <%
                              }
                          %>
                      </ul>
                  </li>
                  <li>
                      <a class="" href="/Courses">
                          <i class="icon_genius"></i>
                          <span>课程信息</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="/Offered"><!--chart-chartjs.jsp-->
                          <i class="icon_piechart"></i>
                          <span>开课信息</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="/Selected"><!--chart-chartjs.jsp-->
                          <i class="icon_table"></i>
                          <span>已选课程</span>
                      </a>
                  </li>
                          <%
                              if(usertype!=null&&(usertype.equals("teacher")))
                              {
                          %>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_table"></i>
                          <span>消息管理</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="publishMessage.jsp">发布消息</a></li>
                          <li><a class="" href="changeMessage.jsp">修改消息</a></li>
                      </ul>
                  </li>
                  <%
                  }
                  %>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Pages</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="profile.jsp">Profile</a></li>
                          <li><a class="" href="login.jsp"><span>Login Page</span></a></li>
                          <li><a class="" href="blank.jsp">Blank Page</a></li>
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
					<h3 class="page-header"><i class="icon_genius"></i> 课程</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.jsp">首页</a></li>
						<li><i class="icon_genius"></i>课程信息</li>
				</div>
			</div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              课程信息
                          </header>
                                      <%
                                      List<Course> courseList = (List<Course>)ActionContext.getContext().get("courseList");
                                      int i=0;
                                      for(Course c : courseList){
                                      %>
                            <div class="panel panel-default">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i%>">
                                          <%=c.getName()%>
                                                        <%

                                                        if(usertype.equals("admin")){
                                                        %>
                                                        <a class="btn btn-danger navbar-right" href="/CoursesDelete?id=<%=c.getId()%>">删除</i></a>
                                                        <%
                                                        }
                                                        %>
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapse<%=i%>" class="panel-collapse collapse in">
                                  <div class="panel-body">
                                        <pre><%=c.getContent()%></pre>
                                  </div>
                              </div>

                                                    <%
                                                    i=i+1;
                                                    }
                                                    %>

                      </section>
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
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- jquery knob -->
    <script src="assets/jquery-knob/js/jquery.knob.js"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>

  <script>

      //knob
      $(".knob").knob();

  </script>

  </body>
</html>
