*** Settings ***
Documentation           Kitabisa Technical Test
Resource                ${EXECDIR}/keyword/kitabisa.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            kitabisa
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/kitabisa_process_donate_positive_test.csv
Test Template           Positive - Kitabisa Process Donate

*** Keywords ***
Positive - Kitabisa Process Donate
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${full_name}  ${phone_or_email}  ${notes_berdoa}  ${expected_display}
        GIVEN User open kitabisa
        AND User click campaign dana mendesak
        AND Verify after click campaign dana mendesak
        AND User click donasi sekarang button
        AND Verify after click donasi sekarang button
        AND User click donate 10000
        AND Verify after User click donate 10000
        AND User select BCA payment
        AND Verify after User select BCA payment
        WHEN User input full name phonsel or email and notes berdoa  ${full_name}  ${phone_or_email}  ${notes_berdoa}
        AND User click lanjut pembayaran button
        AND Verify after User click lanjut pembayaran button
        AND User click donasi ke penggalangan lain button
        AND Verify after User click donasi ke penggalangan lain button
        AND User click campaign dana mendesak
        AND Verify after click campaign dana mendesak
        AND User click back arrow button
        THEN User back to homepage
        Close Browser

*** Test Cases ***
${test_number}. Kitabisa Process Donate -${test_type}- ${test_desc}   ${full_name}  ${phone_or_email}  ${berdoa_donasi}  ${expected_display}