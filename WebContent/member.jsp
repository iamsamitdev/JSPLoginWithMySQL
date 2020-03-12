<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username_data = "";
    Cookie[] theCookies = request.getCookies();

    if (theCookies != null) {
        for (Cookie tempCookie : theCookies) {
            if ("cookie_login".equals(tempCookie.getName())) {
                username_data = tempCookie.getValue();
                break;
            }
        }
        // เช็คว่าถ้าไม่มีข้อมูล cookie data ทำการ redirect ไปหน้า login
        if(username_data.equals("")){
            response.sendRedirect("index.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member</title>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <!--MENU-->
        <%@include file="includes/topmenu.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                   <%@include file="includes/sidemenu.jsp" %>
                </div>
                <div class="col-lg-8">
                    <h1>Dashboard</h1>
                </div>
            </div>

        </div>

        <%@include file="includes/footer.jsp" %>

        <script src="assets/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    </body>
</html>
