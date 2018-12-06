*** Settings ***
Documentation       Positive case_Test upload attach file after fill in identity 
...                 attach file by type = pdf, gif, bmp, png, jpg, jpeg 
...                 and size less then 5MB

Resource            edoc_admin_keyword.robot
Resource            db_keywords.robot
Resource            common_variables.robot

Library             Selenium2Library

Suite Setup         Run Keywords        Rollback Cancel e-doc       AND
                    ...                 Open browser e-Document     AND
                    ...                 Go to menu cancel for e-Document    AND
                    ...                 Check file type and size of copy file
Suite Teardown      Close All Browsers


*** Test Case ***
Upload file copy identity id type pdf and size is match
    Upload file identity id pdf_2mb.pdf
    Delete attach file ${DEL_ID_CARD}

Upload file copy identity id type gif and size is match
    Upload file identity id gif_1mb.gif
    Delete attach file ${DEL_ID_CARD}

Upload file copy identity id type bmp and size is match
    Upload file identity id bmp_1mb.png
    Delete attach file ${DEL_ID_CARD}

Upload file copy identity id type png and size is match
    Upload file identity id png_3mb.png
    Delete attach file ${DEL_ID_CARD}

Upload file copy identity id type jpg and size is match
    Upload file identity id jpg_1mb.jpg
    Delete attach file ${DEL_ID_CARD}

Upload file copy identity id type jpeg and size is match
    Upload file identity id jpeg_1mb.jpeg
    Delete attach file ${DEL_ID_CARD}

Upload file first additional
    Upload first additional gif_1mb.gif
    Delete attach file ${DEL_FIRST_ADD}

Upload file second additional
    Upload second additional gif_1mb.gif
    Delete attach file ${DEL_SECOND_ADD}

Upload file copy identity id and first additional
    Upload file identity id pdf_2mb.pdf
    Delete attach file ${DEL_ID_CARD}
    Upload first additional gif_1mb.gif
    Delete attach file ${DEL_FIRST_ADD}

Upload file copy identity id and second additional
    Upload file identity id pdf_2mb.pdf
    Delete attach file ${DEL_ID_CARD}
    Upload second additional gif_1mb.gif
    Delete attach file ${DEL_SECOND_ADD}

Upload file copy identity id first and second additional
    Upload file identity id pdf_2mb.pdf
    Delete attach file ${DEL_ID_CARD}
    Upload first additional jpg_1mb.jpg
    Delete attach file ${DEL_FIRST_ADD}
    Upload second additional gif_1mb.gif
    Delete attach file ${DEL_SECOND_ADD}