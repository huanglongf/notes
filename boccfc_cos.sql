-- ���ݿ�����
-- db.type=oracle
-- jdbc.alias=DBPool
-- jdbc.host=22.144.103.101
-- jdbc.driverClassName=oracle.jdbc.driver.OracleDriver
-- jdbc.url=jdbc:oracle:thin:@22.144.103.101:1521:cosdb
-- jdbc.username=boccfc_cos
-- jdbc.password=boccfc_cos
-- jdbc.testOnBorrow=true
-- jdbc.validationQuery=select * from dual
-- jdbc.initialSize=15
--jdbc.maxActive=30
-- jdbc.maxIdle=2
-- jdbc.minIdle=0

--  ��֧������У����� failure_count
select * from UCIF_PAY_PWD_LJNL where CUSTOMER_ID='ucif000000000002908';

--  ���� customerid  ���� ��Ӧ�� loanacctno �����˺�
select * from ucif_user_account where CUSTOMERID='ucif000000000002953';

--  ���� mobile  ���� ��Ӧ�� customerid �ͻ�ID
select CUSTOMERID from cos_users where mobile = '15350000112';












