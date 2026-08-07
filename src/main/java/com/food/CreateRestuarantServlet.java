package com.food;

import java.io.IOException;
import java.math.BigDecimal;

import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Restuarant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/createRestuarant")
public class CreateRestuarantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.html");
            return;
        }

        User admin = (User) session.getAttribute("loggedUser");

        if (admin == null) {
            response.sendRedirect("login.html");
            return;
        }

        RestuarantDAOimp dao = new RestuarantDAOimp();

        // Check whether this admin already has a restaurant
        Restuarant existingRestaurant =
                dao.getRestaurantByAdminUserId(admin.getUserid());

        if (existingRestaurant != null) {

            request.setAttribute("message",
                    "You have already created a restaurant.");

            request.getRequestDispatcher("createRestuarant.jsp")
                   .forward(request, response);

            return;
        }

        Restuarant restaurant = new Restuarant();

        restaurant.setName(request.getParameter("restaurantName"));
        restaurant.setCuisinetype(request.getParameter("cuisine"));
        restaurant.setDeliverytime(
                Integer.parseInt(request.getParameter("deliveryTime")));
        restaurant.setAddress(request.getParameter("address"));
        restaurant.setImagepath(request.getParameter("imagePath"));

        restaurant.setAdminuserid(admin.getUserid());

        restaurant.setRating(new BigDecimal("4.5"));

        restaurant.setIsactive(1);

        dao.addRestuarant(restaurant);

        response.sendRedirect("dashboard");
    }
}