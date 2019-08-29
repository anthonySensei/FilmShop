package mypackage;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TimeZone;

public class DB {

	Connection connection;
    public Statement statement;
    
    public DB() {
    	//connect to database
    	try {
            Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
             
             connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/filmshop?serverTimezone="
					+ TimeZone.getDefault().getID(), "euser","123");
             
             statement = connection.createStatement();
             
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }
	
}
