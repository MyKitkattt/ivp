*** Settings ***
Resource          common_variables.robot
Resource          db_keywords.robot
Library           Selenium2Library
Library           BuiltIn

*** Keywords ***
Open browser e-Document
    Open Browser        ${URL_E_DOC}      browser=chrome
    Set Window Size     1600        900
    Wait Until Page Contains        บริการรับเอกสารในรูปแบบอิเล็กทรอนิกส์ (e-Document)

Go to menu cancel for e-Document
    Click Element                   link-inquiry-register-status
    Wait Until Page Contains        ยกเลิกการรับบริการ e-Document
    Element Should Be Disabled      btn-verify

Select reference type ${citizen_type}
    Wait Until Element Is Visible       refType
    Select From List By Label           refType     ${citizen_type}

Fill in identity id ${ID}
    Wait Until Element Is Visible       refNo
    Input Text                          refNo       ${ID}

Click for cancel e document
    Wait Until Element Is Visible       btn-verify
    Element Should Be Enabled           btn-verify
    Click Element                       btn-verify

Click for submit cancel e document
    Element Should Be Enabled       btnSubmit
    Click Element                   btnSubmit

Should show popup message ${msg_popup}
    Wait for show data
    Wait Until Page Contains            ${msg_popup}
    Wait Until Element Is Visible       btnOk
    Click Element                       btnOk
    Wait for show data

Cancel e document for foreigner
    Select ref type Passport
    Fill in identity id 053644282
    Click for cancel e document
    Upload file identity id pdf_2mb.pdf
    Click for submit cancel e document
    Should show popup message Your request to cancel e-Document has been submitted.

Cancel e document
    Select reference type บัตรประชาชนในประเทศ
    Fill in identity id 1969900134842
    Click for cancel e document
    Upload file identity id pdf_2mb.pdf
    Click for submit cancel e document
    Should show popup message ท่านทำรายการแจ้งยกเลิกรับเอกสาร e-Document

Open admin login page
    Open Browser        ${URL_ADMIN}      browser=chrome
    Set Window Size     1600        900
    Wait Until Page Contains        Admin Login


Login with username "${username}"
    ${password}=    Set Variable If         '${username}'=='ityosapol'    Oct#2018!
    Wait Until Keyword Succeeds     5s      0.2s    Input Text          username        ${username}
    Wait Until Keyword Succeeds     5s      0.2s    Input Text          password        ${password}
    Wait Until Keyword Succeeds     5s      0.2s    Click Button        btnSubmit


Go to approve reject page
    Wait Until Element Is Visible       link-approve-reject
    Click Element                       link-approve-reject
    Wait Until Element Is Visible       date-from
    Element Text Should Be              date-from      ${EMPTY}
    Wait Until Element Is Visible       date-to
    Element Text Should Be              date-to      ${EMPTY}
    Wait Until Element Is Visible       refType
    Get Text                            refType
    Wait Until Element Is Visible       refNo
    Element Text Should Be              refNo               ${EMPTY}
    Wait Until Element Is Visible       first-name
    Element Text Should Be              first-name          ${EMPTY}
    Wait Until Element Is Visible       last-name
    Element Text Should Be              last-name           ${EMPTY}
    Wait Until Element Is Visible       select2-service-name-container
    Get Text                            select2-service-name-container
    Wait Until Element Is Visible       select2-txn-type-container
    Get Text                            select2-txn-type-container
    Wait Until Element Is Visible       btn-search
    Element Should Be Enabled           btn-search
    Wait Until Element Is Visible       btn-clear
    Element Should Be Enabled           btn-clear

Fill in card id on admin page ${ID_ADMIN}
    Wait Until Element Is Visible       refNo
    Input Text                          refNo       ${ID_ADMIN}

Choose service name container ${SERVICE_NAME_CONTAINER}
    Wait Until Element Is Visible       service-name
    Select From List By Label           service-name        ${SERVICE_NAME_CONTAINER}

Choose type container ${TYPE_CONTAINER}
    Wait Until Element Is Visible       txn-type
    Select From List By Label           txn-type            ${TYPE_CONTAINER}

Click search button
    Wait Until Element Is Visible       btn-search
    Element Should Be Enabled           btn-search
    Click Element                       btn-search

Wait for show data
    Sleep   2s

Should show data on table ${ROW} row only
    Wait for show data
    Wait Until Page Contains                            แสดงรายการที่
    Wait Until Element Is Visible                       css=#data-table tr:nth-child(${ROW})
    ${COUNT}=  Get Matching Xpath Count                 //*[@id="data-table"]/tbody/tr
    Should Be Equal                     ${COUNT}        ${ROW}

Card type should be ${REFERENCE_TYPE} ${TYPE_NAME}
    ${RESULT_REFERENCE_TYPE}            Get Text                       //*[@id="data-table"]/tbody/tr/td[3]
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[3]
    Should Be Equal                     ${REFERENCE_TYPE}        ${RESULT_REFERENCE_TYPE}

Identity id should be ${CARD_ID}
    ${RESULT_CARD_ID}=                  Get Text                        //*[@id="data-table"]/tbody/tr/td[4]
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[4]
    Should Be Equal                     ${RESULT_CARD_ID}                   ${CARD_ID}

Type container should be ${TYPE_CONTAINER}
    ${RESULT_TYPE_CONTAINER}=           Get Text                       //*[@id="data-table"]/tbody/tr/td[14]
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[14]
    Should Be Equal                     ${RESULT_TYPE_CONTAINER}            ${TYPE_CONTAINER}


Click view button for show attach file
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[10]/a
    Click Element       //*[@id="data-table"]/tbody/tr/td[10]/a
    Sleep   2s
    @{windows}=     List Windows                    #แยก list ของ windows
    ${numWindows}=  Get Length  ${windows}          #นับจำนวน windows
    ${indexLast}=   Evaluate    ${numWindows}-1     #เริ่มนับจาก 0 1 2
    Should Be True  ${numWindows} > 1
    Select Window  @{windows}[${indexLast}]
    Location Should Contain         blob:https://ivpdev.tsd.co.th
    Select Window                   title=Investor Portal

Click approve in table
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[2]/label
    Click Element                       //*[@id="data-table"]/tbody/tr/td[2]/label
    Wait Until Element Is Visible       btnSubmit
    Click Element                       btnSubmit

Result table should be ${ROW} ${COLUMN} ${DATA}
    Wait for show data
    Wait Until Page Contains            ผลการอนุมัติ/ปฏิเสธรายการ
    Wait Until Page Contains            แสดงรายการที่
    Table Cell Should Contain           data-table      ${ROW}  ${COLUMN}   ${DATA}

Should be show ${ID} ${SERVICE_NAME} ${TYPE_CONTAINER}
    Wait Until Element Is Visible       btnOk
    Click Element                       btnOk
    Wait Until Element Is Visible       refNo
    Wait Until Element Is Visible       service-name
    Wait Until Element Is Visible       txn-type
    Page Should Contain Textfield       refNo               ${ID}
    Element Should Contain              service-name        ${SERVICE_NAME}
    Element Should Contain              txn-type            ${TYPE_CONTAINER}

Result on table show ${message}
    Wait Until Page Contains            ${message}
    Page Should Contain Element         data-table       ${message}

Choose reason for reject ${REASON_FOR_REJECT}
    Wait for show data
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[24]/select
    Select From List By Label           //*[@id="data-table"]/tbody/tr/td[24]/select        ${REASON_FOR_REJECT}
    Wait Until Element Is Visible       btnSubmit
    Click Element                       btnSubmit

Click reject in table
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[23]/label
    Click Element                       //*[@id="data-table"]/tbody/tr/td[23]/label

Go to menu cancel e-Document for foreigner
    Wait Until Element Is Visible           langToggleBtn
    Click Element                           langToggleBtn
    Wait Until Page Contains                Electronic delivery of documents (e-Document)​ service
    Wait Until Element Is Visible           link-inquiry-register-status
    Click Element                           link-inquiry-register-status
    Wait Until Page Contains                Cancel for e-Document
    Wait Until Element Is Visible           refType

Select ref type ${ref_type}
    Select From List By Label               refType                         ${ref_type}
    Element Should Be Disabled              btn-verify


#Chk Validate
Check file type and size of copy file
    Fill in identity id 1969900134842
    Click for cancel e document

Upload file identity id ${copy_file_identity}
    Wait Until Element Is Visible       ref-document
    Choose File                         ref-document          ${EXECDIR}/file/${copy_file_identity}

Upload first additional ${copy_file_first}
    Wait Until Element Is Visible       first-additional-document
    Choose File                         first-additional-document          ${EXECDIR}/file/${copy_file_first}

Upload second additional ${copy_file_second}
    Focus                               second-additional-document
    Wait Until Element Is Visible       second-additional-document
    Choose File                         second-additional-document          ${EXECDIR}/file/${copy_file_second}

Show popup msg ${msg}
    Wait Until Page Contains            ${msg}
    Wait Until Element Is Visible       css=div.in button.btn-ivp-back
    Click Element                       css=div.in button.btn-ivp-back

Attach all file ${$gif_file}
    Wait Until Element Is Visible       ref-document
    Choose File                         ref-document          ${EXECDIR}/file/${$gif_file}
    Wait Until Element Is Visible       first-additional-document
    Choose File                         first-additional-document          ${EXECDIR}/file/${$gif_file}
    Wait Until Element Is Visible       second-additional-document
    Choose File                         second-additional-document          ${EXECDIR}/file/${$gif_file}

Delete attach file ${DELETE}
    Wait Until Element Is Visible       ${DELETE}
    Click Element                       ${DELETE}
    Wait Until Element Is Visible       ref-document
    Wait Until Element Is Visible       first-additional-document
    Wait Until Element Is Visible       second-additional-document
    Element Text Should Be              ref-document                    ${EMPTY}
    Element Text Should Be              first-additional-document       ${EMPTY}
    Element Text Should Be              second-additional-document      ${EMPTY}

Should show alert message ${ALERT}
    Wait Until Page Contains            ${ALERT}
    Element Should Be Disabled          btn-verify

Clear fill identity id
    Input Text      refNo           1
    Press Key       refNo           \\08

Should be enable submit button
    Wait Until Element Is Visible       btnSubmit
    Element Should Be Enabled           btnSubmit

Should be disable submit button
    Wait Until Element Is Visible       btnSubmit
    Element Should Be Disabled          btnSubmit


#Send Email
First name is ${first_name}
    ${result_first_name}=               Get Text        //*[@id="data-table"]/tbody/tr/td[6]
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[6]
    Should Be Equal                     ${first_name}                   ${result_first_name}

Last name is ${last_name}
    ${result_last_name}=               Get Text        //*[@id="data-table"]/tbody/tr/td[7]
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[7]
    Should Be Equal                     ${last_name}                    ${result_last_name}

Select check box for send email
    Wait for show data
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[17]/label
    Click Element                       //*[@id="data-table"]/tbody/tr/td[17]/label

Choose reason for send email ${reason_for_send_email}
    Wait for show data
    Wait Until Element Is Visible       //*[@id="data-table"]/tbody/tr/td[18]/select
    Select From List By Label           //*[@id="data-table"]/tbody/tr/td[18]/select        ${reason_for_send_email}
    Wait Until Element Is Visible       btnSubmit
    Click Element                       btnSubmit

Result after send email should be ${ROW} ${COLUMN} ${DATA} ${TITLE_NAME}
    Wait for show data
    Wait Until Page Contains            แสดงรายการที่
    Table Cell Should Contain           data-table      ${ROW}  ${COLUMN}   ${DATA}  ${TITLE_NAME}
