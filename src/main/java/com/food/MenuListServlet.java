package com.food;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.imp.MenuDAOimp;
import com.tap.model.Menu;
import com.tap.model.Restuarant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/MenuListServlet")
public class MenuListServlet extends HttpServlet {


    private MenuDAO menuDAO;


    @Override
    public void init() throws ServletException {

        menuDAO = new MenuDAOimp();

    }



    @Override
    protected void doGet(HttpServletRequest request, 
                        HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession();


        /*
         * Assuming restaurant object is stored
         * after restaurant login
         */

        Restuarant restaurant =
                (Restuarant) session.getAttribute("restaurant");



        if(restaurant == null){

            response.sendRedirect("restaurantLogin.jsp");
            return;

        }



        int restaurantId =
                restaurant.getRestuarantid();



        List<Menu> menuList =
                menuDAO.getMenuByRestaurantId(restaurantId);



        request.setAttribute("menuList", menuList);



        request.getRequestDispatcher("menuList.jsp")
               .forward(request, response);


    }

}