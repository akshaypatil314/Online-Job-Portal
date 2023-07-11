package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Jobs;

public class JobDAO {
	
	private Connection conn;

	public JobDAO(Connection conn) {
		this.conn = conn;
	}
	
	public boolean addJob(Jobs j)
	{
		boolean f=false;
		
		try {
			String query="insert into jobs(title,description,category,status,location,company) values(?,?,?,?,?,?);";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4,j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setString(6,j.getCompany());
			
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
	
	public List<Jobs> getAllJobs()
	{
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		
		try {
			String query="Select * from jobs order by id desc";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				j.setCompany(rs.getString(8));
				list.add(j);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public List<Jobs> getAllJobsActive()
	{
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		
		try {
			String query="Select * from jobs where status=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				j.setCompany(rs.getString(8));
				list.add(j);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Jobs getJobById(int id)
	{
		Jobs j=null;
		try {
			String sql="Select * from jobs where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				j.setCompany(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return j;
	}
	
	public boolean updateJob(Jobs j)
	{
		boolean f=false;
		
		try {
			String query="update jobs set title=?,description=?,category=?,status=?,location=? where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4,j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());
			
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
	
	public boolean deleteJobById(int id)
	{
		boolean f=false;
		try {
			String sql="delete from jobs where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
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
	
	
	public List<Jobs> getJobByLocORCat(String loc,String cat)
	{
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="Select * from jobs where location=? or category=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, loc);
			ps.setString(2, cat);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				j.setCompany(rs.getString(8));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Jobs> getJobByLocANDCat(String loc,String cat)
	{
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="Select * from jobs where location=? and category=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, loc);
			ps.setString(2, cat);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				j.setCompany(rs.getString(8));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Jobs> getJobByCompany(String Company)
	{
		Jobs j=null;
		List<Jobs> list=new ArrayList<Jobs>();
		try {
			String sql="Select * from jobs where company=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Company);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				j.setCompany(rs.getString(8));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

}
