*** Settings ***
Resource            edoc_admin_keyword.robot
Library             Selenium2Library

Suite Setup         Run Keywords        Open admin login page               AND
                    ...                 Login with username "ityosapol"    AND
                    ...                 Go to approve reject page
# Suite Teardown              Close All Browsers


*** Test Case ***
Search data of member
    Fill in identity id 1100900016075
    Click search button

Should show data of inquiry is correctly
    Should show data on table 1 row only
    Card type should be 0 (บัตรประชาชน)
    Identity id should be 1100900016075
    First name is ทดสอบ
    Last name is ส่งเมลตามเอกสาร
    Select check box for send email
    Choose reason for send email ไฟล์ภาพเอกสารที่ท่านแนบมาไม่สามารถเปิดได้
    Should show popup message ส่ง Mail 1 รายการ

Check result transaction on the table
    Click search button
    Result after send email should be 2 3 0 (บัตรประชาชน)
    Result after send email should be 2 4 1100900016075 (เลขที่บัตรประชาชน)
    Result after send email should be 2 6 ทดสอบ (ชื่อ)
    Result after send email should be 2 7 ส่งเมลตามเอกสาร (นามสกุล)
    Result after send email should be 2 19 ไฟล์ภาพเอกสารที่ท่านแนบมาไม่สามารถเปิดได้ (เหตุผลการส่งอีเมล์)

Recheck choose reason for send email again
    Select check box for send email
    Choose reason for send email ท่านยังไม่บรรลุนิติภาวะ กรุณาแนบเอกสารสำเนาบัตรประชาชนบิดาและมารดา
    Should show popup message ส่ง Mail 1 รายการ

Recheck result transaction on the table again
    Click search button
    Result after send email should be 2 3 0 (บัตรประชาชน)
    Result after send email should be 2 4 1100900016075 (เลขที่บัตรประชาชน)
    Result after send email should be 2 6 ทดสอบ (ชื่อ)
    Result after send email should be 2 7 ส่งเมลตามเอกสาร (นามสกุล)
    Result after send email should be 2 19 กรุณาแนบเอกสารสำเนาบัตรประชาชนบิดาและมารดา (เหตุผลการส่งอีเมล์)
