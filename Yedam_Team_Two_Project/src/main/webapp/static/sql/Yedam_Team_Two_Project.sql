--테이블 일괄 삭제문 출력
SELECT 'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
FROM   user_objects
WHERE  object_type = 'TABLE';

--테이블 일괄 삭제
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE MCATEGORIES CASCADE CONSTRAINTS;
DROP TABLE CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE SCOREGRADE CASCADE CONSTRAINTS;
DROP TABLE GOODS CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE WISH_LIST CASCADE CONSTRAINTS;
DROP TABLE MAGAZINE CASCADE CONSTRAINTS;
DROP TABLE PURCHASEHISTORY CASCADE CONSTRAINTS;
DROP TABLE PURCHASEDETAILS CASCADE CONSTRAINTS;

--시퀀스 일괄 삭제문 출력
SELECT 'DROP SEQUENCE ' || object_name || ' ;'
FROM user_objects
WHERE object_type = 'SEQUENCE';

--시퀀스 일괄 삭제
DROP SEQUENCE MEMBER_ID_SEQ ;
DROP SEQUENCE GOODS_ID_SEQ ;
DROP SEQUENCE MAGAZINE_ID_SEQ ;
DROP SEQUENCE QNA_ID_SEQ ;
DROP SEQUENCE WISH_GOODS_ID_SEQ ;
DROP SEQUENCE CART_ID_SEQ ;
DROP SEQUENCE REVIEW_ID_SEQ ;
DROP SEQUENCE PD_ID_SEQ ;

--테이블 생성
CREATE TABLE Member(
	member_id   VARCHAR2(30)	 PRIMARY KEY,
	member_type	VARCHAR2(20),
	name	    VARCHAR2(30),
	password	VARCHAR2(30),
	email	    VARCHAR2(50),
	tel	        VARCHAR2(30)
);

CREATE TABLE MCategories(
    mc_id     NUMBER  PRIMARY KEY,
    mc_name   VARCHAR(40)
);

CREATE TABLE Categories(
	category_id	NUMBER       PRIMARY KEY,
	name	    VARCHAR2(30)
);

CREATE TABLE ScoreGrade(
	score_id	NUMBER        PRIMARY KEY,
    score       NUMBER
);

CREATE TABLE Goods(
	goods_id	NUMBER	      CONSTRAINT PK_Goods PRIMARY KEY,
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
	cart_id	    VARCHAR(50)  PRIMARY KEY,
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

CREATE TABLE Magazine (
    magazine_id NUMBER        CONSTRAINT PK_Magazine PRIMARY KEY,
    title       VARCHAR(100),
    content     VARCHAR(1000),
    thumbnail   VARCHAR(300),
    image       VARCHAR(300),
    create_date DATE          DEFAULT SYSDATE,
    member_id   VARCHAR(30)   REFERENCES Member(member_id),
    mc_id       NUMBER        REFERENCES MCategories(mc_id)
);

CREATE TABLE PurchaseHistory (
    p_id      VARCHAR(100)  PRIMARY KEY,
    p_date    DATE DEFAULT SYSDATE,
    price     NUMBER,
    member_id VARCHAR(30)  REFERENCES Member(member_id)
);

CREATE TABLE PurchaseDetails (
    pd_id    VARCHAR(100) PRIMARY KEY,
    p_id     VARCHAR(100) REFERENCES PurchaseHistory(p_id),
    goods_id NUMBER       REFERENCES Goods(goods_id)
);

--시퀀스 생성
CREATE SEQUENCE member_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;

CREATE SEQUENCE goods_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;

CREATE SEQUENCE magazine_id_seq
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
       
CREATE SEQUENCE wish_goods_id_seq
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
       
CREATE SEQUENCE pd_id_seq
       INCREMENT BY 1
       START WITH   0
       MINVALUE     0
       MAXVALUE     99999
       NOCYCLE
       NOCACHE
       NOORDER;           
--더미값 넣기(100개 씩)
BEGIN
      FOR i IN 1..30
      LOOP
      INSERT INTO Categories(category_id,
                             name)
      VALUES                (i,
                             '카테고리' || i);
      END LOOP;
      COMMIT;
END;
/
INSERT INTO ScoreGrade(score_id,
                       score)
VALUES                (1,
                       20);
INSERT INTO ScoreGrade(score_id,
                       score)
VALUES                (2,
                       40);
INSERT INTO ScoreGrade(score_id,
                       score)
VALUES                (3,
                       60);
INSERT INTO ScoreGrade(score_id,
                       score)
VALUES                (4,
                       80);
INSERT INTO ScoreGrade(score_id,
                       score)
VALUES                (5,
                       100);    

INSERT INTO MCategories(mc_id,
                        mc_name)
VALUES                 (0,
                        '꿀팁');
INSERT INTO MCategories(mc_id,
                        mc_name)
VALUES                 (1,
                        '트렌드');
INSERT INTO MCategories(mc_id,
                        mc_name)
VALUES                 (2,
                        '소식');
INSERT INTO MCategories(mc_id,
                        mc_name)
VALUES                 (3,
                        '이슈');
INSERT INTO MCategories(mc_id,
                        mc_name)
VALUES                 (4,
                        '기타');                       
COMMIT;

BEGIN
      FOR i IN 1..30
      LOOP
      INSERT INTO member (member_id,
                          member_type,
                          name,
                          password,
                          email,
                          tel)
       VALUES             ('userId' || i,
                           'CLIENT',
                           '고객' || i,
                           '비밀번호' || i,
                           '이메일' || i || '@email.com',
                           '010-1111-1111');        
      END LOOP;
      COMMIT;
END;
/
BEGIN
      FOR i IN 31..60
      LOOP
      INSERT INTO member (member_id,
                          member_type,
                          name,
                          password,
                          email,
                          tel)
       VALUES             ('sellerId' || i,
                           'SELLER',
                           '판매자' || i,
                           '비밀번호' || i,
                           '이메일' || i || '@email.com',
                           '010-1111-1111');        
      END LOOP;
      COMMIT;
END;
/
BEGIN
      FOR i IN 61..100
      LOOP
      INSERT INTO member (member_id,
                          member_type,
                          name,
                          password,
                          email,
                          tel)
       VALUES             ('managerId' || i,
                           'MANAGER',
                           '관리자' || i,
                           '비밀번호' || i,
                           '이메일' || i || '@email.com',
                           '010-1111-1111');        
      END LOOP;
      COMMIT;
END;
/
BEGIN
      FOR i IN 1..100
      LOOP
      INSERT INTO goods(goods_id,
                        name,
                        description,
                        price,
                        hashtag,
                        view_cnt,
                        image,
                        goods_state,
                        req_type,
                        req_date,
                        resp_date,
                        category_id,
                        member_id,
                        score_id)
VALUES                 (goods_id_seq.NEXTVAL,
                        '상품' || goods_id_seq.CURRVAL,
                        '상품' || goods_id_seq.CURRVAL || '설명',
                        1000 + goods_id_seq.CURRVAL,
                        '#',
                        0,
                        'IT 테크 템플릿 뒷면',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'userId1',
                        1);     
      END LOOP;
      COMMIT;
END;
/
BEGIN
      FOR i IN 1..100
      LOOP
      INSERT INTO Review(review_id,
                         title,
                         content,
                         create_date,
                         member_id,
                         goods_id,
                         score_id)
      VALUES            (review_id_seq.NEXTVAL,
                         '제목' || review_id_seq.CURRVAL,
                         '내용' || review_id_seq.CURRVAL,
                         SYSDATE,
                         'userId1',
                         1,
                         1);
      END LOOP;
      COMMIT;
END;
/
BEGIN
      FOR i IN 1..100
      LOOP
      INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '제목' || magazine_id_seq.CURRVAL,
                           '내용' || magazine_id_seq.CURRVAL,
                           '건설 건축 템플릿',
                           'IT 테크 템플릿 뒷면',
                           SYSDATE,
                           'userId1',
                           1);
      END LOOP;
      COMMIT;
END;
/
BEGIN
      FOR i IN 1..100
      LOOP
      INSERT INTO QnA(qna_id,
                      title,
                      content,
                      qna_date,
                      member_id)
      VALUES         (qna_id_seq.NEXTVAL,
                      '제목' || qna_id_seq.CURRVAL,
                      '내용' || qna_id_seq.CURRVAL,
                      SYSDATE,
                      'userId1');
      END LOOP;
      COMMIT;
END;
/                     
COMMIT;