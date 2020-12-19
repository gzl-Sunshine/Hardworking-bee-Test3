<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>千度•用户登录</title>
    <!--  Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <%--导入jquery--%>
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js">
    </script>

    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>


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

        /**
         * 1.用户登录的方法
         * @returns {boolean}
         */
        function login() {
            $.ajax({
                url: "user/loginUser",
                contentType: "application/json;charset=UTF-8",
                data: '{"username":"' + $("#username").val() + '", "password":"' + $("#password").val() + '"}',
                datatype: "json",
                type: "post",
                success: function (data) {
                    if (data.code === 100) {
                        location.href = "introduce.jsp";
                    } else if (data.code === 200) {
                        $("#span").text("用户名和密码有误");
                        $("#password").val("");
                    }
                }
            });
            return false;
        }
    </script>

</head>

<body style="background-color: #eeeeee">
<div class="outcontainer">


    <div class="container" align="center*">
        <form class="form-signin col-md-4" id="loginForm" method="post" onsubmit="return login()">
            <h2 class="form-signin-heading" style="color: #fbffff">Please &nbsp;sign in</h2>
            <div class="form-group">
                <label for="username" class="sr-only">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required
                       autofocus>
            </div>
            <div class="form-group">
                <label for="password" class="sr-only">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password"
                       required>
            </div>
            <div class="form-group">
                <label>
                    <a href="register.jsp" style="color: #fff">Register</a>
                </label>
                <span id="span" style="color:#c9302c; margin-left: 170px"></span>
            </div>
            <input type="submit" value="Sign in" class="btn btn-lg btn-block" id="signin"
                   style="color:white;background-color:#1d2437">
        </form>
    </div>
</div>
</body>
</html>
