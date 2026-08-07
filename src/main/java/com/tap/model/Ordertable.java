package com.tap.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Ordertable {

    private int orderid;
    private int userid;
    private int restuarantid;
    private Timestamp orderdate;
    private BigDecimal totalamount;
    private String status;
    private String paymentmethod;

    // Default constructor
    public Ordertable() {
        super();
    }

    // Parameterized constructor
    public Ordertable(int orderid,
                      int userid,
                      int restuarantid,
                      Timestamp orderdate,
                      BigDecimal totalamount,
                      String status,
                      String paymentmethod) {

        this.orderid = orderid;
        this.userid = userid;
        this.restuarantid = restuarantid;
        this.orderdate = orderdate;
        this.totalamount = totalamount;
        this.status = status;
        this.paymentmethod = paymentmethod;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getRestuarantid() {
        return restuarantid;
    }

    public void setRestuarantid(int restuarantid) {
        this.restuarantid = restuarantid;
    }

    public Timestamp getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Timestamp orderdate) {
        this.orderdate = orderdate;
    }

    public BigDecimal getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(BigDecimal totalamount) {
        this.totalamount = totalamount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    @Override
    public String toString() {

        return "Ordertable [orderid=" + orderid
                + ", userid=" + userid
                + ", restuarantid=" + restuarantid
                + ", orderdate=" + orderdate
                + ", totalamount=" + totalamount
                + ", status=" + status
                + ", paymentmethod=" + paymentmethod + "]";
    }
}