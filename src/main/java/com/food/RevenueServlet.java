package com.food;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import com.tap.DAO.OrdertableDAO;
import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.OrdertableDAOimp;
import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Ordertable;
import com.tap.model.Restuarant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/revenue")
public class RevenueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session==null){
            response.sendRedirect("login.html");
            return;
        }

        User admin=(User)session.getAttribute("loggedUser");

        if(admin==null){
            response.sendRedirect("login.html");
            return;
        }

        RestuarantDAO restaurantDAO=new RestuarantDAOimp();

        Restuarant restaurant=
                restaurantDAO.getRestaurantByAdminUserId(admin.getUserid());

        if(restaurant==null){
            response.sendRedirect("dashboard");
            return;
        }

        OrdertableDAO orderDAO=new OrdertableDAOimp();

        List<Ordertable> orders=
                orderDAO.getOrdersByRestaurantId(
                        restaurant.getRestuarantid());

        BigDecimal totalRevenue=
                orderDAO.getTotalRevenue(
                        restaurant.getRestuarantid());

        int deliveredOrders=0;
        int pendingOrders=0;

        for(Ordertable order:orders){

            if(order.getStatus().equalsIgnoreCase("Delivered")){
                deliveredOrders++;
            }

            if(order.getStatus().equalsIgnoreCase("Pending")){
                pendingOrders++;
            }
        }

        request.setAttribute("restaurant",restaurant);
        request.setAttribute("orders",orders);
        request.setAttribute("totalRevenue",totalRevenue);
        request.setAttribute("deliveredOrders",deliveredOrders);
        request.setAttribute("pendingOrders",pendingOrders);

        request.getRequestDispatcher("revenue.jsp")
               .forward(request,response);
    }

}