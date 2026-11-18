*** Settings ***
Documentation    Page object: Future Skill home page (https://futureskill.co)
Library          SeleniumLibrary
Resource         CommonKeywords.robot


*** Variables ***
${HOME_SIGNUP_BUTTON}    xpath=//button[normalize-space()="สมัครสมาชิก"]


*** Keywords ***
user open future skill website
    Go To    ${baseUrl}
    Maximize Browser Window

user click signup button on home page
    CommonKeywords.Wait until element is ready then click element    ${HOME_SIGNUP_BUTTON}
