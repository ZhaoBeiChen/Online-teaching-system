<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.opensymphony.xwork2.ActionContext" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>添加开课 - 网上教学系统</title>

    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
    <script src="js/scripts.js"></script>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>

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
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa fa-bars"></i> 添加开课</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.jsp">首页</a></li>
                        <li><i class="fa fa-bars"></i>添加开课</li>
                    </ol>
                </div>
            </div>
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            添加开课
                        </header>
                        <div class="panel-body">
                            <script>
                                $(document).ready(function () {
                                    $.get("/JSONCourses", function (data, status) {
                                        for (var course in data.courseNames) {
                                            $("#courseid").append("<option value='" + data.courseNames[course].id + "'>" + data.courseNames[course].name + "</option>");
                                        }
                                    });
                                    $.get("/JSONTeachers", function (data, status) {
                                        for (var teacher in data.teacherNames) {
                                            $("#teacherid").append("<option value='" + data.teacherNames[teacher].id + "'>" + data.teacherNames[teacher].name + "</option>");
                                        }
                                    });
                                });
                            </script>
                            <div class="form">
                                <form class="form-validate form-horizontal " id="register_form" action="OfferedAdd"
                                      method="post">
                                    <div class="form-group ">
                                        <label for="courseid" class="control-label col-lg-2">课程名称 <span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <select class=" form-control" id="courseid" name="offered.courseid"
                                                    type="text">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="teacherid" class="control-label col-lg-2">开课教师<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <select class=" form-control" id="teacherid" name="offered.teacherid"
                                                    type="text">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="datestart" class="control-label col-lg-2">开课日期<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="date" id="datestart" name="offered.datestart"/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="dateend" class="control-label col-lg-2">结课日期<span
                                                class="required">*</span></label>
                                        <div class="col-lg-10">
                                            <input type="date" id="dateend" name="offered.dateend"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-primary" type="submit">添加</button>
                                            <button class="btn btn-default" type="button">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- page end-->
        </section>
    </section>
    <!--main content end-->
</section>
<!-- container section end -->
</body>
</html>
