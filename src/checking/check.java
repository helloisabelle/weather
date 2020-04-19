package checking;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class check {
	
		
		public static int login(String username, String password){
			Connection conn = null;
			Statement st = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost/hw3?user=root&password=hellodear&useSSL=false");
				st = conn.createStatement();
				String name = username;
				ps = conn.prepareStatement("SELECT * FROM User WHERE username=?");
				ps.setString(1, name); // set first variable in prepared statement
				rs = ps.executeQuery();
				while (rs.next()) {
					String found_name = rs.getString("username");
					String found_pass = rs.getString("password");
					if (found_name != null && found_pass.equals(password)) {
						return 1; //pass
					}
					else if (found_name == null) {
						return 2; //no username match
					}
					else {
						return 3;
					}
				}
				return 2;
					
			} catch (SQLException sqle) {
				System.out.println ("SQLException: " + sqle.getMessage());
			} catch (ClassNotFoundException cnfe) {
				System.out.println ("ClassNotFoundException: " + cnfe.getMessage());
			} 
			finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (st != null) {
						st.close();
					}
					if (ps != null) {
						ps.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle: " + sqle.getMessage());
				}
			}
			
			return 2;
		}
	
	public static boolean validation(String username, String password){
		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/hw3?user=root&password=hellodear&useSSL=false");
			st = conn.createStatement();
			String name = username;
			ps = conn.prepareStatement("SELECT * FROM User WHERE username=?");
			ps.setString(1, name); // set first variable in prepared statement
			rs = ps.executeQuery();
			while (rs.next()) {
				String found_name = rs.getString("username");
				if (found_name != null) {
					return false;
				}
			}

				ps2 = conn.prepareStatement("INSERT INTO User (username, password) VALUES (?, ?)");
				ps2.setString(1, username);
				ps2.setString(2, password);
				ps2.executeUpdate();
			
			return true;
				
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println ("ClassNotFoundException: " + cnfe.getMessage());
		} 
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
		
		return false;
	}
	
public static void add(String search, String username_){
	 	Connection conn = null;
		PreparedStatement preparedStmt = null;
		
		try
	    {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/hw3?user=root&password=hellodear&useSSL=false");
			String myDriver = "com.mysql.cj.jdbc.Driver";
		      Class.forName(myDriver);
	      
	    //System.out.println(username_ + " " + search);
  
	      String query = "INSERT INTO SearchHistory (username, city) VALUES ((SELECT username FROM User where username = ?), ?)";
	      preparedStmt = conn.prepareStatement(query);
	      preparedStmt.setString (1, username_);
	      preparedStmt.setString (2, search);
	      preparedStmt.executeUpdate();
	   
	    
			} catch (SQLException sqle) {
				System.out.println ("SQLException: " + sqle.getMessage());
			} catch (ClassNotFoundException cnfe) {
				System.out.println ("ClassNotFoundException: " + cnfe.getMessage());
			} 

	    finally {
		     
		     try {

					if (preparedStmt != null) {
						preparedStmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle: " + sqle.getMessage());
				}
	    }
		
	}


	public static ArrayList<String> getSH(String username) {
		ArrayList<String> v = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try
	    {
	      // create our mysql database connection
			  String myDriver = "com.mysql.cj.jdbc.Driver";
			  Class.forName(myDriver);
		      conn = DriverManager.getConnection("jdbc:mysql://localhost/hw3?user=root&password=hellodear&useSSL=false");
	
		      ps = conn.prepareStatement("SELECT city FROM SearchHistory WHERE username = ?" );
			  ps.setString(1, username); // set first variable in prepared statement
	
			  rs = ps.executeQuery();
	
			      while(rs.next()) { 
			    	  String search = rs.getString("city");
			    	  v.add(search);
	
			      }
	
		} catch (SQLException sqle) {
			System.out.println ("hello");
			System.out.println ("SQLException: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println ("ClassNotFoundException: " + cnfe.getMessage());
		} 
		
		finally {
			 try {
					if (ps != null) {
						ps.close();
					}
					if (rs != null) {
						rs.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle: " + sqle.getMessage());
			 }
		}
		return v;
		

	}
}