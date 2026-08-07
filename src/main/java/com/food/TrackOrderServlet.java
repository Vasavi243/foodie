package com.food;

import java.io.IOException;

import com.tap.DAO.OrdertableDAO;
import com.tap.DAO.imp.OrdertableDAOimp;
import com.tap.model.Ordertable;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TrackOrderServlet")
public class TrackOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrdertableDAO ordertableDAO;

    @Override
    public void init() {

        ordertableDAO = new OrdertableDAOimp();
    }

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        // =========================================
        // CHECK LOGIN
        // =========================================

        if (session == null) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/login.html"
            );

            return;
        }

        User user =
                (User) session.getAttribute("loggedUser");

        if (user == null) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/login.html"
            );

            return;
        }

        // =========================================
        // GET ORDER ID
        // =========================================

        String orderIdParam =
                req.getParameter("orderId");

        if (orderIdParam == null ||
            orderIdParam.trim().isEmpty()) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/OrderHistoryServlet"
            );

            return;
        }

        int orderId;

        try {

            orderId =
                    Integer.parseInt(orderIdParam);

        } catch (NumberFormatException e) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/OrderHistoryServlet"
            );

            return;
        }

        // =========================================
        // GET ORDER
        // =========================================

        Ordertable order =
                ordertableDAO.getOrderById(orderId);

        if (order == null) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/OrderHistoryServlet"
            );

            return;
        }

        // =========================================
        // SECURITY
        // Make sure this order belongs to user
        // =========================================

        if (order.getUserid() != user.getUserid()) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/OrderHistoryServlet"
            );

            return;
        }

        // =========================================
        // SEND ORDER TO JSP
        // =========================================

        req.setAttribute(
                "order",
                order
        );

        req.getRequestDispatcher(
                "/track-order.jsp"
        ).forward(req, res);
    }
}