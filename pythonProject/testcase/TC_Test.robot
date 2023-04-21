*** Settings ***
Library    Selenium2Library
Library    Process

*** Variables ***
${LOGIN_PAGE_URL}      http://localhost:3000/login
${MAIN_PAGE_URL}       http://localhost:3000/

${VALID_USERNAME}      adminuser
${VALID_PASSWORD}      admin

${INVALID_USERNAME}    admin00
${INVALID_PASSWORD}    admin001

${Browser}     Chrome
${DELAY}       0.5s

*** Keywords ***
Open Browser To Loginpage
    Open Browser            ${LOGIN_PAGE_URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}

*** Test Cases ***
Valid Login
    Open Browser To Loginpage
    Input Text                  xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[1]/input    ${VALID_USERNAME}
    Input Text                  xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[2]/input    ${VALID_PASSWORD}
    Click Button                id=btn-login
    Location Should Be          ${MAIN_PAGE_URL}
    Title Should Be             React App
    Close Browser

Valid Register User
    Open Browser To Loginpage
    Click Link                  class=btn-success
    Input Text                  css:input[placeholder="Username"]    admin03
    Input Text                  css:input[placeholder="FullName"]    Quoc Phu
    Input Text                  css:input[placeholder="Password"]    admin03
    Input Text                  css:input[placeholder="Email"]       phu@gmail.com
    Input Text                  css:input[placeholder="Phone"]       0977034669
    Click Button                class=btn-primary
    Location Should Be          ${LOGIN_PAGE_URL}
    Title Should Be             React App
    Close Browser
    