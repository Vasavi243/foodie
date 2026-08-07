package com.food;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.imp.MenuDAOimp;
import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Menu;
import com.tap.model.Restuarant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminMenu")
public class AdminMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
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

        RestuarantDAO restaurantDAO = new RestuarantDAOimp();

        Restuarant restaurant =
                restaurantDAO.getRestaurantByAdminUserId(admin.getUserid());

        if (restaurant == null) {
            response.sendRedirect("dashboard");
            return;
        }

        MenuDAO menuDAO = new MenuDAOimp();

        List<Menu> menuList =
                menuDAO.getMenuByRestaurantId(
                        restaurant.getRestuarantid());

        request.setAttribute("restaurant", restaurant);
        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("adminMenu.jsp")
               .forward(request, response);
    }
}