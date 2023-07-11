package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Entity.User;

public class UserDAO {
	
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User r)
	{
		boolean f=false;
		
		try {
			String query="insert into user(name,email,password,qualification,role,mobile) values(?,?,?,?,?,?);";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,r.getName());
			ps.setString(2, r.getEmail());
			ps.setString(3, r.getPassword());
			ps.setString(4,r.getQualification());
			ps.setString(5, "User");
			ps.setString(6, r.getMobile());	
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em,String pwd)
	{
		User r=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pwd);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				r=new User();
				r.setId(rs.getInt(1));
				r.setName(rs.getString(2));
				r.setEmail(rs.getString(3));
				r.setPassword(rs.getString(4));
				r.setQualification(rs.getString(5));
				r.setRole(rs.getString(6));
				r.setMobile(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}
	
	public boolean editUserProfile(User j)
	{
		boolean f=false;
		
		try {
			String query="update user set name=?,qualification=?,password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,j.getName());
			ps.setString(2, j.getQualification());
			ps.setString(3, j.getPassword());
			ps.setInt(4, j.getId());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
