CREATE TABLE Member(
	member_id   VARCHAR2(30)	 PRIMARY KEY,
	member_type	VARCHAR2(20),
	name	    VARCHAR2(30),
	password	VARCHAR2(30),
	email	    VARCHAR2(50),
	tel	        VARCHAR2(30)
);

CREATE TABLE Categories(
	category_id	NUMBER       PRIMARY KEY,
	name	    VARCHAR2(30)
);

CREATE TABLE ScoreGrade(
	score_id	NUMBER        PRIMARY KEY,
    score       VARCHAR2(10)
);

CREATE TABLE Goods(
	goods_id	NUMBER	      PRIMARY KEY,
	name	    VARCHAR2(100),
	description	VARCHAR2(100),
	price	    NUMBER,
	hashtag  	VARCHAR2(100),
	view_cnt	NUMBER,
	image	    VARCHAR2(300),
	goods_state	VARCHAR2(20),
	req_type	VARCHAR2(20),
	req_date	DATE           DEFAULT SYSDATE,
	resp_date	DATE           DEFAULT SYSDATE,
	category_id	NUMBER	       REFERENCES Categories(category_id),
	member_id	VARCHAR2(30)   REFERENCES Member(member_id),
	score_id	NUMBER	       REFERENCES ScoreGrade(score_id)
);

CREATE TABLE QnA(
	qna_id	    NUMBER          PRIMARY KEY,
	title	    VARCHAR2(100),
	content	    VARCHAR2(1000),
	qna_date	DATE            DEFAULT SYSDATE,
	member_id	VARCHAR2(30)    REFERENCES Member(member_id)
);

CREATE TABLE Cart(
	cart_id	    NUMBER       PRIMARY KEY,
	goods_id	NUMBER       REFERENCES Goods(goods_id),
	member_id	VARCHAR2(30) REFERENCES Member(member_id)
);

CREATE TABLE Review(
	review_id	NUMBER         PRIMARY KEY,
	title	    VARCHAR2(50),
	content	    VARCHAR2(300),
	create_date	DATE           DEFAULT SYSDATE,
	member_id	VARCHAR2(30)   REFERENCES Member(member_id),
	goods_id	NUMBER	       REFERENCES Goods(goods_id),
	score_id	NUMBER	       REFERENCES ScoreGrade(score_id)
);

CREATE TABLE wish_list(
	wish_goods_id	NUMBER            PRIMARY KEY,
	member_id	    VARCHAR2(30)      REFERENCES Member(member_id),
	goods_id	    NUMBER	          REFERENCES Goods(goods_id)
);
       
CREATE SEQUENCE category_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE score_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE qna_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE cart_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE review_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;
       
CREATE SEQUENCE wish_goods_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;       
       
COMMIT;       