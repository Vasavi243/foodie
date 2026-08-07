package com.food;


import java.io.IOException;


import com.tap.DAO.RestuarantDAO;
import com.tap.DAO.imp.RestuarantDAOimp;
import com.tap.model.Restuarant;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/UpdateRestuarantServlet")
public class UpdateRestuarantServlet extends HttpServlet {



@Override
protected void doPost(HttpServletRequest req,
        HttpServletResponse res)
        throws ServletException, IOException {


    try {


        int restuarantid =
        Integer.parseInt(req.getParameter("restuarantid"));



        String name =
        req.getParameter("name");



        String cuisinetype =
        req.getParameter("cuisinetype");



        String address =
        req.getParameter("address");



        int deliverytime =
        Integer.parseInt(req.getParameter("deliverytime"));



        int isactive =
        Integer.parseInt(req.getParameter("isactive"));



        String imagepath =
        req.getParameter("imagepath");



        Restuarant restaurant =
                new Restuarant();



        restaurant.setRestuarantid(restuarantid);

        restaurant.setName(name);

        restaurant.setCuisinetype(cuisinetype);

        restaurant.setAddress(address);

        restaurant.setDeliverytime(deliverytime);

        restaurant.setIsactive(isactive);

        restaurant.setImagepath(imagepath);



        RestuarantDAO dao =
                new RestuarantDAOimp();



        boolean result =
                dao.updateRestuarant(restaurant);



        if(result){


            System.out.println("Restaurant Updated");


            res.sendRedirect(req.getContextPath()+"/profile");


        }
        else{


            System.out.println("Update Failed");


            res.sendRedirect(req.getContextPath()+"/profile");


        }



    }
    catch(Exception e){


        e.printStackTrace();


        res.sendRedirect(req.getContextPath()+"/profile");


    }


}


}