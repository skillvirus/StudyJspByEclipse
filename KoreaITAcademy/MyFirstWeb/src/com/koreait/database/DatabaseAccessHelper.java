package com.koreait.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DatabaseAccessHelper {
	
	//private String connectionString = "jdbc:sqlite:C:/Users/MainUser/UserDevelopProjects/StudyJspByEclipse/KoreaITAcademy/MyFirstWeb/WebContent/Resources/Database/BookManagement.db"; //절대경로(정적)
	private String classPath = this.getClass().getResource("").getPath();
	private String dbPath = classPath.substring(1,classPath.indexOf(".metadata"))+"MyFirstWeb/WebContent/Resources/Database/BookManagement.db"; //절대경로(동적)
	private String connectionString = "jdbc:sqlite:" + dbPath;
    
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	/*
	 * 생성자
	 */
	public DatabaseAccessHelper() {
		
		try {
			if (connection == null) {
				connection = this.createConnection(connectionString);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 데이터 베이스 연결
	 */
	private Connection createConnection(String connectionString) {
		
		try {
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(connectionString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	/*
	 * 데이터 베이스 연결 종료
	 */
	public void close() {
		if (connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/*
	 * 쿼리 실행(SELECT)
	 * @param commandText Query String
	 * @param params Query String WHERE 절 조회용 조건
	 * @return ResultSet 쿼리 실행 결과 집합
	 */
	public ResultSet executeQuery(String commandText, ArrayList<DataPack> parameters) {
		try {
			preparedStatement = connection.prepareStatement(commandText);
			
			for (int loopCount = 0; loopCount < parameters.size(); loopCount++) {
				preparedStatement.setString(Integer.valueOf(parameters.get(loopCount).getCode().toString()), parameters.get(loopCount).getValue().toString());	
			}

			resultSet = preparedStatement.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
	
	/*
	 * 쿼리 실행(SELECT)
	 * @param commandText : Query String
	 * @return ResultSet 쿼리 실행 결과 집합
	 */
	public ResultSet executeQuery(String commandText) {
		
		try {
			preparedStatement = connection.prepareStatement(commandText);

			resultSet = preparedStatement.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
	
	/*
	 * 쿼리 실행(INSERT, UPDATE)
	 * @param commandText Query String
	 * @param params Query String WHERE 절 조회용 조건
	 * @return void
	 */
	public void executeNonQuery(String commandText, ArrayList<DataPack> parameters) {
		try {
			preparedStatement = connection.prepareStatement(commandText);
			
			for (int loopCount = 0; loopCount < parameters.size(); loopCount++) {
				preparedStatement.setString(Integer.valueOf(parameters.get(loopCount).getCode().toString()), parameters.get(loopCount).getValue().toString());	
			}

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}