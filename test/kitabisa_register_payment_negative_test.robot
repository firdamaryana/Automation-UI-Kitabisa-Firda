*** Settings ***
Documentation           Kitabisa Technical Test
Resource                ${EXECDIR}/keyword/kitabisa.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            kitabisa
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/kitabisa_register_payment_negative_test.csv
Test Template           Negative - Kitabisa Register Payment

*** Keywords ***
Negative - Kitabisa Register Payment
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
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN Display warning blank name                  ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN Display warning invalid name                ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN Display warning invalid name                ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='3'      THEN Display warning invalid name                ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='4'      THEN Display warning maximum character           ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='5'      THEN Display warning blank phone or email        ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='6'      THEN Display warning invalid phone or email      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='7'      THEN Display warning invalid phone or email      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='8'      THEN Display warning invalid phone or email      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='9'      THEN Display warning invalid phone or email      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='10'     THEN Display warning invalid phone or email      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='11'     THEN Display warning invalid phone or email      ${expected_display}
        Close Browser

*** Test Cases ***
${test_number}. Kitabisa Register Payment -${test_type}- ${test_desc}   ${full_name}  ${phone_or_email}  ${berdoa_donasi}  ${expected_display}