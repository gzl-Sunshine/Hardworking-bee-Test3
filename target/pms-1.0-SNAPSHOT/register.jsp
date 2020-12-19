<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>千度•用户注册</title>

    <!--  Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <%--导入jquery--%>
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js">
    </script>


    <style>
        body {
            zoom: 0.8;
            -moz-transform: scale(1);
            -moz-transform-origin: 0 0;
            background: url("resources/images/background.png");
            background-size: 1920px 1025px;
        }

        .outcontainer {
            width: 500px;
            height: 300px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
    <script type="text/javascript">

        $(function () {
            /**
             * 1.
             *  当用户名发生变化的时候向后台发送ajax请求
             *  检测用户名是否可用
             */
            $("#username").change(function () {
                $.ajax({
                    url: "user/checkUsername",
                    contentType: "application/json;charset=UTF-8",
                    data: $("#username").val(),
                    dataType: "json",
                    type: "post",
                    success: function (data) {
                        if (data.code === 100) {
                            $("#submit").attr("disabled", false);
                            showMsg($("#username"), "success", "");
                        } else if (data.code === 200) {
                            $("#submit").attr("disabled", true);
                            showMsg($("#username"), "error", "该用户名已存在")
                        }
                    }
                })
            })
        });

        /**
         * 2.
         * 显示校验效果的提示信息
         */
        function showMsg(ele, status, msg) {
            /**
             * 第一次error了，第二次success了。
             * 但是第一次的error仍然存在
             * 所以要清除第一次的error
             */
            $(ele).parent().removeClass("has-error has-success");
            $(ele).next("span").text(msg);
            if ("success" === status) {
                $(ele).parent().addClass("has-success");
            } else if ("error" === status) {
                $(ele).parent().addClass("has-error");
            }
        }

    </script>
</head>

<body style="background-color: #eeeeee">
<div class="outcontainer">

    <div class="container" align="center*">
        <form class="form-signin col-md-4" method="post" action="user/addUser">
            <h2 class="form-signin-heading" style="color: white">Please Regist</h2>
            <div class="form-group">
                <label for="username" class="sr-only">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required
                       autofocus>
                <span style="color:#c9302c;"></span>
            </div>
            <div class="form-group">
                <label for="password" class="sr-only ">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password"
                       required>
                <span style="color:#c9302c;"></span>
            </div>
            <div class="form-group">
                <label>
                    <a href="login.jsp" style="color:white">Sign in</a>
                </label>
            </div>
            <button class="btn btn-lg btn-block" style="color:white;background-color:#1d2437" id="submit" type="submit"
                    onclick="alert('注册成功!')">Register
            </button>
        </form>

    </div>
</div>

</body>
</html>
