package com.tap.DAO.imp;
import com.tap.DAO.UserDAO;
import java.sql.ResultSet;
import com.tap.model.User;
import com.tap.utility.DBConnection;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.SQLException;

public class UserDAOimp implements UserDAO {
	private static String insert="insert into user(username,email,password,address,role,createddate,lastlogindate)values(?,?,?,?,?,?,?)";
    private static String get="select*from user where userid=?";
    private static String update="update user set  username=?,email=?,password=?,address=?, lastlogindate=? where userid=?";
    private static String delete="delete from user where userid=?";
    @Override
    public int  addUser(User user) {

        Connection con = DBConnection.getConnection();

        try {

            PreparedStatement pstmt = con.prepareStatement(insert);

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAddress());
            pstmt.setString(5, user.getRole());
            pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));

            int i = pstmt.executeUpdate();

            System.out.println(i + " rows affected");

            return i;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
@Override
public User getUser(int userid) {
	Connection con=DBConnection.getConnection();
	User user=null;
	try {
		PreparedStatement pt=con.prepareStatement(get);
		pt.setInt(1, userid);
		ResultSet res=pt.executeQuery();
		while(res.next()) {
			int id=res.getInt("userid");
			String name=res.getString("username");
			String email=res.getString("email");
			String password=res.getString("password");
			String address=res.getString("address");
			String role=res.getString("role");
			Timestamp createddate=res.getTimestamp("createddate");
			Timestamp lastlogindate=res.getTimestamp("lastlogindate");
			user=new User(id,name,email,password,address,role,createddate,lastlogindate);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}return user;
}
@Override
public void updateUser(User user) {
	Connection con=DBConnection.getConnection();
	try {
		PreparedStatement p=con.prepareStatement(update);
		p.setString(1,user.getUsername());
		p.setString(2, user.getEmail());
		p.setString(3, user.getPassword());
		p.setString(4, user.getAddress());
		p.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
		p.setInt(6, user.getUserid());
		int u=p.executeUpdate();
		System.out.print(u);
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}
public User getUserByEmail(String email) {

    User user = null;

    String sql = "SELECT * FROM user WHERE email=?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement pstmt = con.prepareStatement(sql);

        pstmt.setString(1, email);

        ResultSet rs = pstmt.executeQuery();

        if(rs.next()) {

            int id = rs.getInt("userid");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String address = rs.getString("address");
            String role = rs.getString("role");
            Timestamp createddate = rs.getTimestamp("createddate");
            Timestamp lastlogindate = rs.getTimestamp("lastlogindate");

            user = new User(
                    id,
                    username,
                    email,
                    password,
                    address,
                    role,
                    createddate,
                    lastlogindate
            );
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return user;
}
@Override
public void deleteUser(int userid) {
	Connection con=DBConnection.getConnection();
	try {
		PreparedStatement p=con.prepareStatement(delete);
		p.setInt(1, userid);
		int i=p.executeUpdate();
		System.out.print(i+"rows effected");
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}

@Override
public User getUserByUsername(String username) {

    User user = null;

    String sql = "SELECT * FROM user WHERE username=?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement pstmt =
                con.prepareStatement(sql);

        pstmt.setString(1, username);

        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {

            int id = rs.getInt("userid");

            String name =
                    rs.getString("username");

            String email =
                    rs.getString("email");

            String password =
                    rs.getString("password");

            String address =
                    rs.getString("address");

            String role =
                    rs.getString("role");

            Timestamp createddate =
                    rs.getTimestamp("createddate");

            Timestamp lastlogindate =
                    rs.getTimestamp("lastlogindate");

            user = new User(
                    id,
                    name,
                    email,
                    password,
                    address,
                    role,
                    createddate,
                    lastlogindate
            );
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return user;
}



@Override
public List<User>getAllUsers(){
	Connection con=DBConnection.getConnection();
	ArrayList<User> al=new ArrayList<User>();
	String query="select*from user";
	
	try {
		Statement st=con.createStatement();
		ResultSet i=st.executeQuery(query);
		while(i.next()) {
			User user=resultSetFormat(i);
			al.add(user);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
		
	}return al;
}
public static  User resultSetFormat (ResultSet i) throws SQLException{
	int id=i.getInt("userid");
	String name=i.getString("username");
	String email=i.getString("email");
	String password=i.getString("password");
	String address=i.getString("address");
	String role=i.getString("role");
	Timestamp createddate=i.getTimestamp("createddate");
	Timestamp lastlogindate=i.getTimestamp("lastlogindate");
	User user=new User(id,name,email,password,address,role,createddate,lastlogindate);
	return user;
}
}
