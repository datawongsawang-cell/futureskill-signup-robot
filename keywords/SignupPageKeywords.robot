*** Settings ***
Documentation    Page object: sign-up page (https://app.futureskill.co/register)
Library          SeleniumLibrary
Resource         CommonKeywords.robot


*** Variables ***
${SIGNUP_EMAIL}               name=email
${SIGNUP_FIRST_NAME}          name=firstName
${SIGNUP_LAST_NAME}           name=lastName
${SIGNUP_PHONE}               name=phoneNumber
${SIGNUP_PASSWORD}            name=newPassword
${SIGNUP_CONFIRM_PASSWORD}    name=confirmPassword
${SIGNUP_CONSENT}             name=consent
${SIGNUP_SUBMIT_BUTTON}       xpath=//button[@type="submit" and normalize-space()="สมัครสมาชิก"]


*** Keywords ***
user fill signup form
    [Arguments]    ${email}    ${first_name}    ${last_name}    ${phone}    ${password}
    CommonKeywords.Wait until element is ready then input text        ${SIGNUP_EMAIL}               ${email}
    CommonKeywords.Wait until element is ready then input text        ${SIGNUP_FIRST_NAME}          ${first_name}
    CommonKeywords.Wait until element is ready then input text        ${SIGNUP_LAST_NAME}           ${last_name}
    CommonKeywords.Wait until element is ready then input text        ${SIGNUP_PHONE}               ${phone}
    CommonKeywords.Wait until element is ready then input password    ${SIGNUP_PASSWORD}            ${password}
    CommonKeywords.Wait until element is ready then input password    ${SIGNUP_CONFIRM_PASSWORD}    ${password}
    CommonKeywords.Wait until element is ready then select checkbox   ${SIGNUP_CONSENT}

user click signup submit button
    CommonKeywords.Wait until element is ready then click element    ${SIGNUP_SUBMIT_BUTTON}
