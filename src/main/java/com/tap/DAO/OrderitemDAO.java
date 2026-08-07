package com.tap.DAO;

import java.util.List;

import com.tap.model.Orderitem;

public interface OrderitemDAO {

    // Add one order item
    void addOrder(Orderitem orderitem);

    // Get all items belonging to one order
    List<Orderitem> getOrderItems(int orderid);

    // Update one order item
    void updateOrder(Orderitem orderitem);

    // Delete all items belonging to one order
    void deleteOrder(int orderid);

    // Get all order items
    List<Orderitem> getAllOrders();
}