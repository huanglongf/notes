--  ˝æ›ø‚≈‰÷√
-- db.type=oracle
-- jdbc.alias=DBPool
-- jdbc.host=22.144.103.104
-- jdbc.driverClassName=oracle.jdbc.driver.OracleDriver
-- jdbc.url=jdbc:oracle:thin:@22.144.103.104:1521:payment
-- jdbc.username=epayment
-- jdbc.password=epayment
-- jdbc.testOnBorrow=true
-- jdbc.validationQuery=select * from dual
-- jdbc.initialSize=15
--jdbc.maxActive=30
-- jdbc.maxIdle=2
-- jdbc.minIdle=0

select * from PAY_ORDER where AcctNo = '6010019183185';

select * from PAY_PRE_ORDER where CUSTOMERID = 'ucif000000000002953';