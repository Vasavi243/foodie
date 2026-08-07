package com.tap.model;

import java.sql.Timestamp;


public class Notification {


    private int notificationId;

    private int restaurantId;

    private String title;

    private String message;

    private String status;

    private Timestamp createdAt;



    // Default Constructor

    public Notification() {

    }





    // Parameterized Constructor

    public Notification(int notificationId,
                        int restaurantId,
                        String title,
                        String message,
                        String status,
                        Timestamp createdAt) {


        this.notificationId = notificationId;

        this.restaurantId = restaurantId;

        this.title = title;

        this.message = message;

        this.status = status;

        this.createdAt = createdAt;

    }






    public int getNotificationId() {

        return notificationId;

    }



    public void setNotificationId(int notificationId) {

        this.notificationId = notificationId;

    }






    public int getRestaurantId() {

        return restaurantId;

    }



    public void setRestaurantId(int restaurantId) {

        this.restaurantId = restaurantId;

    }






    public String getTitle() {

        return title;

    }



    public void setTitle(String title) {

        this.title = title;

    }






    public String getMessage() {

        return message;

    }



    public void setMessage(String message) {

        this.message = message;

    }






    public String getStatus() {

        return status;

    }



    public void setStatus(String status) {

        this.status = status;

    }






    public Timestamp getCreatedAt() {

        return createdAt;

    }



    public void setCreatedAt(Timestamp createdAt) {

        this.createdAt = createdAt;

    }



}