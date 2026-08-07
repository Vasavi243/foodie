package com.food;

import java.io.IOException;

import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Restuarant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/profile")
public class ProfileServlet extends HttpServlet  {


    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {



        HttpSession session = req.getSession(false);


        System.out.println("===== PROFILE =====");


        if(session == null) {

            System.out.println("Session is null");

            res.sendRedirect(req.getContextPath()+"/login.html");
            return;
        }



        // Get logged-in user

        User user = (User) session.getAttribute("loggedUser");


        System.out.println("Logged User : "+user);



        if(user == null) {

            System.out.println("User is null");

            res.sendRedirect(req.getContextPath()+"/login.html");
            return;
        }



        /*
         * Check Role
         */


        String role = user.getRole();



        System.out.println("User Role : "+role);




        // CUSTOMER PROFILE

        if(role.equalsIgnoreCase("customer")) {


            req.setAttribute("user", user);


            req.getRequestDispatcher("/customerProfile.jsp")
               .forward(req, res);



        }



        // RESTAURANT ADMIN PROFILE

        else if(role.equalsIgnoreCase("admin")) {



            RestuarantDAO dao = new RestuarantDAOimp();



            Restuarant restaurant =
                    dao.getRestaurantByAdminUserId(user.getUserid());



            if(restaurant == null) {


                System.out.println("Restaurant not found");

                res.sendRedirect(req.getContextPath()+"/adminHome.jsp");

                return;

            }



            req.setAttribute("restaurant", restaurant);



            req.getRequestDispatcher("/restuarantProfile.jsp")
               .forward(req, res);



        }



        else {


            System.out.println("Invalid Role");

            res.sendRedirect(req.getContextPath()+"/login.html");

        }


    }

}