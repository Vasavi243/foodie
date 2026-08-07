package com.tap.model;

import java.math.BigDecimal;

public class Restuarant {

    private int restuarantid;
    private String name;
    private String cuisinetype;
    private int deliverytime;
    private String address;
    private int adminuserid;
    private BigDecimal rating;
    private int isactive;
    private String imagepath;

    // Default Constructor
    public Restuarant() {
        super();
    }

    // Constructor with all fields
    public Restuarant(int restuarantid, String name, String cuisinetype,
            int deliverytime, String address,
            int adminuserid, BigDecimal rating,
            int isactive, String imagepath) {

        this.restuarantid = restuarantid;
        this.name = name;
        this.cuisinetype = cuisinetype;
        this.deliverytime = deliverytime;
        this.address = address;
        this.adminuserid = adminuserid;
        this.rating = rating;
        this.isactive = isactive;
        this.imagepath = imagepath;
    }

    // Constructor used while inserting data
    public Restuarant(String name, String cuisinetype,
            int deliverytime, String address,
            int adminuserid, BigDecimal rating,
            int isactive, String imagepath) {

        this.name = name;
        this.cuisinetype = cuisinetype;
        this.deliverytime = deliverytime;
        this.address = address;
        this.adminuserid = adminuserid;
        this.rating = rating;
        this.isactive = isactive;
        this.imagepath = imagepath;
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

    public String getCuisinetype() {
        return cuisinetype;
    }

    public void setCuisinetype(String cuisinetype) {
        this.cuisinetype = cuisinetype;
    }

    public int getDeliverytime() {
        return deliverytime;
    }

    public void setDeliverytime(int deliverytime) {
        this.deliverytime = deliverytime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAdminuserid() {
        return adminuserid;
    }

    public void setAdminuserid(int adminuserid) {
        this.adminuserid = adminuserid;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public int getIsactive() {
        return isactive;
    }

    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    @Override
    public String toString() {
        return "Restuarant [restuarantid=" + restuarantid
                + ", name=" + name
                + ", cuisinetype=" + cuisinetype
                + ", deliverytime=" + deliverytime
                + ", address=" + address
                + ", adminuserid=" + adminuserid
                + ", rating=" + rating
                + ", isactive=" + isactive
                + ", imagepath=" + imagepath
                + "]";
    }
}