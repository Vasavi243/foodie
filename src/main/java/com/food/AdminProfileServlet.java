package com.food;

import java.io.IOException;

import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminProfileServlet")
public class AdminProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        System.out.println("=========== PROFILE ===========");
        System.out.println("Session = " + session);

        if (session != null) {
            System.out.println("Session ID = " + session.getId());
            System.out.println("loggedUser = " + session.getAttribute("loggedUser"));
        }

        if (session == null || session.getAttribute("loggedUser") == null) {

            System.out.println("Session Lost");

            response.sendRedirect("login.html");
            return;
        }

        User admin = (User) session.getAttribute("loggedUser");

        System.out.println("Logged In User : " + admin.getUsername());
        System.out.println("Role : " + admin.getRole());

        request.setAttribute("admin", admin);

        request.getRequestDispatcher("adminProfile.jsp")
               .forward(request, response);
    }
}