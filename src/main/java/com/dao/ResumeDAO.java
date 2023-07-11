package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Resume;

public class ResumeDAO {
	private Connection conn;

	public ResumeDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean addResume(Resume r) {
		boolean f = false;
		try {
			String query = "insert into fileupload(userResume,userName,userMobile,recruiterCompany) values(?,?,?,?);";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, r.getUserResume());
			ps.setString(2, r.getUserName());
			ps.setString(3, r.getUserMobile());
			ps.setString(4, r.getRecruiterCompany());

			int i = ps.executeUpdate();

			if (i == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Resume> getCandidatesByCompany(String Company)
	{
		Resume j=null;
		List<Resume> list=new ArrayList<Resume>();
		try {
			String sql="Select * from fileupload where recruiterCompany=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Company);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Resume();
				j.setId(rs.getInt(1));
				j.setUserResume(rs.getString(2));
				j.setUserName(rs.getString(3));
				j.setUserMobile(rs.getString(4));
				j.setRecruiterCompany(rs.getString(5));
				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
