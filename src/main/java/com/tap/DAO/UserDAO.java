package com.tap.DAO;

import java.util.List;
import com.tap.model.User;

public interface UserDAO {

    public int addUser(User user);

    public User getUser(int userid);

    public User getUserByEmail(String email);

    public User getUserByUsername(String username);

    public void updateUser(User user);

    public void deleteUser(int userid);

    public List<User> getAllUsers();
}