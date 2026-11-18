*** Settings ***
Documentation    Page object: OTP verification page shown after sign-up
Library          SeleniumLibrary
Resource         CommonKeywords.robot


*** Keywords ***
future skill should display OTP page with message "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}
    Capture Page Screenshot    otp_page.png
