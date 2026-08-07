package com.tap.DAO;
import java.util.List;

import com.tap.model.Menu;
public interface MenuDAO {

    void addMenu(Menu menu);

    Menu getMenu(int menuid);

    void updateMenu(Menu menu);

    void deleteMenu(int menuid);

    List<Menu> getAllMenu();

    
    
    List<Menu> getMenuByRestaurantId(int restaurantId);

    int getMenuCount(int restaurantId);
    
    List<Menu> searchMenu(String keyword, int restaurantId);
    
    
}