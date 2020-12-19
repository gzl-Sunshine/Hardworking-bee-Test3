<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>千度•文件上传</title>

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

        .fileUpload {
            /*background-color: pink;*/
        }

        .fileUpload form {
            margin-left: 300px;
        }

        /*//上传按钮的样式*/
        .a-upload {
            padding: 4px 10px;
            height: 20px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .a-upload input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
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

        /**
         * 展示提示信息
         * @returns {boolean}
         */
        function fileupload() {
            alert("文件上传成功...")
            return true;
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
                <li role="presentation" class="active"><a href="fileUpload.jsp"><span>文件上传</span></a></li>
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
            <h1> 文 件 上 传 </h1>
        </div>
        <hr>
        <div class="fileUpload">
            <%--文件上传的前提是post请求,multipart/form-data格式--%>
            <form method="post" action="file/upload" enctype="multipart/form-data" id="form"
                  onsubmit=" return fileupload()">
                <div class="form-group">
                    <label for="mpf"><span style="font-size: 20px;font-family: 幼圆">请选择你要上传的文件:</span></label>
                    <br>
                    <a href="javascript:;" class="a-upload"
                       style="display: block;height: 30px;width: 80px;background-color: #337ab7;color: white">

                        <input type="file" name="mpf" id="mpf">选择文件

                    </a>

                    <p class="help-block">Example block-level help text here.</p>
                    <button type="submit" class="btn btn-default btn-primary" id="submit">点击上传</button>

                </div>
            </form>
        </div>
    </div>

</div>
</body>
</html>
