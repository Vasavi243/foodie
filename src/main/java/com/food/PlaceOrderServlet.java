package com.food;

import java.io.IOException;
import java.math.BigDecimal;

import com.tap.DAO.OrderitemDAO;
import com.tap.DAO.OrdertableDAO;
import com.tap.DAO.NotificationDAO;

import com.tap.DAO.imp.OrderitemDAOimp;
import com.tap.DAO.imp.OrdertableDAOimp;
import com.tap.DAO.imp.NotificationDAOimp;

import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Orderitem;
import com.tap.model.Ordertable;
import com.tap.model.Notification;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;


    private OrdertableDAO ordertableDAO;

    private OrderitemDAO orderitemDAO;



    @Override
    public void init() {


        ordertableDAO =
                new OrdertableDAOimp();


        orderitemDAO =
                new OrderitemDAOimp();

    }





    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {



        HttpSession session =
                req.getSession(false);



        if(session == null) {


            res.sendRedirect(
                    req.getContextPath()
                    + "/login.html"
            );

            return;

        }





        User user =
                (User)session.getAttribute("loggedUser");



        if(user == null) {


            res.sendRedirect(
                    req.getContextPath()
                    + "/login.html"
            );


            return;

        }





        Cart cart =
                (Cart)session.getAttribute("cart");



        if(cart == null || cart.isEmpty()) {


            res.sendRedirect(
                    req.getContextPath()
                    + "/CartServlet"
            );


            return;

        }





        String paymentmethod =
                req.getParameter("paymentmethod");



        if(paymentmethod == null ||
           paymentmethod.trim().isEmpty()) {


            res.sendRedirect(
                    req.getContextPath()
                    + "/checkout"
            );


            return;

        }






        if(!paymentmethod.equals("CASH") &&
           !paymentmethod.equals("UPI") &&
           !paymentmethod.equals("CARD")) {


            res.sendRedirect(
                    req.getContextPath()
                    + "/checkout"
            );


            return;

        }






        BigDecimal itemsTotal =
                BigDecimal.ZERO;



        for(CartItem item :
                cart.getItems().values()) {


            BigDecimal itemTotal =
                    item.getTotalPrice();



            if(itemTotal == null) {

                itemTotal =
                        BigDecimal.ZERO;

            }



            itemsTotal =
                    itemsTotal.add(itemTotal);

        }





        BigDecimal gst =
                itemsTotal.multiply(
                        new BigDecimal("0.05")
                );




        BigDecimal deliveryCharge =
                new BigDecimal("40");



        BigDecimal packagingCharge =
                new BigDecimal("20");






        BigDecimal grandTotal =
                itemsTotal
                .add(gst)
                .add(deliveryCharge)
                .add(packagingCharge);







        CartItem firstItem =
                cart.getItems()
                    .values()
                    .iterator()
                    .next();




        int restaurantId =
                firstItem.getRestuarantid();







        Ordertable order =
                new Ordertable();



        order.setUserid(
                user.getUserid()
        );



        order.setRestuarantid(
                restaurantId
        );



        order.setTotalamount(
                grandTotal
        );



        order.setStatus(
                "PENDING"
        );



        order.setPaymentmethod(
                paymentmethod
        );







        int orderId =
                ordertableDAO.addOrder(order);




        System.out.println(
                "Generated Order ID = "
                + orderId
        );







        if(orderId <= 0) {


            req.setAttribute(
                    "error",
                    "Unable to place order."
            );


            req.setAttribute(
                    "user",
                    user
            );


            req.setAttribute(
                    "cart",
                    cart
            );



            req.getRequestDispatcher(
                    "checkout.jsp"
            ).forward(req,res);



            return;

        }








        for(CartItem item :
                cart.getItems().values()) {



            Orderitem orderItem =
                    new Orderitem();



            orderItem.setOrderid(
                    orderId
            );



            orderItem.setMenuid(
                    item.getMenuid()
            );



            orderItem.setQuantity(
                    item.getQty()
            );



            orderItem.setItemtotal(
                    item.getTotalPrice()
            );



            orderitemDAO.addOrder(
                    orderItem
            );



        }








        // =========================================
        // CREATE RESTAURANT NOTIFICATION
        // =========================================



        NotificationDAO notificationDAO =
                new NotificationDAOimp();




        Notification notification =
                new Notification();




        notification.setRestaurantId(
                restaurantId
        );




        notification.setTitle(
                "New Order Received"
        );




        notification.setMessage(
                "New order #" 
                + orderId
                + " received. Amount ₹"
                + grandTotal
        );




        notification.setStatus(
                "UNREAD"
        );




        notificationDAO.addNotification(
                notification
        );



        System.out.println(
                "Restaurant notification created"
        );







        session.setAttribute(
                "orderId",
                orderId
        );



        session.setAttribute(
                "orderTotal",
                grandTotal
        );



        session.setAttribute(
                "paymentMethod",
                paymentmethod
        );






        cart.clearCart();






        res.sendRedirect(
                req.getContextPath()
                + "/order-success.jsp"
        );



    }

}