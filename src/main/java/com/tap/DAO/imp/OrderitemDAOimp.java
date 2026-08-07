package com.tap.DAO.imp;

import java.util.List;
import java.util.ArrayList;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import com.tap.DAO.OrderitemDAO;
import com.tap.model.Orderitem;
import com.tap.utility.DBConnection;

public class OrderitemDAOimp implements OrderitemDAO {

    private static String insert =
            "INSERT INTO orderitem " +
            "(orderid, menuid, quantity, itemtotal) " +
            "VALUES (?, ?, ?, ?)";

    private static String getOrderItems =
            "SELECT * FROM orderitem WHERE orderid=?";

    private static String getAll =
            "SELECT * FROM orderitem";

    private static String update =
            "UPDATE orderitem SET " +
            "menuid=?, quantity=?, itemtotal=? " +
            "WHERE orderitem=?";

    private static String delete =
            "DELETE FROM orderitem WHERE orderid=?";


    @Override
    public void addOrder(Orderitem orderitem) {

        Connection con =
                DBConnection.getConnection();

        try {

            PreparedStatement p =
                    con.prepareStatement(insert);

            p.setInt(
                    1,
                    orderitem.getOrderid()
            );

            p.setInt(
                    2,
                    orderitem.getMenuid()
            );

            p.setInt(
                    3,
                    orderitem.getQuantity()
            );

            p.setBigDecimal(
                    4,
                    orderitem.getItemtotal()
            );

            int rows =
                    p.executeUpdate();

            System.out.println(
                    rows + " order item inserted"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }


    @Override
    public List<Orderitem> getOrderItems(int orderid) {

        Connection con =
                DBConnection.getConnection();

        List<Orderitem> list =
                new ArrayList<>();

        try {

            PreparedStatement p =
                    con.prepareStatement(getOrderItems);

            p.setInt(1, orderid);

            ResultSet rs =
                    p.executeQuery();

            while (rs.next()) {

                Orderitem orderitem =
                        resultSetFormat(rs);

                list.add(orderitem);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }


    @Override
    public void updateOrder(Orderitem orderitem) {

        Connection con =
                DBConnection.getConnection();

        try {

            PreparedStatement p =
                    con.prepareStatement(update);

            p.setInt(
                    1,
                    orderitem.getMenuid()
            );

            p.setInt(
                    2,
                    orderitem.getQuantity()
            );

            p.setBigDecimal(
                    3,
                    orderitem.getItemtotal()
            );

            p.setInt(
                    4,
                    orderitem.getOrderitem()
            );

            p.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }


    @Override
    public void deleteOrder(int orderid) {

        Connection con =
                DBConnection.getConnection();

        try {

            PreparedStatement p =
                    con.prepareStatement(delete);

            p.setInt(1, orderid);

            p.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }


    @Override
    public List<Orderitem> getAllOrders() {

        Connection con =
                DBConnection.getConnection();

        List<Orderitem> list =
                new ArrayList<>();

        try {

            Statement st =
                    con.createStatement();

            ResultSet rs =
                    st.executeQuery(getAll);

            while (rs.next()) {

                Orderitem orderitem =
                        resultSetFormat(rs);

                list.add(orderitem);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }


    public static Orderitem resultSetFormat(
            ResultSet rs) throws SQLException {

        int orderitem =
                rs.getInt("orderitem");

        int orderid =
                rs.getInt("orderid");

        int menuid =
                rs.getInt("menuid");

        int quantity =
                rs.getInt("quantity");

        BigDecimal itemtotal =
                rs.getBigDecimal("itemtotal");

        return new Orderitem(
                orderitem,
                orderid,
                menuid,
                quantity,
                itemtotal
        );
    }
}