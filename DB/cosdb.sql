-- 数据库配置
-- db.type=oracle
-- jdbc.alias=DBPool
-- jdbc.host=22.144.103.102
-- jdbc.driverClassName=oracle.jdbc.driver.OracleDriver
-- jdbc.url=jdbc:oracle:thin:@22.144.103.102:1521:cosdb
-- jdbc.username=boccfc_finace
-- jdbc.password=boccfc_finace
-- jdbc.testOnBorrow=true
-- jdbc.validationQuery=select * from dual
-- jdbc.initialSize=15
--jdbc.maxActive=30
-- jdbc.maxIdle=2
-- jdbc.minIdle=0

-- 添加一个字段
alter table INVOICE_INFORMATION add ( CHECKED_FLAG VARCHAR2(10),ERROR_CODE VARCHAR2(80) ,CHECKED_STATUS VARCHAR2(10));
-- 添加字段注释
COMMENT ON COLUMN INVOICE_INFORMATION.CHECKED_FLAG IS '查验标志';
COMMENT ON COLUMN INVOICE_INFORMATION.ERROR_CODE IS '错误码';
COMMENT ON COLUMN INVOICE_INFORMATION.CHECKED_STATUS IS '验票状态';

-- 修改字段类型
alter table INVOICE_INFORMATION modify INVOICE_TIME  DATE;

alter table INVOICE_INFORMATION modify  ERROR_CODE  varchar2(60);

alter table INVOICE_INFORMATION add (CHECKED_STATUS VARCHAR2(10));


