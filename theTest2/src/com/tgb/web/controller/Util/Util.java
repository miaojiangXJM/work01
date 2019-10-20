package com.tgb.web.controller.Util;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSetMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;

public class Util {
	private static Connection conn;
	private static ApplicationContext ctx;
	private static DataSource dataSource;

	public synchronized static Connection getUtil() {
	    ctx = new ClassPathXmlApplicationContext("classpath*:/config/springAnnoatation-hibernate.xml");
		dataSource = (DataSource) ctx.getBean("dataSource");
	    conn = null;
		try {
			conn = (Connection) dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public synchronized static List<?> executeSqlQuery(String sql) {
		ctx = new ClassPathXmlApplicationContext("classpath*:/config/springAnnoatation-hibernate.xml");
		dataSource = (DataSource) ctx.getBean("dataSource");
		List <Object>list = new ArrayList<Object>();
		try {
			conn = (Connection) dataSource.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData meta = (ResultSetMetaData) rs.getMetaData();
				int cols = meta.getColumnCount();
				Object[] obj = new Object[cols];
				for (int i = 0; i < cols; i++) {
				    obj[i] = rs.getObject(i + 1);
				}
				list.add(obj);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
