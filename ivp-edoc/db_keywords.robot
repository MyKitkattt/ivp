*** Settings ***
Library           DatabaseLibrary


*** Variables ***
${DB_HOST}        10.22.62.164
${DB_PORT}        1533
${DB_NAME}        ivp
${DB_USER}        ivpadmin
${DB_PWD}         it[[ivp


***Keywords***
Rollback Cancel e-doc
    Connect to Database     pymssql    ${DB_NAME}    ${DB_USER}    ${DB_PWD}    ${DB_HOST}    ${DB_PORT}
    # Execute Sql String      DECLARE @refNo VARCHAR(13) = '1969900134842';
    Execute Sql String      delete SUBSCRIBER_TRANS where Subscriber_ID = (select Subscriber_ID from SUBSCRIBER_DATA where Reference_No = '1969900134842') and Txn_Type = 'CS';
    Execute Sql String      update SUBSCRIBER_DATA set Active_Flag = 'A' where Reference_No = '1969900134842'
    Disconnect from Database

Rollback Cancel e-doc foreigner
    Connect to Database     pymssql    ${DB_NAME}    ${DB_USER}    ${DB_PWD}    ${DB_HOST}    ${DB_PORT}
    # Execute Sql String      DECLARE @refNo VARCHAR(13) = '053644282';
    Execute Sql String      delete SUBSCRIBER_TRANS where Subscriber_ID = (select Subscriber_ID from SUBSCRIBER_DATA where Reference_No = '053644282') and Txn_Type = 'CS';
    Execute Sql String      update SUBSCRIBER_DATA set Active_Flag = 'A' where Reference_No = '053644282'
    Disconnect from Database