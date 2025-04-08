package com.grownited.Filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.grownited.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginCheckFilter implements Filter {

    // List of URLs that don't require authentication
    private static final List<String> PUBLIC_URLS = Arrays.asList(
        "/login",
        "/signup",
        "/saveuser",
        "/forgotpassword",
        "/sendotp",
        "/authenticate",
        "/updatepassword"
    );

    // List of static resource extensions
    private static final List<String> STATIC_RESOURCES = Arrays.asList(
        ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".ico", ".svg",
        ".woff", ".woff2", ".ttf", ".map"
    );

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        
        // Remove context path if present
        String path = uri.substring(contextPath.length());

        // Allow public URLs and static resources
        if (isPublicUrl(path) || isStaticResource(path)) {
            chain.doFilter(request, response);
            return;
        }

        // Check for valid session
        HttpSession session = req.getSession(false);
        UserEntity user = (session != null) ? (UserEntity) session.getAttribute("user") : null;

        if (user == null) {
            // Redirect to login page with 302 status
            res.sendRedirect(contextPath + "/login");
            return;
        }

        // User is authenticated, continue the request
        chain.doFilter(request, response);
    }

    private boolean isPublicUrl(String path) {
        return PUBLIC_URLS.contains(path) || 
               path.equals("/") || 
               path.startsWith("/login") || 
               path.startsWith("/signup");
    }

    private boolean isStaticResource(String path) {
        return STATIC_RESOURCES.stream().anyMatch(path::endsWith) ||
               path.startsWith("/assets/") ||
               path.startsWith("/css/") ||
               path.startsWith("/js/") ||
               path.startsWith("/images/");
    }
}