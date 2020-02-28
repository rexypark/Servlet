package com.bs.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MyBatis 사용해서 작업할 SqlSession 을 만들어 줄
//SqlSessionFactory 객체 생성하기 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	//static 초기화문
	static {
		try {
			/* **********************
			//config.xml에서 정보를 읽어 SqlSessionFactory 타입 객체 생성
			//1. MyBatis 설정파일(configuration) 위치
			String config = "com/study/mybatis/config.xml";
			
			//2. config 파일을 읽을 수 있는 reader 객체 생성
			Reader reader = Resources.getResourceAsReader(config);
			
			//3. SqlSessionFactory 생성할 수 있는 객체(Builder) 생성
			SqlSessionFactoryBuilder factoryBuilder
					= new SqlSessionFactoryBuilder();
			
			//4. Builder를 사용해서 SqlSessionFactory 타입 객체 생성
			factory = factoryBuilder.build(reader);
			*************************************/
			
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bs/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}

















