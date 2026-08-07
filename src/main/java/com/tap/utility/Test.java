package com.tap.utility;
import com.tap.DAO.imp.UserDAOimp;

import com.tap.DAO.imp.MenuDAOimp;
import com.tap.model.*;
import com.tap.DAO.imp.*;
import java.util.List;
import com.tap.model.User;
import java.math.BigDecimal;
import com.tap.DAO.imp.*;
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		User user=new User("suchi","Vasavi@gamil.com","vasavi@123","kadapa","customer");
UserDAOimp us=new UserDAOimp();
us.addUser(user);
//User i=us.getUser(1);
//System.out.print(i);
//List<User>res=us.getAllUsers();
//System.out.print(res);
//User user=us.getUser(1);
//user.setEmail("update@123");
//us.updateUser(user);
//User user=us.getUser(1);
//us.deleteUser(user.getUserid());
		//Restuarant restuarant=new Restuarant("indus","pizza", 30,"kadapa",101,new BigDecimal("4.5") , 1);
		//RestuarantDAOimp rs=new RestuarantDAOimp();
		//rs.addRestuarant(restuarant);
		//Restuarant i=rs.getRestuarant(1);
		//System.out.print(i);
		//List<Restuarant>res=rs.getAllRestuarants();
		//System.out.print(res);
		//Restuarant i=rs.getRestuarant(1);
		//i.setName("tollyword");
		//rs.updateRestuarant(i);
		//Restuarant res=rs.getRestuarant(1);
		//rs.deleteRestuarant(res.getRestuarantid());
		
		
		//Ordertable od=new Ordertable(1,101,new BigDecimal("1000"),"pending","cash");
		//OrdertableDAOimp ip=new OrdertableDAOimp();
		//ip.addOrder(od);
		//Ordertable i=ip.getOrder(1);
		//System.out.print(i);
		//List<Ordertable> ls=ip.getAllOrders();
		//System.out.print(ls);
		//Ordertable i=ip.getOrder(1);
		//i.setPaymentmethod("CARD");
		//ip.updateOrder(i);
		//ip.deleteOrder(i.getOrderid());
		
		
		//Orderitem o=new Orderitem(101,1,1,12,new BigDecimal("1200"));
		//OrderitemDAOimp or=new OrderitemDAOimp();
		//or.addOrder(o);
		//Orderitem i =or.getOrder(1);
		//System.out.print(i);
		//List<Orderitem>oo=or.getAllOrders();		
		//System.out.print(oo);
		//Orderitem i=or.getOrder(1);
		//i.setMenuid(2);
		//or.updateOrder(i);
		//Orderitem i=or.getOrder(1);
		//or.deleteOrder(i.getOrderid());
		
		//Menu m=new Menu(1,"paneer","it is healthy",new BigDecimal("170.00"),1,"food");
		//MenuDAOimp mm=new MenuDAOimp();
		//mm.addMenu(m);
		//Menu i=mm.getMenu(1);
		//System.out.print(i);
		//List<Menu> id=mm.getAllMenu();
		//System.out.print(id);
		//i.setItemname("maggi");
		//mm.updateMenu(i);
		//Menu i=mm.getMenu(1);
	//mm.deleteMenu(i.getMenuid());
	}

}
