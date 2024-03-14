CREATE TABLE `Member` (
	`member_id`	varchar(30)	NOT NULL,
	`member_type`	varchar(20)	NULL,
	`name`	varchar(30)	NULL,
	`password`	varchar(30)	NULL,
	`email`	varchar(50)	NULL,
	`tel`	varchar(30)	NULL
);

CREATE TABLE `Goods` (
	`goods_id`	number	NOT NULL,
	`name`	varchar(100)	NULL,
	`description`	varchar(100)	NULL,
	`price`	number	NULL,
	`hashtag`	varchar(100)	NULL,
	`view_cnt`	number	NULL,
	`image`	varchar(300)	NULL,
	`goods_state`	varchar(20)	NULL,
	`req_type`	varchar(20)	NULL,
	`req_date`	date	NULL,
	`resp_date`	date	NULL,
	`category_id`	number	NOT NULL,
	`member_id`	varchar(30)	NOT NULL,
	`score`	number	NOT NULL
);

CREATE TABLE `Categories` (
	`category_id`	number	NOT NULL,
	`name`	varchar(30)	NULL
);

CREATE TABLE `QnA` (
	`qna_id`	number	NOT NULL,
	`title`	varchar(100)	NULL,
	`content`	varchar(1000)	NULL,
	`date`	date	NULL	DEFAULT sysdate,
	`member_id`	varchar(30)	NOT NULL
);

CREATE TABLE `Cart` (
	`cart_id`	number	NOT NULL,
	`goods_id`	number	NULL,
	`member_id`	varchar(30)	NULL
);

CREATE TABLE `Review` (
	`review_id`	number	NOT NULL,
	`title`	varchar(50)	NULL,
	`content`	varchar(300)	NULL,
	`create_date`	date	NULL,
	`member_id`	varchar(30)	NOT NULL,
	`goods_id`	number	NOT NULL,
	`score`	number	NOT NULL
);

CREATE TABLE `ScoreGrade` (
	`score`	number	NOT NULL
);

CREATE TABLE `wish_list` (
	`wish_goods_id`	number	NOT NULL,
	`member_id`	varchar(30)	NOT NULL,
	`goods_id2`	number	NOT NULL
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`member_id`
);

ALTER TABLE `Goods` ADD CONSTRAINT `PK_GOODS` PRIMARY KEY (
	`goods_id`
);

ALTER TABLE `Categories` ADD CONSTRAINT `PK_CATEGORIES` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `QnA` ADD CONSTRAINT `PK_QNA` PRIMARY KEY (
	`qna_id`
);

ALTER TABLE `Cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cart_id`
);

ALTER TABLE `Review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `ScoreGrade` ADD CONSTRAINT `PK_SCOREGRADE` PRIMARY KEY (
	`score`
);

ALTER TABLE `wish_list` ADD CONSTRAINT `PK_WISH_LIST` PRIMARY KEY (
	`wish_goods_id`
);

