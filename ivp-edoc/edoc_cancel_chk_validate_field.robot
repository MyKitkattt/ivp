*** Settings ***
Documentation       Test for check validate field

Resource            edoc_admin_keyword.robot
Resource            db_keywords.robot
Resource            common_variables.robot

Library             Selenium2Library

Suite Setup         Run Keywords        Open browser e-Document             AND
                    ...                 Go to menu cancel for e-Document    AND
                    ...                 Check file type and size of copy file
Suite Teardown     Close All Browsers


*** Test Case ***
Upload file copy identity id only
    Upload file identity id jpg_1mb.jpg
    Should be enable submit button
    Delete attach file ${DEL_ID_CARD}
    Should be disable submit button

Upload file first additional only
    Upload first additional jpg_1mb.jpg
    Should be disable submit button
    Delete attach file ${DEL_FIRST_ADD}
    Should be disable submit button

Upload file second additional only
    Upload second additional jpg_1mb.jpg
    Should be disable submit button
    Delete attach file ${DEL_SECOND_ADD}
    Should be disable submit button

Upload file copy identity id and first additional
    Upload file identity id jpg_1mb.jpg
    Upload first additional jpg_1mb.jpg
    Should be enable submit button
    Delete attach file ${DEL_ID_CARD}
    Delete attach file ${DEL_FIRST_ADD}
    Should be disable submit button

Upload file copy identity id and second additional
    Upload file identity id jpg_1mb.jpg
    Upload second additional jpg_1mb.jpg
    Should be enable submit button
    Delete attach file ${DEL_ID_CARD}
    Delete attach file ${DEL_SECOND_ADD}
    Should be disable submit button

Upload file first and second additional
    Upload first additional jpg_1mb.jpg
    Upload second additional jpg_1mb.jpg
    Should be disable submit button
    Delete attach file ${DEL_FIRST_ADD}
    Delete attach file ${DEL_SECOND_ADD}
    Should be disable submit button