package com.tap.DAO.imp;

import java.util.List;
import java.util.ArrayList;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.SQLException;

import com.tap.DAO.OrdertableDAO;
import com.tap.model.Ordertable;
import com.tap.utility.DBConnection;

public class OrdertableDAOimp implements OrdertableDAO {

    // =========================================================
    // SQL QUERIES
    // =========================================================

    private static String insert =
            "INSERT INTO ordertable " +
            "(userid, restuarantid, totalamount, status, paymentmethod) " +
            "VALUES (?, ?, ?, ?, ?)";

    private static String get =
            "SELECT * FROM ordertable WHERE orderid=?";

    private static String delete =
            "DELETE FROM ordertable WHERE orderid=?";

    private static String update =
            "UPDATE ordertable SET " +
            "userid=?, restuarantid=?, orderdate=?, totalamount=?, " +
            "status=?, paymentmethod=? " +
            "WHERE orderid=?";

    private static String getAll =
            "SELECT * FROM ordertable";
    
    private static final String GET_ORDERS_BY_RESTAURANT =
            "SELECT * FROM ordertable WHERE restuarantid=? ORDER BY orderdate DESC";

    private static final String GET_TODAY_ORDER_COUNT =
            "SELECT COUNT(*) FROM ordertable WHERE restuarantid=? AND DATE(orderdate)=CURDATE()";

    private static final String GET_PENDING_ORDER_COUNT =
            "SELECT COUNT(*) FROM ordertable WHERE restuarantid=? AND status='PENDING'";

    private static final String GET_TOTAL_REVENUE =
            "SELECT SUM(totalamount) FROM ordertable WHERE restuarantid=? AND status='DELIVERED'";


    // =========================================================
    // ADD ORDER
    // =========================================================
    @Override
    public void updateOrderStatus(int orderId, String status) {

        Connection con = DBConnection.getConnection();

        String sql =
                "UPDATE ordertable SET status=? WHERE orderid=?";

        try {

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, status);

            ps.setInt(2, orderId);

            int rows = ps.executeUpdate();

            System.out.println(rows + " order status updated");


        } catch(Exception e) {

            e.printStackTrace();

        }

    }
    @Override
    public int addOrder(Ordertable ordertable) {

        Connection con = DBConnection.getConnection();

        int generatedOrderId = 0;

        try {

            PreparedStatement st =
                    con.prepareStatement(
                            insert,
                            Statement.RETURN_GENERATED_KEYS
                    );

            st.setInt(
                    1,
                    ordertable.getUserid()
            );

            st.setInt(
                    2,
                    ordertable.getRestuarantid()
            );

            st.setBigDecimal(
                    3,
                    ordertable.getTotalamount()
            );

            st.setString(
                    4,
                    ordertable.getStatus()
            );

            st.setString(
                    5,
                    ordertable.getPaymentmethod()
            );

            int rows = st.executeUpdate();

            System.out.println(
                    rows + " order row inserted"
            );

            ResultSet rs =
                    st.getGeneratedKeys();

            if (rs.next()) {

                generatedOrderId =
                        rs.getInt(1);
            }

            System.out.println(
                    "Generated Order ID = "
                    + generatedOrderId
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

        return generatedOrderId;
    }


    // =========================================================
    // GET ONE ORDER
    // =========================================================

    @Override
    public Ordertable getOrder(int orderid) {

        Connection con =
                DBConnection.getConnection();

        Ordertable order = null;

        try {

            PreparedStatement ps =
                    con.prepareStatement(get);

            ps.setInt(1, orderid);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                order =
                        resultSetFormat(rs);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return order;
    }


    // =========================================================
    // GET ORDERS BY USER ID
    // =========================================================

    @Override
    public List<Ordertable> getOrdersByUserId(int userid) {

        Connection con =
                DBConnection.getConnection();

        List<Ordertable> orders =
                new ArrayList<>();

        String sql =
                "SELECT * FROM ordertable " +
                "WHERE userid = ? " +
                "ORDER BY orderdate DESC";

        try {

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userid);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Ordertable order =
                        resultSetFormat(rs);

                orders.add(order);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return orders;
    }
    
    @Override
    public int getTodayOrderCount(int restaurantId) {

        Connection con = DBConnection.getConnection();

        int count = 0;

        try {

            PreparedStatement ps =
                    con.prepareStatement(GET_TODAY_ORDER_COUNT);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return count;
    }
    
    @Override
    public int getPendingOrderCount(int restaurantId) {

        Connection con = DBConnection.getConnection();

        int count = 0;

        try {

            PreparedStatement ps =
                    con.prepareStatement(GET_PENDING_ORDER_COUNT);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return count;
    }

    @Override
    public List<Ordertable> getOrdersByRestaurantId(int restaurantId) {

        Connection con = DBConnection.getConnection();

        List<Ordertable> orders = new ArrayList<>();

        try {

            PreparedStatement ps =
                    con.prepareStatement(GET_ORDERS_BY_RESTAURANT);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Ordertable order = new Ordertable();

                order.setOrderid(rs.getInt("orderid"));
                order.setUserid(rs.getInt("userid"));
                order.setRestuarantid(rs.getInt("restuarantid"));
                order.setOrderdate(rs.getTimestamp("orderdate"));
                order.setTotalamount(rs.getBigDecimal("totalamount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentmethod(rs.getString("paymentmethod"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }@Override
    public BigDecimal getTotalRevenue(int restaurantId) {

        Connection con = DBConnection.getConnection();

        BigDecimal revenue = BigDecimal.ZERO;

        try {

            PreparedStatement ps =
                    con.prepareStatement(GET_TOTAL_REVENUE);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                if (rs.getBigDecimal(1) != null) {

                    revenue = rs.getBigDecimal(1);

                }

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return revenue;
    }

    // =========================================================
    // UPDATE ORDER
    // =========================================================

    @Override
    public void updateOrder(Ordertable ordertable) {

        Connection con =
                DBConnection.getConnection();

        try {

            PreparedStatement ps =
                    con.prepareStatement(update);

            ps.setInt(
                    1,
                    ordertable.getUserid()
            );

            ps.setInt(
                    2,
                    ordertable.getRestuarantid()
            );

            ps.setTimestamp(
                    3,
                    ordertable.getOrderdate()
            );

            ps.setBigDecimal(
                    4,
                    ordertable.getTotalamount()
            );

            ps.setString(
                    5,
                    ordertable.getStatus()
            );

            ps.setString(
                    6,
                    ordertable.getPaymentmethod()
            );

            ps.setInt(
                    7,
                    ordertable.getOrderid()
            );

            int rows =
                    ps.executeUpdate();

            System.out.println(
                    rows + " order row(s) updated"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }


    // =========================================================
    // DELETE ORDER
    // =========================================================

    @Override
    public void deleteOrder(int orderid) {

        Connection con =
                DBConnection.getConnection();

        try {

            PreparedStatement ps =
                    con.prepareStatement(delete);

            ps.setInt(1, orderid);

            int rows =
                    ps.executeUpdate();

            System.out.println(
                    rows + " order row(s) deleted"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }


    // =========================================================
    // GET ALL ORDERS
    // =========================================================

    @Override
    public List<Ordertable> getAllOrders() {

        Connection con =
                DBConnection.getConnection();

        List<Ordertable> list =
                new ArrayList<>();

        try {

            Statement st =
                    con.createStatement();

            ResultSet rs =
                    st.executeQuery(getAll);

            while (rs.next()) {

                Ordertable order =
                        resultSetFormat(rs);

                list.add(order);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
    @Override
    public Ordertable getOrderById(int orderId) {

        Ordertable order = null;

        String sql =
            "SELECT orderid, userid, restuarantid, totalamount, "
          + "status, paymentmethod, orderdate "
          + "FROM ordertable WHERE orderid = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                order = new Ordertable();

                order.setOrderid(
                    rs.getInt("orderid")
                );

                order.setUserid(
                    rs.getInt("userid")
                );

                order.setRestuarantid(
                    rs.getInt("restuarantid")
                );

                order.setTotalamount(
                    rs.getBigDecimal("totalamount")
                );

                order.setStatus(
                    rs.getString("status")
                );

                order.setPaymentmethod(
                    rs.getString("paymentmethod")
                );

                order.setOrderdate(
                    rs.getTimestamp("orderdate")
                );
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return order;
    }

    // =========================================================
    // RESULTSET → ORDERTABLE
    // =========================================================

    public static Ordertable resultSetFormat(
            ResultSet rs) throws SQLException {

        int orderid =
                rs.getInt("orderid");

        int userid =
                rs.getInt("userid");

        int restuarantid =
                rs.getInt("restuarantid");

        Timestamp orderdate =
                rs.getTimestamp("orderdate");

        BigDecimal totalamount =
                rs.getBigDecimal("totalamount");

        String status =
                rs.getString("status");

        String paymentmethod =
                rs.getString("paymentmethod");

        Ordertable order =
                new Ordertable(
                        orderid,
                        userid,
                        restuarantid,
                        orderdate,
                        totalamount,
                        status,
                        paymentmethod
                );

        return order;
    }
}