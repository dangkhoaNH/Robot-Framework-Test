*** Settings ***
Resource        ../page/LoginPage.robot

*** Test Cases ***
TC01 - Login_TestSuccess
    Open Browser To Page
    Input Text            ${usernameInput}            adminuser
    Input Password        ${passwordInput}            admin
    Click Element         ${loginButton}
    Wait Until Location Is             ${home_url}
    Wait until element is visible      ${notifySuccess}
    Wait until element is visible      ${alertSuccess}\[contains(@class, 'Toastify__toast--success')]
    ${message}=  Get text  ${notifySuccess}
    Should be equal  ${message}  Success 
    Close Browser
TC02 - Login_TestFail-username+password
    Open Browser To Page
    Input Text            ${usernameInput}            abcdef
    Input Password        ${passwordInput}            123456
    Click Element         ${loginButton}
    Sleep    ${delay} 
    Wait until element is visible      ${notifyLogin}
    Wait until element is visible      ${alertLogin}\[contains(@class, 'Toastify__toast--error')]
    ${message}=  Get text  ${notifyLogin}
    Should be equal  ${message}  Please Enter valid username
    Close Browser

TC03 - Login_TestFail-username
    Open Browser To Page
    Input Text            ${usernameInput}            adminuser
    Input Password        ${passwordInput}            123456
    Click Element         ${loginButton}
    Sleep    ${delay} 
    Wait until element is visible      ${notifyLogin}
    Wait until element is visible      ${alertLogin}\[contains(@class, 'Toastify__toast--error')]
    ${message}=  Get text  ${notifyLogin}
    Should be equal  ${message}  Password is incorrect, please try again!
    Close Browser

TC04 - Register_OpenPage
    Open Browser To Page
    Click Element                    ${registerButton}
    Wait Until Location Is           ${register_url}
    Close Browser