<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/ConnectMySQLDB.jsp" %>

<%
    String msg = "";
    if (request.getParameter("submit") != null) {

        String getUsername = request.getParameter("username");
        String getPassword = request.getParameter("password");
        
        Statement stm;
        String sql;
        stm = conn.createStatement();
        sql = "SELECT username,password,firstname,lastname FROM members " +
                  "WHERE username='"+getUsername+"' and password='"+getPassword+"'";
        ResultSet rs = stm.executeQuery(sql);
        rs.next();

        // เขียนเงื่อนไขตรวจว่า username / password ถูกหรือไม่
        if (rs.getRow() == 1) {
            String fullnamel = rs.getString("firstname");
            msg = "<div class=\"alert alert-success\" role=\"alert\">"+"Login Success"+"</div>";
            
            // เซ็ตตัวแปรลง Cookie
            Cookie ck = new Cookie("cookie_login", fullnamel);
            ck.setMaxAge(24*60*60); // 1 day
            response.addCookie(ck);
                        
            // ส่งไปหน้า member.jsp
            response.sendRedirect("member.jsp");
            
        } else {
            msg = "<div class=\"alert alert-danger\" role=\"alert\">"+"Login Fail!!!"+"</div>";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login with MySQL</title>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>

            body {
                height: 100%;
            }

            body {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }

            .form-signin {
                width: 100%;
                max-width: 330px;
                padding: 15px;
                margin: auto;
            }
            .form-signin .checkbox {
                font-weight: 400;
            }
            .form-signin .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            .form-signin .form-control:focus {
                z-index: 2;
            }
            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }
            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

        </style>
    </head>
    <body>
        <form class="form-signin" method="post" action="index.jsp">
            <p class="text-center"><img class="mb-4" src="assets/images/logo.png" ></p>
            <h1 class="h3 mb-3 font-weight-normal text-center">เข้าสู่ระบบ</h1>
            <%=msg%>
            <label for="username" class="sr-only">Username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted text-center">&copy; 2019-2020</p>
        </form>

        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>

