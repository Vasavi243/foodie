package com.food;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrdertableDAO ordertableDAO;


    @Override
    public void init() {

        ordertableDAO =
                new OrdertableDAOimp();
    }


    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {


        // =========================================
        // SESSION
        // =========================================

        HttpSession session =
                req.getSession(false);


        if(session == null) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/login.html"
            );

            return;
        }


        // =========================================
        // USER
        // =========================================

        User user =
                (User)
                session.getAttribute(
                        "loggedUser"
                );


        if(user == null) {

            res.sendRedirect(
                    req.getContextPath()
                    + "/login.html"
            );

            return;
        }


        // =========================================
        // GET USER ORDERS
        // =========================================

        List<Ordertable> orders =
                ordertableDAO.getOrdersByUserId(
                        user.getUserid()
                );


        System.out.println(
                "Orders found = "
                + orders.size()
        );


        // =========================================
        // SEND TO JSP
        // =========================================

        req.setAttribute(
                "orders",
                orders
        );


        req.getRequestDispatcher(
                "/order-history.jsp"
        ).forward(req, res);
    }
}