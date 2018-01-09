package tripDataB;

import java.sql.*;
import java.util.ArrayList;

public class tripinfodatabase {
	
	private static final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private static final String JDBC_URL="jdbc:mysql://localhost:3306/proj";
	private static final String USER="root";
	private static final String PASSWD="1234";
	
	private Connection con =null;
	private Statement stmt =null;
	
	public tripinfodatabase() {
		try {
			Class.forName(JDBC_DRIVER);
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	}
	
	public void connect() {
		try {
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if(stmt != null) {
			try {
				stmt.close();
			}catch (SQLException e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
		if(con!=null)
		{
			try {
				con.close();
			}catch (SQLException e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
	}
	
	public ArrayList<tripinfoEntity> getcontryinfoList(){
		connect();
		ArrayList<tripinfoEntity>list = new ArrayList<tripinfoEntity>();
		
		String SQL="select * from tripinfo";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				tripinfoEntity tripdata = new tripinfoEntity();
				
				tripdata.setImgadd(rs.getString("imgaddress"));
				tripdata.setTitle(rs.getString("title"));
				tripdata.setContext(rs.getString("context"));
				list.add(tripdata);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<tripinfoEntity> getcontryinfojejuList(){
		connect();
		ArrayList<tripinfoEntity>list = new ArrayList<tripinfoEntity>();
		
		String SQL="select * from tripinfojeju";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				tripinfoEntity tripdata = new tripinfoEntity();
				
				tripdata.setImgadd(rs.getString("imgaddress"));
				tripdata.setTitle(rs.getString("title"));
				tripdata.setContext(rs.getString("context"));
				list.add(tripdata);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<tripinfoEntity> getcontryinfolonList(){
		connect();
		ArrayList<tripinfoEntity>list = new ArrayList<tripinfoEntity>();
		
		String SQL="select * from tripinfolon";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				tripinfoEntity tripdata = new tripinfoEntity();
				
				tripdata.setImgadd(rs.getString("imgaddress"));
				tripdata.setTitle(rs.getString("title"));
				tripdata.setContext(rs.getString("context"));
				list.add(tripdata);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<tripinfoEntity> getcontryinfonewList(){
		connect();
		ArrayList<tripinfoEntity>list = new ArrayList<tripinfoEntity>();
		
		String SQL="select * from tripinfonew";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				tripinfoEntity tripdata = new tripinfoEntity();
				
				tripdata.setImgadd(rs.getString("imgaddress"));
				tripdata.setTitle(rs.getString("title"));
				tripdata.setContext(rs.getString("context"));
				list.add(tripdata);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			disconnect();
		}
		return list;
	}
	
	
	public ArrayList<tripinfoEntity> getcontryinfoparList(){
		connect();
		ArrayList<tripinfoEntity>list = new ArrayList<tripinfoEntity>();
		
		String SQL="select * from tripinfopar";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				tripinfoEntity tripdata = new tripinfoEntity();
				
				tripdata.setImgadd(rs.getString("imgaddress"));
				tripdata.setTitle(rs.getString("title"));
				tripdata.setContext(rs.getString("context"));
				list.add(tripdata);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<tripinfoEntity> getcontryinforomList(){
		connect();
		ArrayList<tripinfoEntity>list = new ArrayList<tripinfoEntity>();
		
		String SQL="select * from tripinforom";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				tripinfoEntity tripdata = new tripinfoEntity();
				
				tripdata.setImgadd(rs.getString("imgaddress"));
				tripdata.setTitle(rs.getString("title"));
				tripdata.setContext(rs.getString("context"));
				list.add(tripdata);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			disconnect();
		}
		return list;
	}
}
