package com.food;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import java.io.IOException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.tap.DAO.imp.*;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAO.*;
import com.tap.model.*;
import jakarta.servlet.annotation.*;
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		String name=req.getParameter("fullname");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String address=req.getParameter("address");
		String role=req.getParameter("role");
		
		String hashpw=BCrypt.hashpw(password,BCrypt.gensalt(12));
		User user=new User(name,email, hashpw, address, role);
		UserDAOimp us=new UserDAOimp();
		int i =us.addUser(user);
		
		if(i==1) {
			res.sendRedirect("login.html");
		}
		else {
			res.sendRedirect("register.html");
		}
	}

}
