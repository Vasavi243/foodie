package com.tap.DAO;
import java.math.BigDecimal;
import java.util.List;
import com.tap.model.Ordertable;

public interface OrdertableDAO {

    public int addOrder(Ordertable ordertable);

    public Ordertable getOrder(int orderid);

    public void updateOrder(Ordertable ordertable);

    public void deleteOrder(int orderid);

    public List<Ordertable> getAllOrders();

    public List<Ordertable> getOrdersByUserId(int userid);
   
    public  Ordertable getOrderById(int orderId);
    
    List<Ordertable> getOrdersByRestaurantId(int restaurantId);

    int getTodayOrderCount(int restaurantId);

    int getPendingOrderCount(int restaurantId);

    BigDecimal getTotalRevenue(int restaurantId);
    
    void updateOrderStatus(int orderId, String status);
    
}