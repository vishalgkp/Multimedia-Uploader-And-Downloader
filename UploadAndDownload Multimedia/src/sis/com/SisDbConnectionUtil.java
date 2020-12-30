package sis.com;

import java.sql.*;



public class SisDbConnectionUtil {
			
	private static final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER="system";
	private static final String PASSWORD="root";
	private static final String DRIVER_CLASS_NAME="oracle.jdbc.driver.OracleDriver";
	private static boolean isDriverLoaded=false;
	
	
	static{
		try{
			Class.forName(DRIVER_CLASS_NAME);
			isDriverLoaded=true;
			System.out.println("driver loading...");
			
		}
		catch(ClassNotFoundException e){
			
			System.out.println("Class Not Found "+e.getMessage());
		}
		
		
	}
	
	public static Connection getConnection()throws SQLException{
		
		Connection con=null;
		if(isDriverLoaded){
			
			con=DriverManager.getConnection(URL,USER,PASSWORD);
		}
	
		return con;
	}
	
	public static void closeConnection(Connection con)throws SQLException{
		
		if(con!=null)
		{
			con.close();
		}
	}
	
}
