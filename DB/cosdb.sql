-- ���ݿ�����
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

-- ���һ���ֶ�
alter table INVOICE_INFORMATION add ( CHECKED_FLAG VARCHAR2(10),ERROR_CODE VARCHAR2(80) ,CHECKED_STATUS VARCHAR2(10));
-- ����ֶ�ע��
COMMENT ON COLUMN INVOICE_INFORMATION.CHECKED_FLAG IS '�����־';
COMMENT ON COLUMN INVOICE_INFORMATION.ERROR_CODE IS '������';
COMMENT ON COLUMN INVOICE_INFORMATION.CHECKED_STATUS IS '��Ʊ״̬';

-- �޸��ֶ�����
alter table INVOICE_INFORMATION modify INVOICE_TIME  DATE;

alter table INVOICE_INFORMATION modify  ERROR_CODE  varchar2(60);

alter table INVOICE_INFORMATION add (CHECKED_STATUS VARCHAR2(10));


