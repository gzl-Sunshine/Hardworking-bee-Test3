<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>千度•文件删除</title>

    <!-- Bootstrap  CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <%--导入jquery--%>
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>

    <!--  Bootstrap  JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>


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

        .intro {
            width: 800px;
            height: 20px;

        }

        .fspan {
            width: 20px;
            position: relative;
            margin-left: 320px;
            margin-right: 150px;
        }

        .dtable table {
            border-collapse: collapse;
            border-spacing: 30px;
            margin-top: 40px;
            margin-right: auto;
            margin-left: auto;
        }

        .dtable td {
            text-align: center;
            font-size: 20px;
        }

        .dtable img {
            width: 200px;
            height: 180px;
            margin-left: 16px;
            margin-top: 10px;
        }


    </style>


    <script type="text/javascript">

        /**
         * 展示文件的详细信息
         */
        $(function () {
            $.ajax({
                url: "file/showFileInfo",
                data: "",
                success: function (data) {
                }
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

            /**
             * 删除所选文件
             */
            $("#deleteAll").click(function () {
                if($(".checkItem:checked").length===0){
                    alert("请选择你要删除的文件...");
                    return false;
                }
                let showFileName="";
                let setFileName="";
                //遍历所有选中的项，将name封装起来
                $.each($(".checkItem:checked"),function () {
                    showFileName=showFileName+$(this).parents("tr").find("td:eq(1)").text()+"\n";
                    setFileName=setFileName+$(this).parents("tr").find("td:eq(1)").text()+"-";
                });

                //删除多余的-
                setFileName=setFileName.substring(0,setFileName.length-1);
                console.log("setFileName="+setFileName);
                if(!confirm("是否要删除以下文件?\n"+showFileName)){
                    return false;
                }else{
                    //将要删除的文件的名称发送给后端
                    $.ajax({
                        url:"file/deleteFile",
                        data:"setFileName="+setFileName,
                        success:function () {
                            alert(showFileName+"已成功删除!!!\n\n\n请点击刷新按钮刷新数据.....");
                            location.reload();
                        }
                    })
                }
            })
        });
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
    if (username != null && !"".equals(username)) {

    } else {
        response.sendRedirect("login.jsp");
    }
%>

<%--头部--%>
<div class="head">
    <div class="b">
        <span class="bspan"> 千 度 网 盘 official</span>

        <button class="btn btn-default btn-lg" onclick="showMsg()">
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
                <li role="presentation" class="active"><a href="fileInfo.jsp"><span>文件删除</span></a></li>
                <li role="presentation"><a href="fileCategory.jsp"><span>类型查看</span></a></li>
                <li role="presentation"><a href="member.jsp"><span>会员特权</span></a></li>
                <li role="presentation"><a href="#" onclick="logout()"><span>退出系统</span></a></li>
            </ul>
        </div>

    </div>

    <%--下右半部分--%>
    <div class="rig">
        <div class="tit">
            <h1> 文 件 信 息 </h1>
        </div>
        <hr>
        <div class="fileDownload">
            <%--bootstarp--%>
            <div class="form-group intro">
                <span class="fspan" style="font-size: 20px;font-family: 幼圆">已上传文件的信息</span>

                <button type="button" class="btn btn-primary btn-mini" onclick="location.reload()">
                    <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> 刷新
                </button>
            </div>
                <%--展示文件信息--%>
            <div class="dtable">
                <table class="table table-bordered">
                    <tr>
                        <td></td>
                        <td>文件名</td>
                        <td>类型</td>
                        <td>大小</td>
                        <td>修改日期</td>
                    </tr>
                    <c:forEach items="${fileInfos}" var="fileInfo" step="1">
                        <tr>
                            <td><input type='checkbox' class='checkItem'/></td>
                            <td>${fileInfo.name}</td>
                            <td>${fileInfo.type}</td>
                            <td>${fileInfo.size}kb</td>
                            <td>${fileInfo.date}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div>

            </div>
            <button type="button" class="btn btn-danger btn-large" id="deleteAll" style="margin-left: 640px">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                删除
            </button>
        </div>
    </div>

</div>
</body>
</html>
