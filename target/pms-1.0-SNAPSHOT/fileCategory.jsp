<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>千度•文件分类</title>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
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

        .intro {
            width: 800px;
            height: 20px;

        }

        .fspan {
            width: 20px;
            position: relative;
            margin-left: 300px;
            margin-right: 150px;
        }

        .dtable table {
            border-collapse: collapse;
            border-spacing: 30px;
            margin-right: auto;
            margin-left: auto;
        }

        .dtable td {
            text-align: center;
        }

        .dtable img {
            width: 200px;
            height: 180px;
            margin-left: 16px;
            margin-top: 10px;
        }


    </style>


    <script type="text/javascript">

        function showMsg() {
            alert("我只是默默的显示....")
        }

        /**
         * 通过文件类型展示文件
         */
        function showFilesByType(type) {
            $.ajax({
                url: "file/showFiles/" + type,
                data: "",
                success: function () {
                    location.reload();
                }
            });
        }

        /**
         * 展示已下载文件信息
         */
        function fileCategory() {
            $.ajax({
                url: "file/fileCategory",
                contentType: "application/json;charset=UTF-8",
                data: "",
                dataType: "json",
                type: "post",
                success: function (set) {
                    console.log(set);
                }
            })
        }

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
    if (username != null && !"".equals(username)) {

    } else {
        response.sendRedirect("login.jsp");
    }
%>
<script>
    fileCategory();
</script>
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
                <li role="presentation" class="active"><a href="#"><span>类型查看</span></a></li>
                <li role="presentation"><a href="member.jsp"><span>会员特权</span></a></li>
                <li role="presentation"><a href="#" onclick="logout()"><span>退出系统</span></a></li>
            </ul>
        </div>

    </div>

    <%--下右半部分--%>
    <div class="rig">
        <div class="tit">
            <h1> 类 型 查 看 </h1>
        </div>
        <hr>
        <div class="fileDownload">

            <div class="form-group intro">
                <span class="fspan" style="font-size: 20px;font-family: 幼圆">请点击你要查看的类别:</span>

                <button type="button" class="btn btn-primary btn-mini" onclick="location.reload()">
                    <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> 刷新
                </button>
            </div>
            <div class="dtable">

                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">

                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Type</a>
                        </div>


                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <%--                                <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>--%>
                                <c:forEach items="${types}" var="type">
                                    <%--                                    <li><a href="file/showFiles/${type}"><strong>${type}</strong></a></li>--%>
                                    <li><a id="'${type}'" class="atype"
                                           onclick="showFilesByType('${type}')"><strong>${type}</strong></a></li>
                                </c:forEach>

                            </ul>
                        </div>
                    </div>
                </nav>
                <%--展示文件的图--%>
                <table cellspacing="10px">
                    <%--一行三条数据--%>
                    <c:set var="i" value="4"/>
                    <c:set var="j" value="4"/>
                    <c:forEach items="${filesByType}" var="file" step="1">
                        <c:if test="${(i-1)%3==0}"><tr></c:if>
                        <td>
                            <c:set var="theString" value="${file}"/>
                            <c:choose>

                                <c:when test="${fn:endsWith(theString,'jpg')}">
                                    <a href="file/download/${file}"><img src="resources/images/fileDownJpg.png"/></a>
                                    <br>
                                    (jpg图) ${file}
                                </c:when>
                                <c:when test="${fn:endsWith(theString,'docx')}">
                                    <a href="file/download/${file}"><img src="resources/images/fileDownDocx.png"/></a>
                                    <br>
                                    (Word文档) ${file}
                                </c:when>
                                <c:when test="${fn:endsWith(theString,'png')}">
                                    <a href="file/download/${file}"><img onclick="progress()"
                                                                         src="resources/images/fileDownPng.png"/></a>
                                    <br>
                                    (png图) ${file}
                                </c:when>
                                <c:when test="${fn:endsWith(theString,'md')}">
                                    <a href="file/download/${file}"><img src="resources/images/fileDownMd.png"/></a>
                                    <br>
                                    (Markdown) ${file}
                                </c:when>
                                <c:when test="${fn:endsWith(theString,'pptx')}">
                                    <a href="file/download/${file}"><img src="resources/images/fileDownPptx.png"/></a>
                                    <br>
                                    (PPT) ${file}
                                </c:when>

                                <c:otherwise>
                                    <a href="file/download/${file}"><img src="resources/images/fileDownExe.png"/></a>
                                    <br>
                                    (其它) ${file}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <c:if test="${j%3==0}"></tr></c:if>
                        <c:set var="i" value="${i+1}"/>
                        <c:set var="j" value="${j+1}"/>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
