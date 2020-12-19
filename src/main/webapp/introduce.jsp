<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>千度•网站简介</title>

    <!--  Bootstrap  CSS 文件 -->
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
            background-size: 1920px 1025px;
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

        .le {
            float: left;
            width: 240px;
        }

        .ri {
            float: right;
            width: 240px;
        }

        .become img {
            width: 100%;
            cursor: pointer;
            transition: all 0.6s; /*图片放大过程的时间*/
        }

        .become img:hover {
            transform: scale(1.2); /*鼠标经过图片放大的倍数*/
        }

        .bu {
            float: left;
            width: 100px;
            height: 100px;
            position: relative;
            top: 80px;
            left: 80px;
        }


    </style>


    <script type="text/javascript">


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
        function showMsg() {
            alert("我只是默默的显示....")
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
                <li role="presentation" class="active"><a href="introduce.jsp"><span>网站简介</span></a></li>
                <li role="presentation"><a href="fileUpload.jsp"><span>文件上传</span></a></li>
                <li role="presentation"><a href="fileDownload.jsp"><span>文件下载</span></a></li>
                <li role="presentation"><a href="fileInfo.jsp"><span>文件删除</span></a></li>
                <li role="presentation"><a href="fileCategory.jsp"><span>类型查看</span></a></li>
                <li role="presentation"><a href="member.jsp"><span>会员特权</span></a></li>
                <li role="presentation"><a href="#" onclick="logout()"><span>退出系统</span></a></li>
            </ul>
        </div>

    </div>

    <%--下右半部分--%>
    <div class="rig">
        <div class="tit">
            <h1> 网 站 简 介 </h1>
        </div>
        <hr>
        <div class="member">
            <div class="page-header">
                <p class="lead"><strong> &nbsp;&nbsp;&nbsp;千度网盘Official</strong> 使用 Spring MVC + Spring + Mybatis
                    技术开发，用于文件的上传与下载。 千度网盘 成立于2020.12月。</p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;接下来介绍各个模块的作用。</p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;<mark>文件上传:</mark>
                    上传自己本地的文件到服务器
                </p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;<mark>文件下载:</mark>
                    下载自己上传的文件到本地(最好开通会员，不然会很慢呦...)
                </p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;<mark>文件删除:</mark>
                    展示文件的详细信息,并删除你选择的文件
                </p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;<mark>类型查看:</mark>
                    对已上传的文件进行分类
                </p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;<mark>会员特权:</mark>
                    VIP的福利+彩蛋
                </p>
                <p class="lead"> &nbsp;&nbsp;&nbsp;<mark>退出系统:</mark>
                    用户退出
                </p>
                <%--                style="margin-left: 280px"--%>
                <p class="lead" style="display: block;height: 10px">&nbsp;&nbsp;&nbsp;
                    <mark>Tips:</mark>
                    当你觉得不对劲的时候点下
                    <button type="button" class="btn btn-primary btn-mini" onclick="location.reload()">
                        <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> 刷新
                    </button>
                    哦
                </p>
                </button>
            </div>
            <div class="become">
                <%--   <h2>即使没有人为你鼓掌，也要优雅的谢幕，并感谢自己的认真付出</h2>--%>
                <%--<div class="jumbotron">
                    <h2 style="margin-left: 60px;margin-right: 40px">&nbsp;&nbsp;你知道人类最大的武器是什么吗?</h2>
                    <h2 style="margin-left: 60px;margin-right: 40px">&nbsp;&nbsp;是豁出去的决心。</h2>
                    <h2 style="margin-left: 500px;margin-right: 40px">&nbsp;&nbsp;伊坂幸太郎</h2>
                </div>--%>
                <blockquote class="blockquote-revers">
                    <h3>Do you know what the greatest weapon of mankind is? </h3>
                    <h3>It's the determination to go all out.</h3>
                    <footer>Isaka Kotaro in Japan</footer>
                </blockquote>
            </div>
        </div>
    </div>

</div>
</body>
</html>
