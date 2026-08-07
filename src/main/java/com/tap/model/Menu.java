package com.tap.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Menu {

    private int menuid;
    private int restuarantid;
    private String itemname;
    private String description;
    private BigDecimal price;
    private int isavaliable;
    private String category;
    private Timestamp createdat;
    private Timestamp updatedat;
    private Timestamp deletedat;
    private String imagepath;

    // Default Constructor
    public Menu() {
        super();
    }

    // Constructor with all fields
    public Menu(int menuid, int restuarantid, String itemname, String description, BigDecimal price,
            int isavaliable, String category, Timestamp createdat, Timestamp updatedat,
            Timestamp deletedat, String imagepath) {

        this.menuid = menuid;
        this.restuarantid = restuarantid;
        this.itemname = itemname;
        this.description = description;
        this.price = price;
        this.isavaliable = isavaliable;
        this.category = category;
        this.createdat = createdat;
        this.updatedat = updatedat;
        this.deletedat = deletedat;
        this.imagepath = imagepath;
    }

    // Constructor used while inserting data
    public Menu(int restuarantid, String itemname, String description,
            BigDecimal price, int isavaliable, String category,
            String imagepath) {

        this.restuarantid = restuarantid;
        this.itemname = itemname;
        this.description = description;
        this.price = price;
        this.isavaliable = isavaliable;
        this.category = category;
        this.imagepath = imagepath;
    }

    // Getters and Setters

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

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getIsavaliable() {
        return isavaliable;
    }

    public void setIsavaliable(int isavaliable) {
        this.isavaliable = isavaliable;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Timestamp getCreatedat() {
        return createdat;
    }

    public void setCreatedat(Timestamp createdat) {
        this.createdat = createdat;
    }

    public Timestamp getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(Timestamp updatedat) {
        this.updatedat = updatedat;
    }

    public Timestamp getDeletedat() {
        return deletedat;
    }

    public void setDeletedat(Timestamp deletedat) {
        this.deletedat = deletedat;
    }

    // Getter and Setter for imagepath

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    @Override
    public String toString() {
        return "Menu [menuid=" + menuid
                + ", restuarantid=" + restuarantid
                + ", itemname=" + itemname
                + ", description=" + description
                + ", price=" + price
                + ", isavaliable=" + isavaliable
                + ", category=" + category
                + ", createdat=" + createdat
                + ", updatedat=" + updatedat
                + ", deletedat=" + deletedat
                + ", imagepath=" + imagepath
                + "]";
    }
}