<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="View.OfferedView" %>
<%@page import="com.opensymphony.xwork2.ActionContext" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>开课信息 - 网上教学系统</title>

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

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!-- external css -->
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
                    <h3 class="page-header"><i class="icon_genius"></i> 开课</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.jsp">首页</a></li>
                        <li><i class="icon_genius"></i>开课信息</li>
                    </ol>
                </div>
            </div>
            <!-- page start-->
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-default" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target=".navbar-ex1-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">选择</a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <script>
                                $(document).ready(function () {
                                    $.get("/JSONCourses", function (data, status) {
                                        for (var course in data.courseNames) {
                                            $("#courseid").append("<li><a href='" + "/Offered?courseid=" + data.courseNames[course].id + "'>" + data.courseNames[course].name + "</a></li>");
                                        }
                                    });
                                });
                            </script>
                            <ul class="nav navbar-nav">

                                <!--<li class="active"><a href="#">正序</a></li>
                                <li><a href="javascript:;">倒序</a></li>-->
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">选择课程 <b
                                            class="caret"></b></a>
                                    <ul class="dropdown-menu" id="courseid">
                                        <li><a href="/Offered?courseid=-1">全部</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <!--<form class="navbar-form navbar-left" role="search">-->
                            <!--<div class="form-group">-->
                            <!--<input type="text" class="form-control" placeholder="Search">-->
                            <!--</div>-->
                            <!--<button type="submit" class="btn btn-default">Submit</button>-->
                            <!--</form>-->
                            <!--<ul class="nav navbar-nav navbar-right">
                                <li><a href="javascript:;">Link</a></li>
                                <li class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </li>
                            </ul>-->
                        </div><!-- /.navbar-collapse -->
                    </nav>

                    <section class="panel">
                        <header class="panel-heading no-border">
                            开课信息
                        </header>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>课程名称</th>
                                <th>开课老师</th>
                                <th>起始时间</th>
                                <th>结束时间</th>
                                <%
                                    if (usertype.equals("admin")) {
                                %>
                                <th>操作</th>
                                <%
                                    }
                                %>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<OfferedView> offeredViews = (ArrayList<OfferedView>) ActionContext.getContext().getSession().get("offeredViews");
                                for (OfferedView o : offeredViews) {
                            %>
                            <tr>
                                <td><%=o.getId()%>
                                </td>
                                <td><%=o.getCourse().getName()%>
                                </td>
                                <td><%=o.getTeacher().getName()%>
                                </td>
                                <td><%=o.getDatestart()%>
                                </td>
                                <td><%=o.getDateend()%>
                                </td>
                                <%
                                    if (usertype.equals("admin")) {
                                %>
                                <td><a class="btn btn-danger" href="/OfferedDelete?id=<%=o.getId()%>">删除</i></a></td>
                                <%
                                    }
                                %>
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
<script>

    //knob
    $(".knob").knob();

</script>

</body>
</html>
