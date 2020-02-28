package com.study.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MyBatis 사용해서 작업할 SqlSession을 만들어 줄
//SqlSessionFactory 객체 생성하기 위한 클래스
public class DBService {
	//인터페이스
	private static SqlSessionFactory factory;
	//static 초기화문
	//클래스가 실행되면 자동으로 실행 되도록 하는 작업
	static {

		try {
			//config.xml에서 정보를 읽어 SqlSessionFactory 타입 객체생성
			
			/*
			//1. MyBatis 설정파일(configuration) 위치
			String config = "com/study/mybatis/config.xml";
			
			//2. config 파일을 읽을 수 있는 reader 객체 생성
			Reader reader = Resources.getResourceAsReader(config);
			
			//3. SqlSessionFactory 생성할 수 있는 객체(Builder)
			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder();
			
			//4. Builder를 사용해서 SqlSessionFactory 타입 객체 생성
			factory = factoryBuilder.build(reader);
			*/
			
			//SqlSessionFactory객체 생성(config.xml에 저장된 jdbc정보를 가지고 공장생성)
			factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("com/study/mybatis/config.xml"));
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
}
