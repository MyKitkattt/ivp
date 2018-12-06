*** Settings ***
Documentation       Negative case_Test attach file by type = pdf, gif, bmp, png, jpg, jpeg 
...                 but size more 5MB

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
Upload file copy identity id type pdf and size is notmatch
    Upload file identity id pdf_6mb.pdf
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload file copy identity id type gif and size is notmatch
    Upload file identity id gif_7mb.gif
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload file copy identity id type bmp and size is notmatch
    Upload file identity id bmp_8mb.bmp
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload file copy identity id type png and size is notmatch
    Upload file identity id png_16mb.png
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload file copy identity id type jpg and size is notmatch
    Upload file identity id jpg_6mb.jpg
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload file copy identity id type jpeg and size is notmatch
    Upload file identity id jpeg_13mb.jpeg
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload first additional type jpeg and size is notmatch
    Upload first additional jpeg_13mb.jpeg
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB

Upload second additional type jpeg and size is notmatch
    Upload second additional jpeg_13mb.jpeg
    Show popup msg ขนาดไฟล์สูงสุดที่สามารถอัพโหลดได้คือ 5 MB