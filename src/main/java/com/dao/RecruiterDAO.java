package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Recruiter;

public class RecruiterDAO {
	private Connection conn;

	public RecruiterDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addRecruiter(Recruiter r)
	{
		boolean f=false;
		
		try {
			String query="insert into recruiter(companyName,recruiterName,email,password,mobile,role,status) values(?,?,?,?,?,?,?);";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,r.getCompanyName());
			ps.setString(2, r.getRecruiterName());
			ps.setString(3, r.getEmail());
			ps.setString(4,r.getPassword());
			ps.setString(5, r.getMobile());	
			ps.setString(6, "Recruiter");
			ps.setString(7, "Inactive");
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
	
	
	public List<Recruiter> getAllRecruiter()
	{
		List<Recruiter> list=new ArrayList<Recruiter>();
		Recruiter s;
		try {
			
			String q="Select * from recruiter";
			PreparedStatement ps=conn.prepareStatement(q);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s=new Recruiter();
				s.setId(rs.getInt(1));
				s.setCompanyName(rs.getString(2));
				s.setRecruiterName(rs.getString(3));
				s.setEmail(rs.getString(4));
				s.setPassword(rs.getString(5));
				s.setMobile(rs.getString(6));
				s.setRole(rs.getString(7));
				s.setStatus(rs.getString(8));
				
				list.add(s);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean UpdateRecruiterById(int id,String status)
	{
		boolean f=false;
		
		try {
			String query="update recruiter set status=? where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,status);
			ps.setInt(2,id);
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Recruiter login1(String em,String pwd)
	{
		Recruiter s=null;
		try {
			String sql="select * from recruiter where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pwd);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s=new Recruiter();
				s.setId(rs.getInt(1));
				s.setCompanyName(rs.getString(2));
				s.setRecruiterName(rs.getString(3));
				s.setEmail(rs.getString(4));
				s.setPassword(rs.getString(5));
				s.setMobile(rs.getString(6));
				s.setRole(rs.getString(7));
				s.setStatus(rs.getString(8));
				
			}
		} catch (Exception e) {
			s=null;
		}
		
		return s;
	}
	
}
