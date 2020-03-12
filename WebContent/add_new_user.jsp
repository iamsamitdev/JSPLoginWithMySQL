<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file="includes/ConnectMySQLDB.jsp" %>
<%    String username_data = "";
    Cookie[] theCookies = request.getCookies();

    if (theCookies != null) {
        for (Cookie tempCookie : theCookies) {
            if ("cookie_login".equals(tempCookie.getName())) {
                username_data = tempCookie.getValue();
                break;
            }
        }
        // เช็คว่าถ้าไม่มีข้อมูล cookie data ทำการ redirect ไปหน้า login
        if (username_data.equals("")) {
            response.sendRedirect("index.jsp");
        }
    }
%>

<%
    String msg = "";
    if (request.getParameter("submit") != null) {
        try {
            Statement stm;
            String sql;
            stm = conn.createStatement();
            sql = "INSERT INTO members(username,password,firstname,lastname,email,tel,address,status)" +
                    " VALUES('" + request.getParameter("username") + "'," +
                    "'" + request.getParameter("password") + "'," +
                    "'" + request.getParameter("firstname") + "'," +
                    "'" + request.getParameter("lastname") + "'," +
                    "'" + request.getParameter("email") + "'," +
                    "'" + request.getParameter("tel") + "'," +
                    "'" + request.getParameter("address") + "'," +
                    "'" + request.getParameter("status") + "')";

            int rs = stm.executeUpdate(sql);
            if (rs == 1) {
                msg = "<div class='alert alert-success'>Insert New User Success</div>";
            }
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new user</title>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .error{
                font-size: 12px;
                color: red;
                margin-top: 3px;
            }
        </style>
    </head>
    <body>

        <!--MENU-->
        <%@include file="includes/topmenu.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <%@include file="includes/sidemenu.jsp" %>
                </div>
                <div class="col-lg-9">
                    <div class="card mb-4">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h5><i class="fas fa-plus"></i> Add new user</h5>
                                </div>
                                <div class="col-lg-6 text-right">
                                    <a href="user_manage.jsp" class="btn btn-primary">
                                        <i class="fas fa-arrow-left"></i> Back to users</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%=msg%>

                    <form method="post" name="addnewuserform" id="addnewuserform" action="add_new_user.jsp">

                        <div class="form-group row">
                            <label for="username" class="col-sm-2 col-form-label">Username</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="firstname" class="col-sm-2 col-form-label">Firstname</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Firstname" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="lastname" class="col-sm-2 col-form-label">Lastname</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Lastname" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tel" class="col-sm-2 col-form-label">Tel</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="tel" name="tel" placeholder="Tel" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="address" rows="5" placeholder="Address" required></textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="status" class="col-sm-2 col-form-label">Status</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="status" required>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10">
                                <input type="submit" name="submit" class="btn btn-primary" value="Submit">
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>

    <%@include file="includes/footer.jsp" %>

    <script src="assets/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/jquery/jquery.validate.min.js" type="text/javascript"></script>
    <script>
        $("#addnewuserform").validate({
            submitHandler: function (form) {
                var conf = confirm('ยืนยันการบันทึกข้อมูลหรือไม่ ?');
                if(conf){
                    form.submit();
                }
            }
        });
    </script>
</body>
</html>
