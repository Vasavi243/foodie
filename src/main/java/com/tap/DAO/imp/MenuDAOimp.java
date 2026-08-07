package com.tap.DAO.imp;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;


public class MenuDAOimp implements MenuDAO {


    private static String insert =
            "INSERT INTO menu(restuarantid,itemname,description,price,isavaliable,category,createdat,updatedat,deletedat,imagepath) VALUES(?,?,?,?,?,?,?,?,?,?)";


    private static String update =
            "UPDATE menu SET restuarantid=?,itemname=?,description=?,price=?,isavaliable=?,category=?,updatedat=?,imagepath=? WHERE menuid=?";


    private static String get =
            "SELECT * FROM menu WHERE menuid=?";


    private static String getAll =
            "SELECT * FROM menu";


    private static String delete =
            "UPDATE menu SET deletedat=? WHERE menuid=?";



    private static final String GET_MENU_BY_RESTAURANT =
            "SELECT * FROM menu WHERE restuarantid=? AND deletedat IS NULL";


    private static final String GET_MENU_COUNT =
            "SELECT COUNT(*) FROM menu WHERE restuarantid=? AND deletedat IS NULL";

   
    private static final String SEARCH_MENU =
            "SELECT * FROM menu "
          + "WHERE restuarantid=? "
          + "AND deletedat IS NULL "
          + "AND (itemname LIKE ? OR category LIKE ?)";
    // ADD MENU
    @Override
    public void addMenu(Menu menu) {


        Connection con = DBConnection.getConnection();


        try {


            PreparedStatement ps =
                    con.prepareStatement(insert);



            ps.setInt(1, menu.getRestuarantid());

            ps.setString(2, menu.getItemname());

            ps.setString(3, menu.getDescription());

            ps.setBigDecimal(4, menu.getPrice());

            ps.setInt(5, menu.getIsavaliable());

            ps.setString(6, menu.getCategory());



            Timestamp time =
                    new Timestamp(System.currentTimeMillis());

            ps.setTimestamp(7, time);

            ps.setTimestamp(8, time);



            // deletedat should be NULL
            ps.setNull(9, Types.TIMESTAMP);



            ps.setString(10, menu.getImagepath());



            int rows = ps.executeUpdate();


            System.out.println(rows+" menu inserted");


        }
        catch(Exception e){

            e.printStackTrace();

        }

    }





    // GET MENU BY RESTAURANT
    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {


        List<Menu> menuList = new ArrayList<>();


        Connection con =
                DBConnection.getConnection();


        try {


            PreparedStatement ps =
                    con.prepareStatement(GET_MENU_BY_RESTAURANT);



            ps.setInt(1, restaurantId);



            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()){


                Menu menu =
                        printresult(rs);


                menuList.add(menu);

            }



        }
        catch(Exception e){

            e.printStackTrace();

        }


        return menuList;

    }







    // GET SINGLE MENU
    @Override
    public Menu getMenu(int menuid) {


        Menu menu = null;


        Connection con =
                DBConnection.getConnection();



        try {


            PreparedStatement ps =
                    con.prepareStatement(get);



            ps.setInt(1, menuid);



            ResultSet rs =
                    ps.executeQuery();



            if(rs.next()){


                menu = printresult(rs);


            }



        }
        catch(Exception e){

            e.printStackTrace();

        }



        return menu;

    }








    // MENU COUNT
    @Override
    public int getMenuCount(int restaurantId) {


        int count = 0;


        Connection con =
                DBConnection.getConnection();



        try {


            PreparedStatement ps =
                    con.prepareStatement(GET_MENU_COUNT);



            ps.setInt(1, restaurantId);



            ResultSet rs =
                    ps.executeQuery();



            if(rs.next()){

                count = rs.getInt(1);

            }



        }
        catch(Exception e){

            e.printStackTrace();

        }



        return count;

    }





    @Override
    public List<Menu> searchMenu(String keyword, int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement ps =
                    con.prepareStatement(SEARCH_MENU);

            ps.setInt(1, restaurantId);

            ps.setString(2, "%" + keyword + "%");

            ps.setString(3, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                menuList.add(printresult(rs));

            }

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return menuList;
    }



    // UPDATE MENU
    @Override
    public void updateMenu(Menu menu) {


        Connection con =
                DBConnection.getConnection();



        try {


            PreparedStatement ps =
                    con.prepareStatement(update);



            ps.setInt(1, menu.getRestuarantid());

            ps.setString(2, menu.getItemname());

            ps.setString(3, menu.getDescription());

            ps.setBigDecimal(4, menu.getPrice());

            ps.setInt(5, menu.getIsavaliable());

            ps.setString(6, menu.getCategory());



            ps.setTimestamp(7,
                    new Timestamp(System.currentTimeMillis()));



            ps.setString(8,
                    menu.getImagepath());



            ps.setInt(9,
                    menu.getMenuid());



            int rows =
                    ps.executeUpdate();



            System.out.println(rows+" menu updated");


        }
        catch(Exception e){

            e.printStackTrace();

        }

    }









    // SOFT DELETE MENU
    @Override
    public void deleteMenu(int menuid) {


        Connection con =
                DBConnection.getConnection();



        try {


            PreparedStatement ps =
                    con.prepareStatement(delete);



            ps.setTimestamp(1,
                    new Timestamp(System.currentTimeMillis()));



            ps.setInt(2, menuid);



            int rows =
                    ps.executeUpdate();



            System.out.println(rows+" menu deleted");


        }
        catch(Exception e){

            e.printStackTrace();

        }

    }









    // GET ALL MENU
    @Override
    public List<Menu> getAllMenu() {


        List<Menu> list =
                new ArrayList<>();


        Connection con =
                DBConnection.getConnection();



        try {


            Statement st =
                    con.createStatement();



            ResultSet rs =
                    st.executeQuery(getAll);



            while(rs.next()){


                list.add(printresult(rs));


            }


        }
        catch(Exception e){

            e.printStackTrace();

        }



        return list;

    }










    // COMMON RESULT SET METHOD
    public static Menu printresult(ResultSet rs)
            throws SQLException {



        int id =
                rs.getInt("menuid");


        int restaurantid =
                rs.getInt("restuarantid");


        String itemname =
                rs.getString("itemname");


        String description =
                rs.getString("description");


        BigDecimal price =
                rs.getBigDecimal("price");


        int available =
                rs.getInt("isavaliable");


        String category =
                rs.getString("category");


        Timestamp createdat =
                rs.getTimestamp("createdat");


        Timestamp updatedat =
                rs.getTimestamp("updatedat");


        Timestamp deletedat =
                rs.getTimestamp("deletedat");


        String imagepath =
                rs.getString("imagepath");



        return new Menu(
                id,
                restaurantid,
                itemname,
                description,
                price,
                available,
                category,
                createdat,
                updatedat,
                deletedat,
                imagepath
        );

    }

}