*** Settings ***
Documentation     Sign up to Future Skill and check the OTP page.
...               First version: every step and locator is written inside the test case.
Library           SeleniumLibrary
Library           DateTime
Variables         ../resources/config/config.yaml
Variables         ../resources/testdata/testdata.yaml
Suite Setup       Open Browser    ${baseUrl}    ${browser}
Suite Teardown    Close Browser


*** Test Cases ***
As a new user, I want to sign up and see the OTP page
    Should Not Contain    ${phone}    X    msg=Set your own phone number in testdata.yaml or run with -v phone:08xxxxxxxx
    ${epoch}=    Get Current Date    result_format=epoch    exclude_millis=True
    ${email}=    Set Variable    ${email_user}+${epoch}@${email_domain}

    # Step 1: open Future Skill
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//button[normalize-space()="สมัครสมาชิก"]    15s

    # Step 2: click "สมัครสมาชิก"
    Click Element    xpath=//button[normalize-space()="สมัครสมาชิก"]

    # Step 3: fill in the sign-up form
    Wait Until Element Is Visible    name=email    15s
    Input Text        name=email              ${email}
    Input Text        name=firstName          ${first_name}
    Input Text        name=lastName           ${last_name}
    Input Text        name=phoneNumber        ${phone}
    Input Password    name=newPassword        ${password}
    Input Password    name=confirmPassword    ${password}
    Select Checkbox   name=consent

    # Step 4: click "สมัครสมาชิก" to submit
    Click Element    xpath=//button[@type="submit" and normalize-space()="สมัครสมาชิก"]

    # Step 5: the OTP page shows the message
    Wait Until Page Contains    ${otp_message}    20s
    Capture Page Screenshot    otp_page.png
