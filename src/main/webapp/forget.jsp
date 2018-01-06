<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>找回密码 - 网上教学系统</title>

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
    <link href="css/elegant-icons-style.css" rel="styl  esheet"/>
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
            <div class="row">
                <div class="col-lg-offset-1 col-lg-10">
                    <h3 class="page-header"><i class="fa fa fa-bars"></i> 找回密码</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.jsp">首页</a></li>
                        <li><i class="fa fa-bars"></i>找回密码</li>
                    </ol>
                </div>
            </div>
            <!-- page start-->

            <script>
                function checkForm(){
                    var usr=document.getElementById("name").value;
                    var mil=document.getElementById("mail").value;

                    if(usr==null||mil==null||usr==''||mil==''){
                        document.getElementById("warning").innerHTML="用户名或邮箱不能为空！";
                    }
                    else{
                        document.getElementById("warning").innerHTML="";
                    }
                };
            </script>
            <style>
                html, body{height: 100%;margin: 0px;padding: 0px; min-width: 1200px;}

                .input_box,.check_box,.change_box{width: 400px;height:400px;position:absolute;left:50%;top:50%;margin:-200px 0 0 -200px;}
            </style>
        <%
            String username = (String)ActionContext.getContext().getSession().get("username");
            String findtype = (String)ActionContext.getContext().getSession().get("findtype");
            if(findtype==null){
                findtype = "inputBasic";
            }
            else{
                ActionContext.getContext().getSession().put("findtype",findtype);
            }
        %>
        <%
        if(findtype.equals("inputBasic")){//输入邮箱等信息
        ActionContext.getContext().getSession().put("findtype",null);
        %>
        <div class="check_box table-hover">
            <h1 class="text-center">输入邮箱等信息</h1>
            <form class="form-horizontal" role="form" action="FindPassword" method="post">
                <div class="form-group">
                <div id="warning" class="text-center text-danger">
                    ${param.msg}
                </div>
                </div>
                <div class="form-group">
                <label for="name" class="col-sm-3 control-label">账户：</label>
                    <div class="col-sm-9">
                        <input type="text"  name="username" class="form-control" onblur="checkForm();" id="name" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                <label for="mail" class="col-sm-3 control-label">邮箱：</label>
                    <div class="col-sm-9">
                        <input type="email"  name="email" class="form-control" onblur="checkForm();"  id="mail" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group">
                <label for="usertype" class="col-sm-3 control-label">用户类型：</label>
            <div class="col-sm-9">
                <label class="checkbox-inline">
                    <input type="radio" name="usertype" value="student" id="type" checked="true">学生
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="usertype" value="teacher" id="type">教师
                </label>
                <label class="checkbox-inline">
                    <input type="radio" name="usertype" value="admin" id="type">管理员
                </label>
            </div>
        </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-3">
                        <button type="submit" class="btn btn-default btn-block">确认</button>
                    </div>
                </div>
            </form>
        </div>
        <%
        }
        else if(findtype.equals("emailVerify")){//邮箱验证
        %>

        <div class="check_box table-hover">
            <h1 class="text-center">邮箱验证</h1>
            <form class="form-horizontal" role="form" action="FindPassword" method="post">
                <div class="form-group">
                <label for="verify" class="col-sm-3 control-label">验证码：</label>
                    <div class="col-sm-9">
                        <input type="number" min="100000" max="999999" name="verify" class="form-control" id="name" placeholder="请输入验证码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-3">
                        <button type="submit" class="btn btn-default btn-block">确认</button>
                    </div>
                </div>
            </form>
        </div>
        <%
        }
        else if(findtype.equals("changePassword")){//修改密码
        %>
                    <script>
                        function check(){
                            var pswd1=document.getElementById("newpswd").value;
                            var pswd2=document.getElementById("re-newpswd").value;
                            if(pswd1!=pswd2){
                                document.getElementById("warning").innerHTML="<p class=\"text-warning\">两次密码输入不相同！</p>";
                                document.getElementById("setpswd").disabled=true;
                            }
                            else{
                                document.getElementById("warning").innerHTML="<p></p>";
                                document.getElementById("setpswd").disabled=false;
                            }
                        };
                    </script>
        <div class="change_box table-hover">
            <h1 class="text-center">修改密码</h1>
            <form class="form-horizontal" role="form" action="FindPassword" method="post">
                <div class="form-group">
                <div id="warning" class="text-center">
                    <p id="warn" class="text-warning" style="display:inline"></p>
                </div>
                </div>
                <div class="form-group">
                <label for="password" class="col-sm-3 control-label">新密码：</label>
                    <div class="col-sm-9">
                        <input type="password"  name="password" class="form-control" id="newpswd" placeholder="请输入新密码">
                    </div>
                </div>
                <div class="form-group">
                <label for="password2" class="col-sm-3 control-label">确认：</label>
                    <div class="col-sm-9">
                        <input type="password" name="password2" class="form-control" onblur="check();"  id="re-newpswd" placeholder="重新输入新密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-3">
                        <button type="submit" id="setpswd" class="btn btn-default btn-block" disabled="true">确认</button>
                    </div>
                </div>
            </form>
        </div>
        <%
        }
        else{
        ActionContext.getContext().getSession().put("findtype",null);
        %>
        <div  class="text-center text-success">
            <strong><h3>密码修改成功!</h3></strong>
            <div>
                <script>
                    alert("密码修改成功!");
                    window.location.href="/";
                </script>
            </div>
        </div>
        <%
        }
        %>
            <!-- page end-->
</body>
</html>
