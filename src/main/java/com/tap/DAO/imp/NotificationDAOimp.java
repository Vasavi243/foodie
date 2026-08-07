package com.tap.DAO.imp;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.NotificationDAO;
import com.tap.model.Notification;
import com.tap.utility.DBConnection;



public class NotificationDAOimp implements NotificationDAO {



    // Get unread notification count

    @Override
    public int getUnreadCount(int restaurantId) {


        int count = 0;


        String query =
        "SELECT COUNT(*) FROM notifications WHERE restaurant_id=? AND status='UNREAD'";


        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query)){


            ps.setInt(1, restaurantId);


            ResultSet rs = ps.executeQuery();


            if(rs.next()){

                count = rs.getInt(1);

            }



        }
        catch(Exception e){

            e.printStackTrace();

        }



        return count;

    }







    // Get all notifications


    @Override
    public List<Notification> getNotifications(int restaurantId) {


        List<Notification> list =
                new ArrayList<>();



        String query =
        "SELECT * FROM notifications WHERE restaurant_id=? ORDER BY created_at DESC";



        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query)){



            ps.setInt(1, restaurantId);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                Notification notification =
                        new Notification();



                notification.setNotificationId(
                        rs.getInt("notification_id"));



                notification.setRestaurantId(
                        rs.getInt("restaurant_id"));



                notification.setTitle(
                        rs.getString("title"));



                notification.setMessage(
                        rs.getString("message"));



                notification.setStatus(
                        rs.getString("status"));



                notification.setCreatedAt(
                        rs.getTimestamp("created_at"));



                list.add(notification);


            }



        }
        catch(Exception e){

            e.printStackTrace();

        }



        return list;


    }





    @Override
    public void addNotification(Notification notification) {


        String query =
        "INSERT INTO notifications "
        +"(restaurant_id,title,message,status,created_at) "
        +"VALUES(?,?,?,?,NOW())";



        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query)){



            ps.setInt(1,
            notification.getRestaurantId());



            ps.setString(2,
            notification.getTitle());



            ps.setString(3,
            notification.getMessage());



            ps.setString(4,
            "UNREAD");



            ps.executeUpdate();



        }
        catch(Exception e){

            e.printStackTrace();

        }


    }


    // Mark all notifications as read


    @Override
    public void markAllAsRead(int restaurantId) {



        String query =
        "UPDATE notifications SET status='READ' WHERE restaurant_id=?";



        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query)){



            ps.setInt(1, restaurantId);



            ps.executeUpdate();



        }
        catch(Exception e){

            e.printStackTrace();

        }



    }



}