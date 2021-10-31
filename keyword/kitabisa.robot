*** Settings ***
Documentation           Kitabisa Technical Test
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot

*** Variables ***
#dashboard kitabisa
${select_campaign}                   xpath=//img[@src='https://imgix.kitabisa.com/ab59e83f-32b7-4b2a-8e62-17aff0d3eab9.jpg?ar=16:9&w=280&auto=format,compress']
${lbl_dana_mendesak}                 xpath=//h3[@class='style__Title-sc-__sc-3hpau3-0 kIrIRk'][contains(text(),'Penggalangan Dana Mendesak')]
${menu_donasi}                       xpath=//div[@id='navbar_home']
${menu_donasi_saya}                  xpath=//div[@id='navbar_my-donations']
${menu_galang_dana}                  xpath=//div[@id='navbar_galang-dana']
${menu_inbox}                        xpath=//div[@id='navbar_inbox']
${menu_account}                      xpath=//div[@id='navbar_account']

#detail campaign page
${lbl_detail_dana_mendesak}          xpath=//h1[@class='style__Title-wl3991-5 gxoBYq line-clamp-2'][contains(text(),'Ikhtiar Nelayan Selamatkan Istri dari Tumor Rahim')]
${lbl_info_penggalangan_dana}        xpath=//h3[@class='style__SectionTitle-sc-__amr4kr-0 lkmiKJ'][contains(text(),'Informasi Penggalangan Dana')]
${btn_donasi_sekarang}               xpath=//button[@id='campaign-detail_button_donasi-sekarang']
${btn_back_arrow}                    xpath=//*[local-name()='svg' and @class='svg-inline--fa fa-arrow-left fa-w-14 ']

#nominal donation page
${lbl_masukkan_nominal}              xpath=//p[@class='style__DonationAmountTitle-tuwc7v-12 kLGwbQ'][contains(text(),'Masukkan Nominal ')]
${select_donate_10000}               xpath=//div[.='Rp 10.000Nominal minimal donasi']

#register payment page
${lbl_warning_blank_name}                 xpath=//span[@data-testid='labelInputError'][contains(text(),'Silakan isi nama lengkap kamu')]
${lbl_warning_invalid_name}               xpath=//span[.="Nama hanya boleh mengandung huruf, titik, spasi, dan tanda petik satu (')"]
${lbl_warning_maximum_character}          xpath=//span[@data-testid='labelInputError'][contains(text(),'Nama lengkap terlalu panjang (maksimal 70 karakter)')]
${lbl_warning_blank_phone_or_email}       xpath=//span[@data-testid='labelInputError'][contains(text(),'Silakan isi no. ponsel atau email kamu')]
${lbl_warning_invalid_phone_or_email}     xpath=//span[@data-testid='labelInputError'][contains(text(),'Silakan isi dengan ketentuan no. ponsel atau email yang benar')]
${select_bca}                             xpath=//span[.='BCA Virtual Account']
${txt_fullname}                           xpath=//input[@placeholder='Nama Lengkap']
${txt_phone_or_email}                     xpath=//input[@placeholder='Nomor Ponsel atau Email']
${txt_notes_berdoa}                       xpath=//textarea[@id='contribute-textarea-dua']
${btn_lanjut_pembayaran}                  xpath=//button[@id='contribute_button_lanjutkan-pembayaran']

#complete payment
${lbl_bca_virtual_account}                xpath=//strong[.='BCA Virtual Account']
${lbl_rp_10000}                           xpath=//span[@class='style__DonationAmount-sc-1hbhjng-5 boirhq'][contains(text(),'10.000')]
${lbl_instruksi_pembayaran}               xpath=//h2[@class='style__Title-sc-1hbhjng-1 gLKiSG'][contains(text(),'Instruksi Pembayaran')]
${btn_donasi_penggalangan_lain}           xpath=//button[@class='style__ButtonWrapper-sc-1dpwvg2-0 fPybEr']

*** Keywords ***
User open kitabisa
    SeleniumLibrary.Open Browser         https://kitabisa.com/       browser=Chrome
    Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_dana_mendesak}
    SeleniumLibrary.Wait Until Element Is Visible          ${select_campaign}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_donasi}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_donasi_saya}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_galang_dana}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_inbox}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_account}

User click campaign dana mendesak
    execute javascript      window.scrollTo(0,200)
    SeleniumLibrary.Click Element          ${select_campaign}

Verify after click campaign dana mendesak
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_detail_dana_mendesak}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_info_penggalangan_dana}
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_donasi_sekarang}

User click donasi sekarang button
    SeleniumLibrary.Click Button          ${btn_donasi_sekarang}

Verify after click donasi sekarang button
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_masukkan_nominal}
    SeleniumLibrary.Wait Until Element Is Visible          ${select_donate_10000}

User click donate 10000
    SeleniumLibrary.Click Element          ${select_donate_10000}

Verify after User click donate 10000
    SeleniumLibrary.Wait Until Element Is Visible          ${select_bca}

User select BCA payment
    SeleniumLibrary.Click Element          ${select_bca}

Verify after User select BCA payment
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_fullname}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_phone_or_email}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_notes_berdoa}

User input full name phonsel or email and notes berdoa
    [Arguments]         ${full_name}  ${phone_or_email}  ${notes_berdoa}
    Input full name             ${full_name}
    Input phonsel or email      ${phone_or_email}
    Input notes berdoa          ${notes_berdoa}

Input full name
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_fullname}         ${input}

Input phonsel or email
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_phone_or_email}   ${input}

Input notes berdoa
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_notes_berdoa}     ${input}

Display warning blank name
    [Arguments]         ${expected_display}
    Sleep               3s
    ${lbl_warning_blank_name_text}         SeleniumLibrary.Get Text       ${lbl_warning_blank_name}
    Should Be Equal As Strings    ${lbl_warning_blank_name_text}          ${expected_display}

Display warning invalid name
    [Arguments]         ${expected_display}
    Sleep               3s
    ${lbl_warning_invalid_name_text}         SeleniumLibrary.Get Text       ${lbl_warning_invalid_name}
    Should Be Equal As Strings    ${lbl_warning_invalid_name_text}          ${expected_display}

Display warning maximum character
    [Arguments]         ${expected_display}
    Sleep               3s
    ${lbl_warning_maximum_character_text}         SeleniumLibrary.Get Text       ${lbl_warning_maximum_character}
    Should Be Equal As Strings    ${lbl_warning_maximum_character_text}          ${expected_display}

Display warning blank phone or email
    [Arguments]         ${expected_display}
    Sleep               3s
    ${lbl_warning_blank_phone_or_email_text}         SeleniumLibrary.Get Text       ${lbl_warning_blank_phone_or_email}
    Should Be Equal As Strings    ${lbl_warning_blank_phone_or_email_text}          ${expected_display}

Display warning invalid phone or email
    [Arguments]         ${expected_display}
    Sleep               3s
    ${lbl_warning_invalid_phone_or_email_text}         SeleniumLibrary.Get Text       ${lbl_warning_invalid_phone_or_email}
    Should Be Equal As Strings    ${lbl_warning_invalid_phone_or_email_text}          ${expected_display}

User click lanjut pembayaran button
    SeleniumLibrary.Click Button          ${btn_lanjut_pembayaran}

Verify after User click lanjut pembayaran button
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_bca_virtual_account}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_rp_10000}
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_instruksi_pembayaran}
    SeleniumLibrary.Scroll Element Into View               ${btn_donasi_penggalangan_lain}

User click donasi ke penggalangan lain button
    SeleniumLibrary.Click Element          ${btn_donasi_penggalangan_lain}

Verify after User click donasi ke penggalangan lain button
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_dana_mendesak}
    SeleniumLibrary.Wait Until Element Is Visible          ${select_campaign}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_donasi}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_donasi_saya}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_galang_dana}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_inbox}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_account}

User click back arrow button
    SeleniumLibrary.Click Element        ${btn_back_arrow}

User back to homepage
    SeleniumLibrary.Wait Until Element Is Visible          ${lbl_dana_mendesak}
    SeleniumLibrary.Wait Until Element Is Visible          ${select_campaign}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_donasi}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_donasi_saya}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_galang_dana}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_inbox}
    SeleniumLibrary.Wait Until Element Is Visible          ${menu_account}
