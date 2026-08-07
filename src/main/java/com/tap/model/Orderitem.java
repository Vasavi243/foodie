package com.tap.model;

import java.math.BigDecimal;

public class Orderitem {

    private int orderitem;
    private int orderid;
    private int menuid;
    private int quantity;
    private BigDecimal itemtotal;


    // Default constructor
    public Orderitem() {
        super();
    }


    // Parameterized constructor
    public Orderitem(
            int orderitem,
            int orderid,
            int menuid,
            int quantity,
            BigDecimal itemtotal) {

        super();

        this.orderitem = orderitem;
        this.orderid = orderid;
        this.menuid = menuid;
        this.quantity = quantity;
        this.itemtotal = itemtotal;
    }


    public int getOrderitem() {
        return orderitem;
    }

    public void setOrderitem(int orderitem) {
        this.orderitem = orderitem;
    }


    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }


    public int getMenuid() {
        return menuid;
    }

    public void setMenuid(int menuid) {
        this.menuid = menuid;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public BigDecimal getItemtotal() {
        return itemtotal;
    }

    public void setItemtotal(BigDecimal itemtotal) {
        this.itemtotal = itemtotal;
    }


    @Override
    public String toString() {

        return "Orderitem [orderitem="
                + orderitem
                + ", orderid="
                + orderid
                + ", menuid="
                + menuid
                + ", quantity="
                + quantity
                + ", itemtotal="
                + itemtotal
                + "]";
    }
}