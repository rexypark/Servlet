package com.bc.model.vo;

public class MemberVO {
	private String idx, name, age, addr, regdate;

	public MemberVO() {}
	
	
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", age=" + age + ", addr=" + addr + ", regdate=" + regdate
				+ "]";
	}



	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
