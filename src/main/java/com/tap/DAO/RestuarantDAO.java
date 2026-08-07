package com.tap.DAO;

import java.util.List;
import com.tap.model.Restuarant;

public interface RestuarantDAO {


    public void addRestuarant(Restuarant restuarant);


    public Restuarant getRestuarant(int restuarantid);


    public boolean updateRestuarant(Restuarant restuarant);


    public void deleteRestuarant(int restuarantid);


    public List<Restuarant> getAllRestuarants();


    public List<Restuarant> getRestaurantByCategory(String category);


    public List<Restuarant> searchRestaurant(String search);


    public Restuarant getRestaurantByAdminUserId(int adminUserId);


}