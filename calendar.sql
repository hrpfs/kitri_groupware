CREATE TABLE public_calendar (
	public_id		number(8),
	lv_id		number(3),
	cat_id		number(3),
	dept_num		number(3),
	pubcal_content	varchar2(100),
	pubcal_start	date,
	pubcal_end	date,
	member_id	number(10),
	admin_id		number(10),
	
	CONSTRAINT public_calendar_public_id_pk	PRIMARY KEY (public_id),
	CONSTRAINT public_calendar_lv_id_fk		FOREIGN KEY (lv_id)	REFERENCES cal_lv (lv_id),
	CONSTRAINT public_calendar_cat_id_fk		FOREIGN KEY (cat_id)	REFERENCES cal_cat (cat_id),
	CONSTRAINT public_calendar_dept_num_fk	FOREIGN KEY (dept_num)	REFERENCES dept (dept_num),
	CONSTRAINT public_calendar_member_id_fk	FOREIGN KEY (member_id)	REFERENCES member (member_id),
	CONSTRAINT public_calendar_admin_id_fk	FOREIGN KEY (admin_id)	REFERENCES member (member_id)
);

CREATE TABLE cal_lv (
	lv_id	number(3),
	lv_name	varchar2(20),
	
	CONSTRAINT cal_lv_lv_id_pk	PRIMARY KEY (lv_id)
);

CREATE TABLE cal_cat (
	cat_id	number(3),
	cat_name	varchar2(20),
	CONSTRAINT cal_cat_cat_id_pk	PRIMARY KEY (cat_id)
);

CREATE TABLE private_calendar (
	prical_id number(8),
	member_id number(10),
	prical_content varchar2(100),
	prical_start date,
	prical_end date,
	color varchar2(8),
	CONSTRAINT private_calendar_prical_id_pk PRIMARY KEY (prical_id),
	CONSTRAINT private_calendar_member_id_fk FOREIGN KEY (member_id)	REFERENCES member (member_id)
);
--
--
--
INSERT INTO cal_lv VALUES (1, '전사');
INSERT INTO cal_lv VALUES (2, '부서');
INSERT INTO cal_lv VALUES (3, '개인');

INSERT INTO cal_cat VALUES (1,'육아');
INSERT INTO cal_cat VALUES (2,'병가');
INSERT INTO cal_cat VALUES (3,'출산');
INSERT INTO cal_cat VALUES (4,'연차');
INSERT INTO cal_cat VALUES (5,'월차');
INSERT INTO cal_cat VALUES (6,'경조사');
INSERT INTO cal_cat VALUES (7, '휴일');
INSERT INTO cal_cat VALUES (8, '행사');
INSERT INTO cal_cat VALUES (9, '출장');
INSERT INTO cal_cat VALUES (10, '휴가');
INSERT INTO cal_cat VALUES (11, '워크샵');

INSERT INTO public_calendar VALUES (1, 1, 7, 1, '창사기념일', '2018-10-25', '2018-10-25', 1, 1);
INSERT INTO public_calendar VALUES (2, 2, 11, 3, '영업팀 워크샵(가평)', TO_DATE('2018-10-29','YYYY-MM-DD'), TO_DATE('2018-10-30','YYYY-MM-DD'), 8, 8);
INSERT INTO public_calendar VALUES (3, 1, 8, 1, '간부회의', TO_DATE('2018-11-01','YYYY-MM-DD'), TO_DATE('2018-11-01','YYYY-MM-DD'), 1, 1);
INSERT INTO public_calendar VALUES (4, 3, 4, 4, '구매팀 구주임 연차 휴가', TO_DATE('2018-10-31','YYYY-MM-DD'), TO_DATE('2018-11-02','YYYY-MM-DD'), 19, 15);
INSERT INTO public_calendar VALUES (5, 3, 9, 7, '전산팀 박과장 등 5명 부산 출장', TO_DATE('2018-11-05','YYYY-MM-DD'), TO_DATE('2018-11-07','YYYY-MM-DD'), 38, 36);

INSERT INTO private_calendar VALUES (1, 1, '결혼기념일', TO_DATE('2018-10-22'), TO_DATE('2018-10-22'));
INSERT INTO private_calendar VALUES (2, 1, '내 생일', TO_DATE('2018-10-26'), TO_DATE('2018-10-26'));
INSERT INTO private_calendar VALUES (3, 4, '고등학교 동창회', TO_DATE('2018-10-30'), TO_DATE('2018-10-30'));
INSERT INTO private_calendar VALUES (4, 4, '건강검진 위내시경', TO_DATE('2018-11-07'), TO_DATE('2018-11-07'));
---
---
---
GRANT CREATE SEQUENCE TO [USER_NAME];

CREATE SEQUENCE public_calendar_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE