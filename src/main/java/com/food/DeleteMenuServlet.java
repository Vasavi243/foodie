package com.food;

import java.io.IOException;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.imp.MenuDAOimp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteMenuServlet")
public class DeleteMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedUser") == null) {

            response.sendRedirect("login.html");
            return;
        }

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        MenuDAO menuDAO = new MenuDAOimp();

        menuDAO.deleteMenu(menuId);

        response.sendRedirect("adminMenu");
    }

}