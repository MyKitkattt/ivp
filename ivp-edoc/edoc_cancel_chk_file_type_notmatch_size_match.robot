*** Settings ***
Documentation       Negative case_Test attach file by type doc , txt
...                 but size less then 5MB

Library             Selenium2Library

Resource            edoc_admin_keyword.robot
Resource            db_keywords.robot
Resource            common_variables.robot

Suite Setup         Run Keywords        Rollback Cancel e-doc       AND
                    ...                 Open browser e-Document     AND
                    ...                 Go to menu cancel for e-Document    AND
                    ...                 Check file type and size of copy file
Suite Teardown      Close All Browsers

*** Test Case ***
Upload file copy identity id type pdf and size is match
    Upload file identity id test_word.doc
    Show popup msg อัพโหลดได้เฉพาะไฟล์ .pdf, .gif, .bmp, .png, .jpg, .jpeg กรุณาอัพโหลดใหม่อีกครั้ง

Upload file copy identity id type txt and size is match
    Upload file identity id file_text.txt
    Show popup msg อัพโหลดได้เฉพาะไฟล์ .pdf, .gif, .bmp, .png, .jpg, .jpeg กรุณาอัพโหลดใหม่อีกครั้ง

Upload first additional type doc and size is match
    Upload first additional test_word.doc
    Show popup msg อัพโหลดได้เฉพาะไฟล์ .pdf, .gif, .bmp, .png, .jpg, .jpeg กรุณาอัพโหลดใหม่อีกครั้ง

Upload second additional type txt and size is match
    Upload second additional file_text.txt
    Show popup msg อัพโหลดได้เฉพาะไฟล์ .pdf, .gif, .bmp, .png, .jpg, .jpeg กรุณาอัพโหลดใหม่อีกครั้ง