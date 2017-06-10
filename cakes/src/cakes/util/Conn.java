package cakes.util;
import java.sql.*;

public class Conn {
	Connection con;
	String driver = "com.mysql.jdbc.Driver"; //数据库驱动
	//连接数据库的URL地址，为固定写法ַ
	String url="jdbc:mysql://localhost:3306/cake?useUnicode=true&characterEncoding=UTF-8"; 
	String username="root";//用户名
	String password="552396";//密码
	public Connection getConn(){
		try
		{
			Class.forName(driver);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	    try{ 
	    	con = DriverManager.getConnection(url, username, password);
	    } catch(SQLException e) {  }
		return con;
	}
}
