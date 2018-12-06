*** Settings ***
Resource            edoc_admin_keyword.robot

Documentation       Positive case_Test for reject cancel e-Document of national thai

Library             Selenium2Library

Suite Setup         Run Keywords        Rollback Cancel e-doc               AND
                    ...                 Open browser e-Document             AND
                    ...                 Go to menu cancel for e-Document    AND
                    ...                 Cancel e document                   AND
                    ...                 Open admin login page               AND
                    ...                 Login with username "ityosapol"     AND
                    ...                 Go to approve reject page
Suite Teardown              Close All Browsers


*** Test Case ***
Approve cancel e document
    Fill in identity id 1969900134842
    Choose service name container e-Doc
    Choose type container ยกเลิกบริการ e-Doc
    Click search button

Should show table request
    Should show data on table 1 row only
    Card type should be 0 บัตรประชาชน
    Identity id should be 1969900134842
    Type container should be ยกเลิกบริการ e-Doc
    Click view button for show attach file
    Click reject in table
    Choose reason for reject ท่านระบุข้อมูลสมัครสมาชิก ไม่ตรงกับข้อมูลในบัตรประชาชน
    Should show popup message ไม่อนุมัติจำนวน 1 รายการ

Check result transaction on the table
    Result table should be 2 4 e-Doc
    Result table should be 2 5 ยกเลิกบริการ
    Result table should be 2 7 1969900134842
    Result table should be 2 11 ท่านระบุข้อมูลสมัครสมาชิก ไม่ตรงกับข้อมูลในบัตรประชาชน
    Result table should be 2 12 Active
    Result table should be 2 13 Rejected by admin

Check detail after approve
    Should be show 1969900134842 e-Doc ยกเลิกบริการ
    Result on table show ไม่พบข้อมูล