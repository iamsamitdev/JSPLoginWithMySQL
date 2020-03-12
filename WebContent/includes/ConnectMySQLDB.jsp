<%@page import="java.sql.*"%>
<%
        String username_db = "root";
        String password_db = "1234";
        String character = "?useUnicode=true&characterEncoding=UTF-8";

        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/javabasicdb" + character;

        java.sql.Connection conn = DriverManager.getConnection(url, username_db, password_db);

        if (conn != null) {
            //out.print("Connect db success");
        } else {
            out.print("Connect db fail!!");
        }
%>