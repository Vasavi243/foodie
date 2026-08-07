package com.food;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Restuarant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restuarant")
public class RestuarantServlet extends HttpServlet{

    private RestuarantDAOimp restaurantDAO;

    @Override
    public void init(){

        restaurantDAO = new RestuarantDAOimp();

    }

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException{

        String category = req.getParameter("category");

        String search = req.getParameter("search");

        List<Restuarant> ll;

        if(search!=null && !search.trim().isEmpty()){

            ll = restaurantDAO.searchRestaurant(search);

        }

        else if(category!=null && !category.trim().isEmpty()){

            ll = restaurantDAO.getRestaurantByCategory(category);

        }

        else{

            ll = restaurantDAO.getAllRestuarants();

        }

        req.setAttribute("ll", ll);

        RequestDispatcher rd =
                req.getRequestDispatcher("restuarant.jsp");

        rd.forward(req, res);

    }

}