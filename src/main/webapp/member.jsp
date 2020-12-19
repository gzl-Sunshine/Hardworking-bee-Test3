<%--
  Created by IntelliJ IDEA.
  User: 11384
  Date: 2020/12/15
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>千度•会员特权</title>

    <!--  Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <%--导入jquery--%>
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>

    <style>
        body {
            zoom: 0.8;
            -moz-transform: scale(1);
            -moz-transform-origin: 0 0;
            background: url("resources/images/background.png");
            background-size:1920px 1025px;
        }

        .head {
            /*   background-color: rgb(236, 236, 236);*/
            width: 70%;
            height: 60px;
            position: relative;
            border-radius: 4px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
        }

        .b {
            height: 40px;
            width: 100%;
            position: absolute;
            top: 10%;
            left: 40px;
        }

        .bspan {
            color: #464749;
            font-size: 35px;
            font-family: 幼圆;
            color: white;
            width: 40px;
            padding-right: 520px;
        }

        .b button {
            margin-bottom: 20px;
            margin-left: 10px;
            height: 40px;
        }

        .bottom {
            /*background-color: pink;*/
            width: 70%;
            height: 1000px;
            position: relative;
            margin-left: auto;
            margin-right: auto;
            margin-top: 20px;
        }

        .lef {

            float: left;
            /*background-color: yellow;*/
            width: 250px;
            height: 1000px;
            margin-right: 40px;
        }

        .rig {
            float: left;
            background-color: white;
            border-radius: 16px;
            opacity: 92%;
            width: 770px;
            height: 936px;
        }

        .tit {
            width: 770px;
            position: relative;
            margin-right: auto;
            margin-left: auto;
            left: 300px;
        }

        .tit h1 {
            font-family: 幼圆;
        }

        .divul {
            height: 100px;
            margin-top: 20px;
        }

        .divul li span {
            color: white;
        }

        .divul ul li a:hover {
            background-color: #878a60;
        }

        .divul ul li a:visited {
            background-color: #878a60;
        }

        /*.divul ul li a:{
            background-color: #878a60;
        }*/

        .divul ul li a {
            display: block;
        }

        .divul ul span {
            margin-left: 60px;
            width: 30px;
            font-size: 20px;
            font-family: 幼圆;
        }

        .username {

            height: 1px;
            margin-bottom: 8px;
            font-family: 幼圆;
        }


        .fileUpload form {
            margin-left: 300px;
        }

        .become img {
            width: 240px;
            height: 240px;
        }
        .le{
            float: left;
            width: 240px;
        }
        .ri{
            float: right;
            width: 240px;
        }
        .become img{
            width: 100%;
            cursor: pointer;
            transition: all 0.6s;/*图片放大过程的时间*/
        }
        .become img:hover{
            transform: scale(1.2);/*鼠标经过图片放大的倍数*/
        }
        .bu{
            float: left;
            width: 100px;
            height: 100px;
            position: relative;
            top:80px;
            left: 80px;
        }



    </style>


    <script type="text/javascript">

        function showMsg() {
            alert("我只是默默的显示....")
        }

        $(function () {
            /**
             * 会员注册
             */
            $("#member").click(function () {
                alert("尊敬的VIP,你的下载速度已拉满！！！");
                $.ajax({
                    url:"user/becomeMember",
                    data:"",
                    success:function () {
                    }
                })
            })
        });


        /**
         * 退出系统
         * @returns {boolean}
         */
        function logout() {
            let flag = confirm("您确定要退出系统?");
            if (!flag) {
                return false;
            } else {
                $.ajax({
                    url: "user/logout",
                    data: "",
                    success: function () {
                        location.href = "login.jsp"
                    }
                });
            }
        }


    </script>

</head>
<body>

<%
    /**
     * 校验，防止非法进入
     */
    String username = (String) session.getAttribute("username");
    System.out.println("fileUpload..." + username);
    if (username != null && !"".equals(username)) {
    } else {
        //重定向
        response.sendRedirect("login.jsp");
    }
%>

<%--头部--%>
<div class="head">
    <div class="b">
        <span class="bspan"> 千 度 网 盘 official</span>

        <button class="btn btn-default btn-lg " onclick="showMsg()">
            <span class="glyphicon glyphicon-user" style="margin-right: 5px"></span><span
                class="username">${username}</span>
        </button>

    </div>
</div>
<%--下半部分--%>
<div class="bottom">

    <%--下左半部分--%>
    <div class="lef">

        <div class="divul">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="introduce.jsp"><span>网站简介</span></a></li>
                <li role="presentation"><a href="fileUpload.jsp"><span>文件上传</span></a></li>
                <li role="presentation"><a href="fileDownload.jsp"><span>文件下载</span></a></li>
                <li role="presentation"><a href="fileInfo.jsp"><span>文件删除</span></a></li>
                <li role="presentation"><a href="fileCategory.jsp"><span>类型查看</span></a></li>
                <li role="presentation" class="active"><a href="#"><span>会员特权</span></a></li>
                <li role="presentation"><a href="#" onclick="logout()"><span>退出系统</span></a></li>
            </ul>
        </div>

    </div>

    <%--下右半部分--%>
    <div class="rig">
        <div class="tit">
            <h1> 会 员 特 权 </h1>
        </div>
        <hr>
        <div class="member">
            <div class="page-header">
                <p class="lead"><strong> &nbsp;&nbsp;&nbsp;会员</strong> 直译为“重要人物”、“要员”，其它称呼还有“贵宾”，、“重要人士”、“高级用户”、
                    “高级会员”等，是一个组织、派对等对访客的一种分类。</p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;在千度网盘中，会员可以享受到<strong>最快</strong>的下载速度。</p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;如果你想投币的话，可以by下面的<strong>二维码</strong>。请这次一定!</p>
            </div>
            <div class="become">
                <div class="le">
                    <img src="resources/images/member1.png">
                </div>

                <div class="bu">
                <button type="submit" class="btn btn-large btn-block" id="member" style="background-color: #6f0b36; color:white;font-size: 16px">点我试试!</button>
                </div>

                <div class="ri">
                    <img src="resources/images/member2.png">
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
