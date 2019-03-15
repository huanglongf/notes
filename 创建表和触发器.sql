---创建预支付表

DROP TABLE "PAY_PRE_ORDER" CASCADE CONSTRAINTS;

/*==============================================================*/
/* TABLE: "PAY_PRE_ORDER"                                       */
/*==============================================================*/
CREATE TABLE "PAY_PRE_ORDER"  (
  "ID"                 NUMBER(6)                       NOT NULL,
	"MERCHANTID"         VARCHAR2(15), 
	"CUSTOMERID"         VARCHAR2(64), 
	"PRODUCTCODE"        VARCHAR2(10), 
	"ORDERSTATUS"        VARCHAR2(2), 
	"ACCTNO"             VARCHAR2(13), 
	"MOBILENO"           VARCHAR2(11), 
	"EMAIL"              VARCHAR2(100), 
	"LASTUPDATETIME"     DATE, 
	"MERCHANTORDERID"    VARCHAR2(32), 
	"SELFPAYAMOUNT"      NUMBER(12), 
	"COURSEAMT"          NUMBER(12), 
	"LOANAMOUNT"         NUMBER(12), 
	"GOODSNAME"          VARCHAR2(100), 
	"LOANDEADLINE"       VARCHAR2(2), 
	"RETURNDATE"         VARCHAR2(2), 
	"PAYMODE"            VARCHAR2(1), 
	"EASYPAYTYPE"        VARCHAR2(1), 
	"INSTALTYPE"         VARCHAR2(1), 
	"INTRESTFEETYPE"     VARCHAR2(1), 
	"INTRESTTYPE"        VARCHAR2(1), 
	"INSTALFEETYPE"      VARCHAR2(1), 
	"PREPAYTYPE"         VARCHAR2(1), 
	"FIRSTPAYMENTTYPE"   VARCHAR2(1), 
	"MERCHANTCODE"       VARCHAR2(15), 
	"MERCHANTNAME"       VARCHAR2(100), 
	"PAYTYPE"            VARCHAR2(1), 
	"CHARGETYPE"         VARCHAR2(1), 
	"CURRENCY"           VARCHAR2(1), 
	"USETEMPCRELINE"     VARCHAR2(1), 
	"COMUSETYPE"         VARCHAR2(1), 
	"PAYDESCRIPTION"     VARCHAR2(100), 
	"ORDERCREATETIME"    DATE,
   CONSTRAINT PK_PAY_PRE_ORDER PRIMARY KEY ("ID")
);


--序列化
CREATE SEQUENCE S_PAY_PRE_ORDER
MINVALUE 1
MAXVALUE 9999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;

---触发器
create or replace trigger "TIB_PAY_PRE_ORDER" before insert
on PAY_PRE_ORDER for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence S_PAY_WHITEUSER（序列名）
    select S_PAY_PRE_ORDER.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;


---------MERCHANTNOTIFY添加字段TYPE VARCHAR2(2)----


---创建扫描结果通知表--------
drop table PAY_QRSCAN_NOTIFY;

CREATE TABLE "PAY_QRSCAN_NOTIFY" (

  "ID"     NUMBER(6)            NOT NULL,

  "PREPAYMENTID"    NUMBER(6),  

  "NOTIFYTYPE"     VARCHAR2(50),

  "TRANSCODE"     VARCHAR(4),

  "PRODUCTCODE"    VARCHAR(10),

  "MERCHANTID"     VARCHAR2(15),

  "CUSTOMERID"     VARCHAR2(64),

  "INTIME"       TIMESTAMP,

  "PROCESSSTATUS"   VARCHAR(2),

  "PROCESSTIME"    TIMESTAMP,

  "PROCESSCOUNT"    INTEGER,

  "MOBILENO"      VARCHAR2(11),

  "STATUS"       VARCHAR(4),

  "MERCHANTORDERID"  VARCHAR2(32),

  CONSTRAINT PK_QRSCANNOTIFY PRIMARY KEY ("ID"),

  CONSTRAINT "FK_PAY_QRSCAN_NOTIFY" FOREIGN KEY ("PREPAYMENTID")  --外键设置

  REFERENCES "EPAYMENT"."PAY_PRE_ORDER" ("ID") ENABLE

);


-- Create sequence 
create sequence S_PAY_QRSCAN_NOTIFY
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
cache 20;

--触发器
create or replace trigger "tib_PAY_QRSCAN_NOTIFY" before insert
on PAY_QRSCAN_NOTIFY for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence S_PAY_WHITEUSER（序列名）
    select S_PAY_QRSCAN_NOTIFY.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;


----创建用户子表
DROP TABLE PAY_APPLYUSER_EVEREAS CASCADE CONSTRAINTS;

/*==============================================================*/
/* TABLE: PAY_APPLYUSER_EVEREAS                                 */
/*==============================================================*/
CREATE TABLE PAY_APPLYUSER_EVEREAS  (
   COOPMERID            VARCHAR2(15),
   COOPCUSID            VARCHAR2(64),
   COOPORDERID          VARCHAR2(32),
   ID                   NUMBER                          NOT NULL,
  CONSTRAINT PK_PAY_APPLYUSER_EVEREAS PRIMARY KEY (ID),
  CONSTRAINT "FK_PAY_APPLYUSER_EVEREAS" FOREIGN KEY ("ID")
  REFERENCES "EPAYMENT"."PAY_APPLYUSER" ("ID") ENABLE
);

-- Create sequence 
create sequence S_PAY_APPLYUSER_EVEREAS
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
cache 20;

--触发器
create or replace trigger "tib_PAY_APPLYUSER_EVEREAS" before insert
on PAY_APPLYUSER_EVEREAS for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence S_PAY_WHITEUSER（序列名）
    select S_PAY_APPLYUSER_EVEREAS.NEXTVAL INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;

---------------------------

-- Create sequence 
create sequence S_PAY_WHITEUSER（名字）
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
cache 20;

--触发器
create or replace trigger "tib_pay_whiteuser（名字）" before insert
on pay_whiteuser（表名） for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID" uses sequence S_PAY_WHITEUSER（序列名）
    select S_PAY_WHITEUSER.NEXTVAL(序列名.NEXTVAL) INTO :new.ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;




