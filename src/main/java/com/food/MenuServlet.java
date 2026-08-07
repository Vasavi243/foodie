package com.food;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.tap.DAO.imp.*;
import java.util.List;
import com.tap.model.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException , IOException {
		
		MenuDAOimp m=new MenuDAOimp();
		int restuarantid=Integer.parseInt(req.getParameter("restuarantId"));
		List<Menu> all=m.getMenuByRestaurantId(restuarantid);
		
		
		for(Menu menu: all) {
			System.out.println(menu);
		}
		req.setAttribute("all",all);
		
		
		RequestDispatcher rd=req.getRequestDispatcher("menu.jsp");
		rd.forward(req, res);
		
	}

}
