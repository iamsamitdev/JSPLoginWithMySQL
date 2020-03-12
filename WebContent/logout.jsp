<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Clear Cookie
    Cookie[] theCookies = request.getCookies();
    
    if(theCookies != null){
        for(Cookie tempCookie: theCookies){
            tempCookie.setMaxAge(0);
            response.addCookie(tempCookie);
        }
    }
    
    // Redirect to login page
    response.sendRedirect("index.jsp");
    
%>
