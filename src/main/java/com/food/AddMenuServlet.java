package com.food;

import java.io.IOException;

import java.math.BigDecimal;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.MenuDAOimp;
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

@WebServlet("/AddMenuServlet")
public class AddMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("addMenu.jsp")
               .forward(request, response);
    }

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

        RestuarantDAO restaurantDAO = new RestuarantDAOimp();

        Restuarant restaurant =
                restaurantDAO.getRestaurantByAdminUserId(admin.getUserid());

        if (restaurant == null) {
            response.sendRedirect("dashboard");
            return;
        }

        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String category = request.getParameter("category");
        int isAvailable = Integer.parseInt(request.getParameter("isAvailable"));
        String imagePath = request.getParameter("imagePath");

        Menu menu = new Menu();

        menu.setRestuarantid(restaurant.getRestuarantid());
        menu.setItemname(itemName);
        menu.setDescription(description);
        menu.setPrice(price);
        menu.setCategory(category);

        menu.setIsavaliable(isAvailable);

        menu.setImagepath(imagePath);


        MenuDAO menuDAO = new MenuDAOimp();

        menuDAO.addMenu(menu);


        response.sendRedirect("MenuListServlet");
    }
}