package com.food;

import java.io.IOException;

import com.tap.model.Cart;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 1. Check login session
        if (session == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.html"
            );
            return;
        }

        // 2. Get logged-in user
        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.html"
            );
            return;
        }

        // 3. Get cart
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null ||
            cart.getItems() == null ||
            cart.getItems().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/CartServlet"
            );
            return;
        }

        // 4. Send data to JSP
        request.setAttribute("user", user);
        request.setAttribute("cart", cart);

        request.setAttribute("deliveryCharge", 40);
        request.setAttribute("packagingCharge", 20);

        // 5. Open checkout page
        RequestDispatcher dispatcher =
            request.getRequestDispatcher("/checkout.jsp");

        dispatcher.forward(request, response);
    }
}