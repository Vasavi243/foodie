package com.tap.DAO;


import java.util.List;

import com.tap.model.Notification;



public interface NotificationDAO {


    // Get unread notification count for restaurant admin

    int getUnreadCount(int restaurantId);



    // Get all notifications of restaurant

    List<Notification> getNotifications(int restaurantId);



    // Mark all notifications as read

    void markAllAsRead(int restaurantId);
    
    
    void addNotification(Notification notification);



}