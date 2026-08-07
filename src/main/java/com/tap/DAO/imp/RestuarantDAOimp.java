package com.tap.DAO.imp;

import java.util.List;
import java.util.ArrayList;
import java.math.BigDecimal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import com.tap.DAO.RestuarantDAO;
import com.tap.model.Restuarant;
import com.tap.utility.DBConnection;


public class RestuarantDAOimp implements RestuarantDAO {


    private static final String INSERT =
            "INSERT INTO restuarant(name,cuisinetype,deliverytime,address,adminuserid,rating,isactive,imagepath) VALUES(?,?,?,?,?,?,?,?)";


    private static final String GET_BY_ID =
            "SELECT * FROM restuarant WHERE restuarantid=?";


    private static final String DELETE =
            "DELETE FROM restuarant WHERE restuarantid=?";


    private static final String UPDATE =
            "UPDATE restuarant SET name=?, cuisinetype=?, deliverytime=?, address=?, adminuserid=?, rating=?, isactive=?, imagepath=? WHERE restuarantid=?";


    private static final String GET_RESTAURANT_BY_ADMIN =
            "SELECT * FROM restuarant WHERE adminuserid=? ORDER BY restuarantid DESC LIMIT 1";

    @Override
    public void addRestuarant(Restuarant restuarant) {


        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(INSERT);


            ps.setString(1, restuarant.getName());
            ps.setString(2, restuarant.getCuisinetype());
            ps.setInt(3, restuarant.getDeliverytime());
            ps.setString(4, restuarant.getAddress());
            ps.setInt(5, restuarant.getAdminuserid());
            ps.setBigDecimal(6, restuarant.getRating());
            ps.setInt(7, restuarant.getIsactive());
            ps.setString(8, restuarant.getImagepath());


            int rows = ps.executeUpdate();


            System.out.println(rows + " Restaurant Created");


        } catch(Exception e) {

            e.printStackTrace();
        }

    }



    @Override
    public Restuarant getRestaurantByAdminUserId(int adminUserId) {


        Restuarant restaurant = null;


        try {


            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(GET_RESTAURANT_BY_ADMIN);


            ps.setInt(1, adminUserId);


            ResultSet rs = ps.executeQuery();



            if(rs.next()) {


                restaurant = printresultset(rs);

            }


        } catch(Exception e) {

            e.printStackTrace();

        }


        return restaurant;

    }





    @Override
    public Restuarant getRestuarant(int restuarantid) {


        Restuarant restaurant = null;


        try {


            Connection con = DBConnection.getConnection();


            PreparedStatement ps =
                    con.prepareStatement(GET_BY_ID);



            ps.setInt(1, restuarantid);



            ResultSet rs = ps.executeQuery();



            if(rs.next()) {


                restaurant = printresultset(rs);

            }


        } catch(Exception e) {


            e.printStackTrace();

        }



        return restaurant;

    }





    @Override
    public boolean updateRestuarant(Restuarant restaurant) {


        boolean status = false;


        try {


            Connection con = DBConnection.getConnection();


            PreparedStatement ps =
                    con.prepareStatement(UPDATE);



            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getCuisinetype());
            ps.setInt(3, restaurant.getDeliverytime());
            ps.setString(4, restaurant.getAddress());
            ps.setInt(5, restaurant.getAdminuserid());
            ps.setBigDecimal(6, restaurant.getRating());
            ps.setInt(7, restaurant.getIsactive());
            ps.setString(8, restaurant.getImagepath());
            ps.setInt(9, restaurant.getRestuarantid());



            int rows = ps.executeUpdate();



            if(rows > 0) {

                status = true;

            }



        } catch(Exception e) {

            e.printStackTrace();

        }



        return status;

    }





    @Override
    public void deleteRestuarant(int restuarantid) {


        try {


            Connection con = DBConnection.getConnection();


            PreparedStatement ps =
                    con.prepareStatement(DELETE);



            ps.setInt(1, restuarantid);



            int rows = ps.executeUpdate();



            System.out.println(rows + " Restaurant Deleted");



        } catch(Exception e) {

            e.printStackTrace();

        }

    }







    @Override
    public List<Restuarant> getAllRestuarants() {


        List<Restuarant> list = new ArrayList<>();


        String query =
                "SELECT * FROM restuarant WHERE isactive=1";



        try {


            Connection con = DBConnection.getConnection();


            Statement st = con.createStatement();


            ResultSet rs =
                    st.executeQuery(query);



            while(rs.next()) {


                list.add(printresultset(rs));

            }


        } catch(Exception e) {

            e.printStackTrace();

        }



        return list;

    }







    @Override
    public List<Restuarant> searchRestaurant(String search) {


        List<Restuarant> list = new ArrayList<>();


        String query =
        "SELECT * FROM restuarant WHERE isactive=1 AND (name LIKE ? OR cuisinetype LIKE ?)";



        try {


            Connection con = DBConnection.getConnection();


            PreparedStatement ps =
                    con.prepareStatement(query);



            ps.setString(1,"%"+search+"%");
            ps.setString(2,"%"+search+"%");



            ResultSet rs = ps.executeQuery();



            while(rs.next()) {


                list.add(printresultset(rs));

            }



        } catch(Exception e) {


            e.printStackTrace();

        }



        return list;

    }







    @Override
    public List<Restuarant> getRestaurantByCategory(String category) {


        List<Restuarant> list = new ArrayList<>();


        String query =
        "SELECT * FROM restuarant WHERE isactive=1 AND cuisinetype LIKE ?";



        try {


            Connection con = DBConnection.getConnection();


            PreparedStatement ps =
                    con.prepareStatement(query);



            ps.setString(1,"%"+category+"%");



            ResultSet rs = ps.executeQuery();



            while(rs.next()) {


                list.add(printresultset(rs));

            }



        } catch(Exception e) {

            e.printStackTrace();

        }



        return list;

    }







    public static Restuarant printresultset(ResultSet rs) throws SQLException {


        Restuarant r = new Restuarant();


        r.setRestuarantid(rs.getInt("restuarantid"));
        r.setName(rs.getString("name"));
        r.setCuisinetype(rs.getString("cuisinetype"));
        r.setDeliverytime(rs.getInt("deliverytime"));
        r.setAddress(rs.getString("address"));
        r.setAdminuserid(rs.getInt("adminuserid"));
        r.setRating(rs.getBigDecimal("rating"));
        r.setIsactive(rs.getInt("isactive"));
        r.setImagepath(rs.getString("imagepath"));


        return r;

    }


}