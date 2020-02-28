package com.mystudy;

import java.util.Arrays;

public class MemberVO {
	private String name;
	private String age;
	
	private String pwd;
	private String gender; //radio값 저정(값 하나)
	private String[] hobby;
	
	//useBean태그 사용을 위해 기본생성자 선언
	public MemberVO() {}

	
	
	public MemberVO(String name, String age, String pwd, String gender, String[] hobby) {
		super();
		this.name = name;
		this.age = age;
		this.pwd = pwd;
		this.gender = gender;
		this.hobby = hobby;
	}

	


	public MemberVO(String name, String age, String pwd, String gender) {
		super();
		this.name = name;
		this.age = age;
		this.pwd = pwd;
		this.gender = gender;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", age=" + age + ", pwd=" + pwd + ", gender=" + gender + ", hobby="
				+ Arrays.toString(hobby) + "]";
	}
	
}
