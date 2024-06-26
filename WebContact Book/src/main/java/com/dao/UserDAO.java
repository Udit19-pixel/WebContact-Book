package com.dao;

import com.entity.*;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO
{
    private Connection conn;

    public UserDAO(Connection conn)
    {
        super();
        this.conn = conn;
    }

    public boolean userRegister(User u)
    {
        boolean f = false;
        try
        {
            String hashedPassword = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
            String sql = "INSERT INTO contact(Name,Email,Password) VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, hashedPassword);

            int i = ps.executeUpdate();
            if (i == 1)
            {
                f = true;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public User loginUser(String E, String P)
    {
        User user = null;
        try
        {
            String sql = "SELECT * FROM contact WHERE Email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, E);

            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                String storedHashedPassword = rs.getString("Password");
                if (BCrypt.checkpw(P, storedHashedPassword))
                {
                    user = new User();
                    user.setID(rs.getInt(1));
                    user.setName(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    user.setPassword(storedHashedPassword);
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
