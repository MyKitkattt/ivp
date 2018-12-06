*** Settings ***
Documentation       Negative case_Test cancel e-docunment case of identity id

Library             Selenium2Library

Resource            edoc_admin_keyword.robot
Resource            db_keywords.robot
Resource            common_variables.robot

Suite Setup         Run Keywords        Open browser e-Document             AND
                    ...                 Go to menu cancel for e-Document
Suite Teardown      Close All Browsers



*** Test Case ***
Fill in identity invalid case less then
    Fill in identity id 1234
    Click for cancel e document
    Should show alert message ไม่พบข้อมูลของท่านในระบบ

Fill in identity invalid case no data on database
    Fill in identity id 1840400047668
    Click for cancel e document
    Should show alert message ไม่พบข้อมูลของท่านในระบบ

Fill identity invalid case fill in identity id then clear data
    Fill in identity id 9090900909090
    Click for cancel e document
    Should show alert message ไม่พบข้อมูลของท่านในระบบ
    Clear fill identity id
    Should show alert message กรุณาระบุเลขที่บัตรประชาชน 13 หลักให้ถูกต้อง