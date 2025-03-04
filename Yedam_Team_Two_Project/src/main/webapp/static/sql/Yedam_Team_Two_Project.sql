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
	description	VARCHAR2(1000),
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
    title       VARCHAR(300),
    content     VARCHAR(3000),
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
       
       
--더미값 넣기

--멤버 샘플 데이터
BEGIN
      FOR i IN 1..60
      LOOP
      INSERT INTO member (member_id,
                          member_type,
                          name,
                          password,
                          email,
                          tel)
       VALUES             ('userId' || i,
                           'CLIENT',
                           '사용자' || i,
                           'pw' || i,
                           '이메일' || i || '@email.com',
                           '010-1111-111'|| i);        
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
                           'pw' || i,
                           '이메일' || i || '@email.com',
                           '010-1111-111'|| i);        
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
                           'pw' || i,
                           '이메일' || i || '@email.com',
                           '010-1111-111'|| i);        
      END LOOP;
      COMMIT;
END;
/

--리뷰 샘플 데이터
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

--광고 카테고리 샘플 데이터
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
                        
--상품 카테고리 샘플 데이터                        
INSERT INTO categories
VALUES (1,'사업계획서');
INSERT INTO categories
VALUES (2,'자기소개서');
INSERT INTO categories
VALUES (3,'PPT');
INSERT INTO categories
VALUES (4,'교육용');
INSERT INTO categories
VALUES (5,'애니메이션');

--상품 샘플 데이터
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
                        '사업제안서 PPT 템플릿',
                        '제목 사업제안서 PPT 템플릿
                         해쉬테그 #제안서 #기획서 #심플 #블루
                         가격 15000원
                         카테고리: 사업계획서 ',
                        15000,
                        '#제안서 #기획서 #심플',
                        0,
                        '사업제안서 ppt 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        1);     
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
                        '블루톤 자기소개서',
                        '제목 블루톤 자기소개서
                         해쉬테그 #자기소개서 #자기소개 #깔끔한PPT #블루
                          가격 12000원
                         카테고리: 자기소개서',
                        12000,
                        ' #자기소개서 #자기소개 #깔끔한PPT',
                        0,
                        '블루톤 자기소개서.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        2);  
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
                        '깔끔한 PPT 템플릿(애니메이션)',
                        '제목 블루톤 자기소개서
                         해쉬테그 #자기소개서 #자기소개 #깔끔한PPT #블루
                          가격 12000원
                         카테고리: 자기소개서',
                        12000,
                        ' #자기소개서 #자기소개 #깔끔한PPT',
                        0,
                        '깔끔한 PPT 템플릿(애니메이션).jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        2);  
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '손글씨 느낌 템플릿',
                        '제목: 손글씨 느낌 템플릿
                         해쉬테그: #낙서 #감성 #손글씨 #레포트
                         가격: 14000원
                         카테고리: 교육용',
                        14000,
                        '#낙서 #감성 #손글씨',
                        0,
                        '손글씨 느낌 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'sellerId34',
                        2); 
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '편안한 분위기의 그라데이션 템플릿',
                        '제목:편안한 분위기의 그라데이션 템플릿 
                         키워드: #그라데이션 #편안함 #보라 #집
                         가격: 14300원 
                         카테고리: 자기소개서',
                         14300,
                        '#그라데이션 #편안함 #보라',
                        0,
                        '겨울밤 감성 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'sellerId34',
                         4); 
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '심플 디자이너 포트폴리오 템플릿',
                        '제목: 심플 디자이너 포트폴리오 템플릿',
                        18000,
                        '#낙서 #감성 #손글씨',
                        0,
                        '손글씨 느낌 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'sellerId34',
                        2);
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '심플 디자이너 포트폴리오 템플릿',
                        '제목: 심플 디자이너 포트폴리오 템플릿',
                        18000,
                        '#낙서 #감성 #손글씨',
                        0,
                        '손글씨 느낌 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'sellerId34',
                        2);
        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '손글씨 느낌 자기 소개서(여성)',
                        '제목: 손글씨 느낌 자기 소개서(여성)',
                        15000,
                        '#낙서 #감성 #손글씨',
                        0,
                        '손글씨 느낌 자기 소개서(여성).jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'sellerId34',
                        4);
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '사각형 자동차 테마',
                        '제목: 사각형 자동차 테마',
                        15000,
                        ' #사각형 #네모 #자동차',
                        0,
                        '사각형 자동차 테마.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        5);
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '둥근모서리 테마',
                        '제목: 둥근모서리 테마',
                        15000,
                        '#둥근 #심플 #청회색 #차트',
                        0,
                        '둥근모서리 테마.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        5);
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '교육 템플릿',
                        '제목: 교육 템플릿',
                        14000,
                        '#역사 #교육 #일러스트 #발표',
                        0,
                        '교육 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'sellerId34',
                        5);
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '그리너리 템플릿',
                        '제목: 그리너리 템플릿',
                        13000,
                        '#그린 #심플 #IT #스타트업',
                        0,
                        '교육 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        4);
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '말랑말랑 템플릿',
                        '제목: 말랑말랑 템플릿',
                        15000,
                        '#핑크 #그라데이션 #심플',
                        0,
                        '말랑말랑 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        5,
                        'sellerId34',
                        4);
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '전통문양 템플릿',
                        '제목: 전통문양 템플릿',
                         20000,
                        '#명절 #문화 #전통문양 #역사',
                        0,
                        '전통문양 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        5,
                        'sellerId34',
                        4);
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '그레이 감성 템플릿',
                        '제목: 그레이 감성 템플릿',
                         20000,
                        '#블랙 #모노톤 #감성 #인포그래픽',
                        0,
                        '그레이 감성 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        4);
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '퍼플 몽환 템플릿',
                        '제목: 퍼플 몽환 템플릿',
                         20000,
                        '#블랙 #모노톤 #감성 #인포그래픽',
                        0,
                        '퍼플 몽환 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        4);
                        
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
     VALUES            (goods_id_seq.NEXTVAL,
                        '차이나 레드 Light',
                        '제목:차이나 레드 Ligh',
                         14000,
                        '#중국 #차이나 #레드',
                        0,
                        '퍼플 몽환 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'sellerId34',
                        4);
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
         VALUES         (goods_id_seq.NEXTVAL,
                        'White Mountain Template',
                        '제목:White Mountain Template',
                         16000,
                        '#중국 #차이나 #레드',
                        0,
                        'White Mountain Template.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        3);
                        
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
         VALUES         (goods_id_seq.NEXTVAL,
                        '따뜻한 연말 감성 템플릿',
                        '제목:따뜻한 연말 감성 템플릿',
                         16000,
                        '#겨울 #감성 #연보라색 ',
                        0,
                        '퍼플 몽환 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                       2,
                        'sellerId34',
                        4);
                        
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
         VALUES         (goods_id_seq.NEXTVAL,
                        '남극의 펭자를 소개합니다.',
                        '제목:남극의 펭자를 소개합니다.',
                         16000,
                        '#펭귄 #펭자 #귀여움 ',
                        0,
                        '남극의 펭자를 소개합니다.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                       4,
                        'sellerId34',
                        4);
                        
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
         VALUES         (goods_id_seq.NEXTVAL,
                        'WARM TONE PPT 템플릿.',
                        '제목:WARM TONE PPT 템플릿.',
                         12300,
                        '#펭귄 #펭자 #귀여움 ',
                        0,
                        '남극의 펭자를 소개합니다.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                       4,
                        'sellerId34',
                        4);
        
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
         VALUES         (goods_id_seq.NEXTVAL,
                        '겨울겨울한 템플릿 ',
                        '제목:겨울겨울한 템플릿 ',
                         13400,
                        '#심플 #겨울 #감성',
                        0,
                        '겨울겨울한 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'sellerId34',
                        4);
                        
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
         VALUES         (goods_id_seq.NEXTVAL,
                        '아이스크림 가게가 생각나는 핑크 템플릿 ',
                        '제목:아이스크림 가게가 생각나는 핑크 템플릿',
                         14800,
                        '#핑크 #발랄 #아이스크림',
                        0,
                        '겨울겨울한 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'sellerId34',
                        5);
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
         VALUES         (goods_id_seq.NEXTVAL,
                        '요식업 그린 Light',
                        '제목:요식업 그린 Light',
                         17500,
                        '#요식업 #식품 #그린',
                        0,
                        '겨울겨울한 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'sellerId34',
                        5);
                        
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
         VALUES         (goods_id_seq.NEXTVAL,
                        '편안한 분위기의 그라데이션 템플릿 ',
                        '제목:편안한 분위기의 그라데이션 템플릿 ',
                         14300,
                        '#그라데이션 #편안함 #보라',
                        0,
                        '편안한 분위기의 그라데이션 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'sellerId34',
                        3);

--기업용 상품 데이터
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
                        '포트폴리오 템플릿 세트 4종',
                        '포트폴리오 템플릿 세트 4종
                        해시태그 - #할인 #포트폴리오세트 #4종 #파파타컬랙션
                        가격 - 12000원 ',
                        12000,
                        '#할인 #포트폴리오세트 #4종',
                        0,
                        '포트폴리오 템플릿 세트 4종.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        4);
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
                        '봄맞이 일러스트 템플릿',
                        '봄맞이 일러스트 템플릿
	                    해시태그 - #봄# 일러스트 #벚꽃 #핑크
	                     가격 - 13200원',
                        13200,
                        '#봄# 일러스트 #벚꽃 #핑크',
                        0,
                        '봄맞이 일러스트 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        5,
                        'managerId61',
                        5); 
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
                        '피트니스 센터 소개서 템플릿',
                        '피트니스 센터 소개서 템플릿
                        해시태그 - #피트니스 #센터 #소개서 #포인트컬러
                        가격 - 15000원',
                        15000,
                        '#피트니스 #센터 #소개서',
                        0,
                        '피트니스 센터 소개서 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        4);
                       
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
                        '블루톤 관광사업 안내서 템플릿',
                        '블루톤 관광사업 안내서 템플릿
                         해시태그 - #블루 #관광 #사업계획서 #안내서
                         가격 - 12300원',
                        12300,
                        '#피트니스 #센터 #소개서 #포인트컬러',
                        0,
                        '피트니스 센터 소개서 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        3);
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
                        '3D 오브젝트 소개 템플릿',
                        '3D 오브젝트 소개 템플릿
                        해시태그 - #3D #오브젝트 #소개 #그래픽
	                   가격 - 13400원',
                        13400,
                        '#피트니스 #센터 #소개서 #포인트컬러',
                        0,
                        '3D 오브젝트 소개 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        4);
        
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
                        '디자이너를 위한 포트폴리오 템플릿',
                        '디자이너를 위한 포트폴리오 템플릿
                         해시태그 - #할인 #디자이너 #포트폴리오 #블랙
                         가격 - 17200원',
                        17200,
                        '#할인 #디자이너 #포트폴리오',
                        0,
                        '디자이너를 위한 포트폴리오 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        5);
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
                        '주황 심플 템플릿',
                        '주황 심플 템플릿
                        해시태그 - #주황 #심플 #사업 #기획서
                        가격 - 8000원',
                        18000,
                        '#주황 #심플 #사업 #기획서',
                        0,
                        '주황 심플 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        5,
                        'managerId61',
                        5);
                        
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
                        '진행형 인포그래픽 템플릿',
                        '진행형 인포그래픽 템플릿
                        해시태그 - #퍼플 #옐로우 #인포그래픽 #발표
                        가격 - 18000원',
                        18000,
                        '#퍼플 #옐로우 #인포그래픽 #발표',
                        0,
                        '진행형 인포그래픽 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);
                        
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
                        '아쿠아 템플릿',
                        '아쿠아 템플릿
                        해시태그 - #아쿠아 #그라데이션 #차트 #발표용
                        가격 - 17200원',
                        17200,
                        '#아쿠아 #그라데이션 #차트 #발표용',
                        0,
                        '아쿠아 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);
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
                        'IT 테크 템플릿',
                        'T 테크 템플릿
                            해시태그 - #네이비 #IT #테크 #제안서 #산업
                            가격 - 14500원',
                        14500,
                        '#네이비 #IT #테크 #제안서 #산업',
                        0,
                        'IT 테크 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);
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
                        '매거진 컨셉 제안서 템플릿',
                        '매거진 컨셉 제안서 템플릿
	                 해시태그 - #레드 #감성 #무드 #매거진 #제안서
                   	가격 - 12300원',
                        12300,
                        '#레드 #감성 #무드 #매거진 #제안서',
                        0,
                        '매거진 컨셉 제안서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        4);
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
                        '건설 건축 템플릿',
                        '건설 건축 템플릿
                        해시태그 - #건설 #건축 #사업계획서 #소개서 #무료
                        가격 - 12200원',
                        12200,
                        '#건설 #건축 #사업계획서 #소개서 #무료',
                        0,
                        '건설 건축 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        4);
        
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
                        '학생 템플릿 세트 6종 ver.02',
                        '학생 템플릿 세트 6종 ver.02
                        해시태그 - #학생세트 #6종 #파파타컬렉션 #버전2
                        가격 - 18500원',
                        18500,
                        '#학생세트 #6종 #파파타컬렉션 #버전2',
                        0,
                        '학생 템플릿 세트 6종 ver.02.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);
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
                        '비즈니스 템플릿 세트 4종 ver.02',
                        '비즈니스 템플릿 세트 4종 ver.02
                        해시태그 - #비즈니스세트 #4종 #파파타컬렉션 #버전2
                        가격 - 28000원',
                        28000,
                        '#비즈니스세트 #4종 #파파타컬렉션 #버전2',
                        0,
                        '학생 템플릿 세트 6종 ver.02.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);
            
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
                        '비즈니스 템플릿 세트 10종 ver.02',
                        '비즈니스 템플릿 세트 10종 ver.02
                        해시태그 - #비즈니스세트 #10종 #파파타컬렉션 #버전2
                        가격 - 45000원',
                        45000,
                        '#비즈니스세트 #10종 #파파타컬렉션 #버전2',
                        0,
                        '비즈니스 템플릿 세트 10종 ver.02.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);
                        
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
                        '겨울 숲 일러스트 템플릿',
                        '겨울 숲 일러스트 템플릿
                    해시태그 - #그린 #일러스트 #겨울 #발표
                        가격 - 19000원',
                        19000,
                        '#비즈니스세트 #10종 #파파타컬렉션 #버전2',
                        0,
                        '겨울 숲 일러스트 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        5,
                        'managerId61',
                        5);
                        
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
                        '경영의 기초 템플릿',
                        '경영의 기초 템플릿
                        해시태그 - #경영 #기초 #발표 #분석 #자료
                        가격 - 12000원',
                        12000,
                        '#경영 #기초 #발표 #분석 #자료',
                        0,
                        '겨울 숲 일러스트 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        3);
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
                        '뷰티 회사소개서 템플릿',
                        '뷰티 회사소개서 템플릿
                        해시태그 - #뷰티 #회사소개서 #홍보 #광고 #무료
                        가격 - 18000원',
                        18000,
                        '#뷰티 #회사소개서 #홍보 #광고 #무료',
                        0,
                        '뷰티 회사소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        4);
                        
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
                        '퍼플 비즈니스 템플릿',
                        '퍼플 비즈니스 템플릿
                        해시태그 - #퍼플 #비즈니스 #IR #회사소개서 #마일스톤
                        가격 - 18000원',
                        18000,
                        '#퍼플 #비즈니스 #IR #회사소개서 #마일스톤',
                        0,
                        '퍼플 비즈니스 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        4);
                        
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
                        '발표용 움직이는 배경 템플릿',
                        '발표용 움직이는 배경 템플릿',
                        12000,
                        '#발표용 #움직이는 #배경',
                        0,
                        '발표용 움직이는 배경 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        3);
                        
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
                        '심플 팀프로젝트 템플릿',
                        '심플 팀프로젝트 템플릿',
                        0,
                        '#무료 #심플 #팀프로젝트',
                        0,
                        '심플 팀프로젝트 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);

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
                        '퍼플 세미나 템플릿',
                        '퍼플 세미나 템플릿',
                        8000,
                        '#퍼플 #세미나 #행사',
                        0,
                        '퍼플 세미나 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);
                        
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
                        '사업 제안서 템플릿',
                        '사업 제안서 템플릿',
                        8000,
                        '#사업제안서 #IR #소개서',
                        0,
                        '사업 제안서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        5);                        

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
                        'AI 비즈니스 소개서 템플릿',
                        'AI 비즈니스 소개서 템플릿',
                        0,
                        '#무료 #AI #비즈니스 #소개서',
                        0,
                        'AI 비즈니스 소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        5);  

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
                        'Viva Magenta 뷰티 템플릿',
                        'Viva Magenta 뷰티 템플릿',
                        0,
                        '#무료 #vivamagenta #뷰티',
                        0,
                        'Viva Magenta 뷰티 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);  

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
                        '심플 교육 소개서 템플릿',
                        '심플 교육 소개서 템플릿',
                        5000,
                        '#심플 #교육 #소개서',
                        0,
                        '심플 교육 소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);

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
                        '커뮤니티 네트워크 템플릿',
                        '커뮤니티 네트워크 템플릿',
                        0,
                        '#무료 #커뮤니티 #네트워크',
                        0,
                        '커뮤니티 네트워크 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);

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
                        '심플 포트폴리오 세로형',
                        '심플 포트폴리오 세로형',
                        0,
                        '#무료 #심플포트폴리오 #세로형',
                        0,
                        '심플 포트폴리오 세로형.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);

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
                        '서비스 소개 템플릿',
                        '서비스 소개 템플릿',
                        0,
                        '#서비스 #소개서 #네이비',
                        0,
                        '서비스 소개 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        1,
                        'managerId61',
                        5);

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
                        '교육 프로그램 안내 템플릿',
                        '교육 프로그램 안내 템플릿',
                        0,
                        '#교육 #프로그램 #강의소개서',
                        0,
                        '교육 프로그램 안내 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);
                   
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
                        'TWO POINT 템플릿',
                        'TWO POINT 템플릿',
                        5000,
                        '#투포인트 #블루 #옐로우',
                        0,
                        'TWO POINT 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);
                   
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
                        '3D 모델 활용 템플릿',
                        '3D 모델 활용 템플릿',
                        0,
                        '#무료 #3D #모델',
                        0,
                        '3D 모델 활용 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);
                        
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
                        'xbox 광고기획서 템플릿',
                        'xbox 광고기획서 템플릿',
                        8000,
                        '#xbox #광고기획서 #제안서',
                        0,
                        'xbox 광고기획서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);
                        
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
                        '스포츠 테마 템플릿',
                        '스포츠 테마 템플릿',
                        0,
                        '#무료 #스포츠 #테마',
                        0,
                        '스포츠 테마 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        4,
                        'managerId61',
                        5);                        
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
                        '엔터테인먼트 회사소개서 템플릿',
                        '엔터테인먼트 회사소개서 템플릿',
                        0,
                        '#무료 #엔터테인먼트 #회사소개서',
                        0,
                        '엔터테인먼트 회사소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);
                        
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
                        'NABER 쇼핑 소개서 템플릿',
                        'NABER 쇼핑 소개서 템플릿',
                        0,
                        '#무료 #쇼핑 #소개서',
                        0,
                        'NABER 쇼핑 소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);
                        
                        
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
                        '심플 그레이 올인원 템플릿',
                        '심플 그레이 올인원 템플릿',
                        9900,
                        '#심플 #그레이 #올인원',
                        0,
                        '심플 그레이 올인원 템플릿.jpg',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);

                        
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
                        '심플 레이아웃 올인원 템플릿',
                        '심플 레이아웃 올인원 템플릿',
                        9900,
                        '#심플 #레이아웃 #올인원',
                        0,
                        '심플 레이아웃 올인원 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);

                        
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
                        '광고 마케팅 템플릿',
                        '광고 마케팅 템플릿',
                        8000,
                        '#광고 #마케팅 #발표용',
                        0,
                        '광고 마케팅 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        3,
                        'managerId61',
                        5);
                        
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
                        '컨퍼런스 발표용 템플릿',
                        '컨퍼런스 발표용 템플릿',
                        0,
                        '#무료 #컨퍼런스 #발표용',
                        0,
                        '컨퍼런스 발표용 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);

                        
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
                        'NABER 쇼핑 소개서 템플릿',
                        'NABER 쇼핑 소개서 템플릿',
                        0,
                        '#무료 #쇼핑 #소개서',
                        0,
                        'NABER 쇼핑 소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);

                        
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
                        'NABER 쇼핑 소개서 템플릿',
                        'NABER 쇼핑 소개서 템플릿',
                        0,
                        '#무료 #쇼핑 #소개서',
                        0,
                        'NABER 쇼핑 소개서 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);
                                                                                                                                                 
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
                        'IT 테크 템플릿',
                        'T 테크 템플릿
                            해시태그 - #네이비 #IT #테크 #제안서 #산업
                            가격 - 14500원',
                        14500,
                        '#네이비 #IT #테크 #제안서 #산업',
                        0,
                        'IT 테크 템플릿.png',
                        'SALE',
                        'NONE',
                        SYSDATE,
                        SYSDATE,
                        2,
                        'managerId61',
                        5);                        
                        
      COMMIT;


      
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '대학생에게 진심인 기업 파파타랩스, 프레젠테이션 대회 PINALE 지원',
                           '지난 1월 27일(토) 서울과 경기권 대학생들의 연합 프레젠테이션 동아리 ‘피날래(피티에 날개를 달아볼래)’ 행사에 PPT 콘텐츠 플랫폼 파파타랩스가 공식 협찬을 진행했다고 밝혔다. 피날래는 수도권에서 활동하는 3대 대학생 프레젠테이션 동아리인 ‘UnivPT(유니브피티)’, ‘Crepas(크레파스)’, ‘spling(스피링)이 연합하여 진행하는 경쟁PT 대회로 올해로 제15회를 맞이하게 되었다. 다양한 대학 연합 동아리에 지원을 해왔던 PPT 콘텐츠 플랫폼 파파타랩스(대표 신강식)가 상금을 비롯해 참가자 전원에게 [학생들에게 유용한 템플릿 10종 세트]제공했고 추첨 이벤트 상품인 커피 기프티콘까지 제공하며 대학생들이 주관하는 특별한 행사의 원활한 진행을 위한 지원을 아끼지 않았다. 행사에 직접 참관한 파파타랩스 관계자는 “대학생들이 열정과 재능을 온몸으로 느낄 수 있는 시간이었고 이런 행사에 지원할 수 있게 되어 매우 뜻깊고 자랑스럽다”라며 “앞으로 프레젠테이션 대회를 비롯한 다양한 대학 동아리와의 만남을 통해 끊임없이 대학생들과 소통하는 기회를 만들어가고 싶다”라고 밝혔다. 한편, 파파타랩스는 지난 23년 6월 2만 회원을 넘어 3만명 이상의 회원이 활동하는 사이트로 성장 중이며 그에 맞춰 편의성을 개선한 사이트 리뉴얼과 리브랜딩을 통한 새로운 출발을 준비하고 있다.',
                           '뉴스1 썸네일.jpg',
                           '뉴스1 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);

 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '베어유와 파파타랩스가 함께 제작한 PPT 마스터클래스 와디즈 펀딩이 곧 시작됩니다!',
                           ' ',
                           '뉴스2 썸네일.jpg',
                           '뉴스2 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);    
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '파파타랩스 누적회원 2만명 돌파!',
                           ' ',
                           '뉴스3 썸네일.jpg',
                           '뉴스3 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);    
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '피피티꿀팁페이지',
                           ' 안녕하세요, PPT 디자인 플랫폼 파파타랩스입니다. 최근 파파타랩스와 함께하는 피피티 꿀팁 페이지 "피꿀"을 오픈하게 되었는데요. 기존 랩스 페이지에서 진행했던 다양한 꿀팁을 알려주는 콘텐츠에 이어 좀 더 다양하고 지속적인 콘텐츠를 전달하기 위해 새로운 채널을 오픈하게 되었답니다. 기존 랩스 인스타와 별개로 꿀팁으로만 이루어진 채널로 더 간편하게 꿀팁들을 모아 볼 수 있게 되었습니다 :) ',
                           '뉴스4 썸네일.jpg',
                           '뉴스4 내용이미지.png',
                           SYSDATE,
                           'managerId96',
                           1);   
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '아이콘의 색상을 내 마음대로 바꿔보자!',
                           '검정 아이콘이 싫으시다고요? 1분만 투자해보세요. 어떠한 색의 아이콘도 여러분이 직접 만들 수 있습니다.',
                           '뉴스5 썸네일.png',
                           '뉴스5 내용이미지.png',
                           SYSDATE,
                           'managerId96',
                           1);           
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '1분만에 만드는 감성적인 PPT 표지',
                           'PPT 표지 만들기 어렵지 않습니다. 1분만 투자해보세요. 여러분도 감각적인 표지를 디자인 할 수 있습니다.',
                           '뉴스6 썸네일.png',
                           '뉴스6 내용이미지.png',
                           SYSDATE,
                           'managerId96',
                           1);          
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '피피티로 나만의 인생네컷 프레임 만들기',
                           '이게 요즘 유행이라던데~?? 내 손으로 직접 제작한 프레임으로 찍는 인생네컷, 정말 특별하지 않나요? 이 세상에 단 하나뿐인 나만의 프레임, 피피티로 쉽게 만들어보세요!',
                           '뉴스7 썸네일.jpg',
                           '뉴스7 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);      
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '이거 하나만 써도 이번 학기 A+! 노토산스',
                           '안녕하세요 파파타랩스입니다~! 오늘은 과제 할 때 사용하기 좋은 폰트를 추천해드리려고 해요! 구글과 어도비가 합작하여 탄생시킨 노토산스를 소개합니다. 노토 산스는 상업적 무료 이용이 가능하답니다!',
                           '뉴스8 썸네일.jpg',
                           '뉴스8 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);    
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           '열 텍스트 안 부러운 픽토그램 활용법',
                           '안녕하세요 파파타랩스입니다~! 오늘은 픽토그램을 활용하여 PPT의 퀄리티를 높이는 방법을 함께 알아보아요~',
                           '뉴스9 썸네일.jpg',
                           '뉴스9 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);      
                           
 INSERT INTO Magazine(magazine_id,
                           title,
                           content,
                           thumbnail,
                           image,
                           create_date,
                           member_id,
                           mc_id)
      VALUES              (magazine_id_seq.NEXTVAL,
                           'PPT 템플릿 썸네일 리뉴얼',
                           '안녕하세요 파파타랩스입니다~! 오늘은 PPT 템플릿 썸네일을 새롭게 리뉴얼한 소식을 들고 왔어요~기존 썸네일보다 첫 장을 더 강조시킨 썸네일인데요~ 썸네일만 보고도 어떤 분위기의 템플릿인지 감이 딱 오시죠?',
                           '뉴스10 썸네일.jpg',
                           '뉴스10 내용이미지.jpg',
                           SYSDATE,
                           'managerId96',
                           1);                              

COMMIT;