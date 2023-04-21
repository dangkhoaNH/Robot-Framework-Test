*** Settings ***
Resource        ../page/LoginPage.robot

*** Test Cases ***
TC01 - Login_TestSuccess
    Open Browser To Page
    Input Text            ${usernameInput}            adminuser
    Input Password        ${passwordInput}            admin
    Click Element         ${loginButton}
    Sleep    ${delay} 
    Close Browser
TC02 - Login_TestFail
    Open Browser To Page
    Input Text            ${usernameInput}            abcdef
    Input Password        ${passwordInput}            123456
    Click Element         ${loginButton}
    Sleep    ${delay} 
    Wait until element is visible      ${notifyFail}
    Wait until element is visible      ${alertFail}\[contains(@class, 'Toastify__toast--error')]
    ${message}=  Get text  ${notifyFail}
    Should be equal  ${message}  Please Enter valid username
    Close Browser

TC03 - Register_OpenPage
    Open Browser To Page
    Click Element         ${registerButton}
    Close Browser