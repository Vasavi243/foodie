package com.food;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.imp.MenuDAOimp;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditMenuServlet")
public class EditMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        MenuDAO menuDAO = new MenuDAOimp();

        Menu menu = menuDAO.getMenu(menuId);

        request.setAttribute("menu", menu);

        request.getRequestDispatcher("editMenu.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        MenuDAO menuDAO = new MenuDAOimp();

        Menu menu = menuDAO.getMenu(menuId);

        menu.setItemname(request.getParameter("itemName"));
        menu.setDescription(request.getParameter("description"));
        menu.setPrice(new BigDecimal(request.getParameter("price")));
        menu.setCategory(request.getParameter("category"));
        menu.setIsavaliable(
                Integer.parseInt(request.getParameter("isAvailable"))
        );
        menu.setImagepath(request.getParameter("imagePath"));

        menu.setUpdatedat(new Timestamp(System.currentTimeMillis()));

        menuDAO.updateMenu(menu);

        response.sendRedirect("adminMenu");
    }
}