*** Settings ***
Documentation     Class Project: sign up to Future Skill (Page Object version)
Library           SeleniumLibrary
Library           DateTime
Resource          ../keywords/HomePageKeywords.robot
Resource          ../keywords/SignupPageKeywords.robot
Resource          ../keywords/OtpPageKeywords.robot
Variables         ../resources/config/config.yaml
Variables         ../resources/testdata/testdata.yaml
Suite Setup       Open Browser    ${baseUrl}    ${browser}
Suite Teardown    Close Browser


*** Test Cases ***
As a new user, I want to sign up and see the OTP page
    [Setup]    Prepare unique sign-up data
    Given user open future skill website
    When user click signup button on home page
    And user fill signup form    ${new_email}    ${first_name}    ${last_name}    ${phone}    ${password}
    And user click signup submit button
    Then future skill should display OTP page with message "${otp_message}"


*** Keywords ***
Prepare unique sign-up data
    Should Not Contain    ${phone}    X    msg=Set your own phone number in testdata.yaml or run with -v phone:08xxxxxxxx
    ${epoch}=    Get Current Date    result_format=epoch    exclude_millis=True
    VAR    ${new_email}    ${email_user}+${epoch}@${email_domain}    scope=TEST
