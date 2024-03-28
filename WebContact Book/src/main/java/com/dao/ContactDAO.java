package com.dao;

import java.util.ArrayList;
import com.entity.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class ContactDAO
{
	private Connection conn;

	public ContactDAO(Connection conn)
	{
		super();
		this.conn = conn;
	};
	
	public boolean saveContact(Contact c)
	{
		boolean f=false;
		try
		{
			String sql="INSERT INTO info(name,email,phone,about,userid) VALUES(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,c.getName());
			ps.setString(2,c.getEmail());
			ps.setString(3,c.getPhone());
			ps.setString(4,c.getAbout());
			ps.setInt(5,c.getUserID());
			int i=ps.executeUpdate();
			if (i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Contact> getAllContact(int uId)
	{
		List<Contact> list=new ArrayList<Contact>();
		Contact c=null;
		try
		{
			String sql="SELECT * FROM info WHERE userid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,uId);
			
			ResultSet rs=ps.executeQuery();
			while (rs.next())
			{
				c=new Contact();
				c.setID(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhone(rs.getString(4));
				c.setAbout(rs.getString(5));
				
				list.add(c);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public Contact getContactByID(int cid)
	{
		Contact c=new Contact();
		try
		{
			PreparedStatement ps=conn.prepareStatement("SELECT * FROM info WHERE id=?");
			ps.setInt(1,cid);
			
			ResultSet rs=ps.executeQuery();
			while (rs.next())
			{
				c.setID(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhone(rs.getString(4));
				c.setAbout(rs.getString(5));
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return c;
	}
	
	public boolean updateContact(Contact c)
	{
		boolean f=false;
		try
		{
			String sql="UPDATE info SET name=?,email=?,phone=?,about=? WHERE id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,c.getName());
			ps.setString(2,c.getEmail());
			ps.setString(3,c.getPhone());
			ps.setString(4,c.getAbout());
			ps.setInt(5,c.getID());
			
			int i=ps.executeUpdate();
			if (i==1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteContactById(int id)
	{
		boolean f=false;
		try
		{
			String sql="DELETE FROM info WHERE id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if (i==1)
			{
				f=true;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
}