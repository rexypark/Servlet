/*
CREATE SEQUENCE board_seq
	increment by 1
	start with 1
	nomaxvalue
	nocycle
	cache 10;

CREATE SEQUENCE board_group
	increment by 1
	start with 1
	nomaxvalue
	nocycle
	cache 10;
*/

CREATE SEQUENCE board_seq NOCACHE;
CREATE SEQUENCE board_group NOCACHE;

CREATE TABLE board(
	seq NUMBER,                   --일련번호(시퀀스 BOARD_SEQ 사용)
	writer VARCHAR2(10) NOT NULL, --작성자
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB,                 --내용
	pwd VARCHAR2(20) NOT NULL,    --암호
	hit NUMBER NOT NULL,          --조회수
	groups NUMBER NOT NULL,       --그룹번호(시퀀스 BOARD_GROUP 사용 - 게시글번호 : 0, 1, 2...)
	step NUMBER NOT NULL,         --글의 위치(0:게시글, 1:댓글, 2:댓글>댓글, 3:댓글>댓글>댓글...)
	lev NUMBER NOT NULL,          --순번(게시글 기준 목록에 보여질 순서)
	bname VARCHAR2(10) NOT NULL,  --게시판종류
	regdate date NOT NULL,        --등록일시
	filename VARCHAR2(50),        --파일명
	ip VARCHAR2(15),              --접속IP
	CONSTRAINT board_pk PRIMARY KEY (seq)
);

INSERT INTO board 
       (seq, writer, title, pwd, hit,
       groups, step, lev, bname, regdate, ip)
VALUES (0, 'study', 'study연습입니다.', '1111', 0, 
       0, 0, 0, 'BBS', sysdate, '127.0.0.1');

commit;

-------------------------------------------------------
COMMENT ON TABLE BOARD IS '게시판';
COMMENT ON COLUMN BOARD.SEQ IS '시퀀스번호';
COMMENT ON COLUMN BOARD.WRITER IS '작성자명';
COMMENT ON COLUMN BOARD.TITLE IS '제목';
COMMENT ON COLUMN BOARD.CONTENT IS '내용';
COMMENT ON COLUMN BOARD.PWD IS '암호';
COMMENT ON COLUMN BOARD.HIT IS '조회수';
COMMENT ON COLUMN BOARD.GROUPS IS '그룹(글 묶음 분류용)';
COMMENT ON COLUMN BOARD.STEP IS '단계(게시글:0, 댓글단계별: 1,2,3...)';
COMMENT ON COLUMN BOARD.LEV IS '순번(게시글 기준 목록에 보여질 순서)';
COMMENT ON COLUMN BOARD.BNAME IS '게시판종류';
COMMENT ON COLUMN BOARD.REGDATE IS '등록일자';
COMMENT ON COLUMN BOARD.FILENAME IS '파일명';
COMMENT ON COLUMN BOARD.IP IS '접속자 IP';     

