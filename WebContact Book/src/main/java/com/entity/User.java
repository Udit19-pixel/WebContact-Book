package com.entity;

public class User
{
	private int ID;
	private String Name;
	private String Email;
	private String Password;
	
	public User()
	{
		super();
	}
	public User(String name, String email, String password)
	{
		super();
		Name = name;
		Email = email;
		Password = password;
	}
	public int getID()
	{
		return ID;
	}
	public void setID(int iD)
	{
		ID = iD;
	}
	public String getName()
	{
		return Name;
	}
	public void setName(String name)
	{
		Name = name;
	}
	public String getEmail()
	{
		return Email;
	}
	public void setEmail(String email)
	{
		Email = email;
	}
	public String getPassword()
	{
		return Password;
	}
	public void setPassword(String password)
	{
		Password = password;
	}
	@Override
	public String toString()
	{
		return "User [ID=" + ID + ", Name=" + Name + ", Email=" + Email + ", Password=" + Password + "]";
	}
}