package com.food;

import java.io.IOException;

import com.tap.DAO.imp.MenuDAOimp;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuDAOimp menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOimp();
    }

    // ---------------------- GET ----------------------

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        req.setAttribute("cart", cart);

        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
        rd.forward(req, res);
    }

    // ---------------------- POST ----------------------

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");

        if (action == null) {
            action = "add";
        }

        switch (action) {

        case "add":
            addItem(req, cart);
            break;

        case "update":
            updateItem(req, cart);
            break;

        case "increase":
            increaseQty(req, cart);
            break;

        case "decrease":
            decreaseQty(req, cart);
            break;

        case "remove":
            removeItem(req, cart);
            break;
        }

        session.setAttribute("cart", cart);

        req.setAttribute("cart", cart);

        RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
        rd.forward(req, res);
    }

    // ---------------------- Add Item ----------------------

    private void addItem(HttpServletRequest req,
            Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        int qty = Integer.parseInt(req.getParameter("qty"));

        Menu menu = menuDAO.getMenu(menuId);

        if (menu == null) {
            return;
        }

        CartItem cartItem = new CartItem(
                menu.getMenuid(),
                menu.getRestuarantid(),
                menu.getItemname(),
                menu.getPrice(),
                qty);

        cart.addItem(cartItem);
    }

    // ---------------------- Update ----------------------

    private void updateItem(HttpServletRequest req,
            Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        int qty = Integer.parseInt(req.getParameter("qty"));

        cart.updateItem(menuId, qty);
    }

    // ---------------------- Increase ----------------------

    private void increaseQty(HttpServletRequest req,
            Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        cart.increaseQty(menuId);
    }

    // ---------------------- Decrease ----------------------

    private void decreaseQty(HttpServletRequest req,
            Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        cart.decreaseQty(menuId);
    }

    // ---------------------- Remove ----------------------

    private void removeItem(HttpServletRequest req,
            Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        cart.removeItem(menuId);
    }
}