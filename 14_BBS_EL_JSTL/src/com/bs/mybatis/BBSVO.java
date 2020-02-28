package com.bs.mybatis;

public class BBSVO {
	private String b_idx, subject, writer, content, file_name, ori_name, pwd, write_date, ip, hit;
	
	public BBSVO() {}

	public BBSVO(String b_idx, String subject, String writer, String content, String file_name, String ori_name,
			String pwd, String write_date, String ip, String hit) {
		super();
		this.b_idx = b_idx; 	      // 글번호 게시글 인덱스 (rowNum)
		this.subject = subject;       // 제목
		this.writer = writer;         // 글쓴이
		this.content = content;       // 게시글
		this.file_name = file_name;   // 파일 이름
		this.ori_name = ori_name;     // 원본파일이름
		this.pwd = pwd;               // 비밀번호
		this.write_date = write_date; // 작성 일자
		this.ip = ip;                 // ip번호
		this.hit = hit;               // 조회수
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "BBSVO [b_idx=" + b_idx + ", subject=" + subject + ", writer=" + writer + ", content=" + content
				+ ", file_name=" + file_name + ", ori_name=" + ori_name + ", pwd=" + pwd + ", write_date=" + write_date
				+ ", ip=" + ip + ", hit=" + hit + "]";
	}
	
	
	
}
