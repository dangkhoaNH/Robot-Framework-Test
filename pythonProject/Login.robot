*** Settings ***
Library     Selenium2Library
Library    RequestsLibrary
Library    JSONLibrary

*** Variable ***
${Base_URL}    http://localhost:3000/login
${Welcome_URL}    http://localhost:3000/
${Browser}    Chrome
${DELAY}    0.5s
${VALID_USER}    adminuser
${VALID_PW}    admin
${EMPTY}

*** Keywords ***

Open Browser to login page
    Open Browser    ${Base_URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Open Brower to register page
    Open Browser    http://localhost:3000/register    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

*** Test Cases ***
TC_01 Valid Login

    Open Browser to login page
    Input Text     xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[1]/input   ${VALID_USER}
    Input Text     xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[2]/input    ${VALID_PW}
    Click Button    xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/button

    Close Browser

TC_02 Register
    
    Open Browser to register page
    
