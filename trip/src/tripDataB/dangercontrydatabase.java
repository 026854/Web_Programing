package tripDataB;

import java.sql.*;
import java.util.ArrayList;

public class dangercontrydatabase {
	
	private static final String JDBC_DRIVER="com.mysql.jdbc.Driver";
	private static final String JDBC_URL="jdbc:mysql://localhost:3306/proj";
	private static final String USER="root";
	private static final String PASSWD="1234";
	
	private Connection con =null;
	private Statement stmt =null;
	
	public dangercontrydatabase() {
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
	
	public ArrayList<dangerContryEntity> getcontryList(){
		connect();
		ArrayList<dangerContryEntity>list = new ArrayList<dangerContryEntity>();
		
		String SQL="select * from dangercontry";
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next())
			{
				dangerContryEntity contry = new dangerContryEntity();
				
				contry.setContryName(rs.getString("cname"));
				list.add(contry);
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
