package com.food;

import java.io.IOException;

import com.tap.DAO.OrdertableDAO;
import com.tap.DAO.imp.OrdertableDAOimp;
import com.tap.model.Ordertable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        System.out.println("========= UPDATE ORDER =========");


        HttpSession session = request.getSession(false);


        if(session == null || session.getAttribute("loggedUser")==null){

            response.sendRedirect("login.html");
            return;
        }


        int orderId =
                Integer.parseInt(request.getParameter("orderId"));


        String status =
                request.getParameter("status");


        System.out.println("Order ID : " + orderId);
        System.out.println("Status : " + status);



        OrdertableDAO dao =
                new OrdertableDAOimp();


        dao.updateOrderStatus(orderId, status);


        System.out.println("STATUS UPDATED SUCCESSFULLY");


        response.sendRedirect(
                request.getContextPath()+"/adminOrder"
        );

    }
}