package com.food;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAO.imp.UserDAOimp;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email != null) {
            email = email.trim();
        }

        // Basic validation
        if (email == null || email.isEmpty() ||
            password == null || password.isEmpty()) {

            res.sendRedirect("login.html");
            return;
        }

        UserDAOimp dao = new UserDAOimp();

        // Fetch user
        User user = dao.getUserByEmail(email);

        if (user == null) {

            System.out.println("User not found");
            res.sendRedirect("login.html");
            return;
        }

        // Verify password
        if (!BCrypt.checkpw(password, user.getPassword())) {

            System.out.println("Invalid Password");
            res.sendRedirect("login.html");
            return;
        }

        // Prevent session fixation
        HttpSession oldSession = req.getSession(false);
        if (oldSession != null) {
            oldSession.invalidate();
        }

        HttpSession session = req.getSession(true);

        // Session timeout: 30 minutes
        session.setMaxInactiveInterval(30 * 60);

        session.setAttribute("loggedUser", user);

        System.out.println("Login Successful : " + user.getUsername());

        String role = user.getRole();

        switch(role.toLowerCase()) {

        case "customer":
            res.sendRedirect("restuarant");
            break;

        case "restuarantadmin":
            res.sendRedirect("dashboard");
            break;

        case "admin":
            res.sendRedirect("dashboard");
            break;

        default:
            session.invalidate();
            res.sendRedirect("login.html");
        }
    }
}