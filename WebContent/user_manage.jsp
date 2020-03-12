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

    // คำสั่งลบข้อมูลออกจากตาราง member
    if (request.getParameter("delid") != null) {
        try {
            Statement stm;
            String sql;
            stm = conn.createStatement();
            sql = "DELETE FROM members WHERE id='"+request.getParameter("delid")+"'";
            int rs = stm.executeUpdate(sql);
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
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
                    <div class="card mb-2">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h5>User Management</h5>
                                </div>
                                <div class="col-lg-6 text-right">
                                    <a href="add_new_user.jsp" class="btn btn-success">
                                        <i class="fas fa-plus"></i> Add new user</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-info">
                                <th>ID</th>
                                <th>Username</th>
                                <th>Firstname</th>
                                <th>Lastname</th>
                                <th>Email</th>
                                <th>Manage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Statement stm;
                                    String sql;
                                    stm = conn.createStatement();
                                    sql = "SELECT * FROM members ORDER BY id DESC";
                                    ResultSet rs = stm.executeQuery(sql);
                                    int row = 1;
                                    while (rs.next()) {
                                        out.print("<tr>");
                                        out.print("<td>" + row + "</td>");
                                        out.print("<td>" + rs.getString("username") + "</td>");
                                        out.print("<td>" + rs.getString("firstname") + "</td>");
                                        out.print("<td>" + rs.getString("lastname") + "</td>");
                                        out.print("<td>" + rs.getString("email") + "</td>");
                                        out.print("<td><a href='edit_user.jsp?editid=" + rs.getInt("id") + "' class='btn btn-sm btn-warning'>Edit</a> " +
                                                "<a href='user_manage.jsp?delid=" + rs.getInt("id") + "' class='btn btn-sm btn-danger' onclick=\"return confirm('ยืนยันการลบรายการนี้หรือไม่ ?')\">Delete</a>");
                                        out.print("</tr>");
                                        row++;
                                    }
                                } catch (Exception e) {
                                    out.print(e.getMessage());
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <%@include file="includes/footer.jsp" %>

    <script src="assets/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
