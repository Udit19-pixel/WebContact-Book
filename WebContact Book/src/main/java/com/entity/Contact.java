package com.entity;

public class Contact
{
	private int ID;
	private String Name;
	private String Email;
	private String Phone;
	private String about;
	private int userID;
	
	public Contact(String name, String email, String phone, String about, int userID)
	{
		super();
		Name = name;
		Email = email;
		Phone = phone;
		this.about = about;
		this.userID = userID;
	}

	public Contact()
	{
		super();
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

	public String getPhone()
	{
		return Phone;
	}

	public void setPhone(String phone)
	{
		Phone = phone;
	}

	public String getAbout()
	{
		return about;
	}

	public void setAbout(String about)
	{
		this.about = about;
	}

	public int getUserID()
	{
		return userID;
	}

	public void setUserID(int userID)
	{
		this.userID = userID;
	}
}