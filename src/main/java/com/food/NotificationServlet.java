package com.food;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.NotificationDAO;
import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.NotificationDAOimp;
import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Notification;
import com.tap.model.Restuarant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null){

            response.sendRedirect("login.html");
            return;

        }

        User admin =
                (User)session.getAttribute("loggedUser");

        if(admin == null){

            response.sendRedirect("login.html");
            return;

        }

        RestuarantDAO restaurantDAO =
                new RestuarantDAOimp();

        Restuarant restaurant =
                restaurantDAO.getRestaurantByAdminUserId(
                        admin.getUserid());

        if(restaurant == null){

            response.sendRedirect("dashboard");
            return;

        }

        NotificationDAO notificationDAO =
                new NotificationDAOimp();

        List<Notification> notifications =
                notificationDAO.getNotifications(
                        restaurant.getRestuarantid());

        notificationDAO.markAllAsRead(
                restaurant.getRestuarantid());

        request.setAttribute(
                "notifications",
                notifications);

        request.setAttribute(
                "restaurant",
                restaurant);

        request.getRequestDispatcher(
                "notifications.jsp")
                .forward(request, response);

    }

}