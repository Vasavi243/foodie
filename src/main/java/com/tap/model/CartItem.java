package com.tap.model;

import java.math.BigDecimal;

public class CartItem {

    private int menuid;
    private int restuarantid;
    private String name;
    private BigDecimal price;
    private int qty;

    // Default Constructor
    public CartItem() {

    }

    // Parameterized Constructor
    public CartItem(int menuid,
                    int restuarantid,
                    String name,
                    BigDecimal price,
                    int qty) {

        this.menuid = menuid;
        this.restuarantid = restuarantid;
        this.name = name;
        this.price = price;
        this.qty = qty;
    }

    // ==========================
    // Getters and Setters
    // ==========================

    public int getMenuid() {
        return menuid;
    }

    public void setMenuid(int menuid) {
        this.menuid = menuid;
    }

    public int getRestuarantid() {
        return restuarantid;
    }

    public void setRestuarantid(int restuarantid) {
        this.restuarantid = restuarantid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    // ==========================
    // Total Price
    // ==========================

    public BigDecimal getTotalPrice() {

        return price.multiply(BigDecimal.valueOf(qty));

    }

    // ==========================
    // toString()
    // ==========================

    @Override
    public String toString() {

        return "CartItem [menuid=" + menuid +
                ", restuarantid=" + restuarantid +
                ", name=" + name +
                ", price=" + price +
                ", qty=" + qty +
                "]";

    }
}