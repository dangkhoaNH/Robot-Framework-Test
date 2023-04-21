*** Settings ***

Library     Selenium2Library
Library    RequestsLibrary
Library    JSONLibrary 


*** Variable *** 

${Base_URL}     http://localhost:3000/login
${Res_URL}    http://localhost:3000/register
${Browser}    Chrome
${DELAY}    0.5s
${VALID_USER}    adminuser
${VALID_PW}    admin
${EMPTY}     

*** Keywords ***
Open Browser to login page
    Open Browser  ${Base_URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed     ${DELAY}
    
*** Test Cases ***

Valid Signup
    Open Browser to login page
    Click Link    xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/a
    Location Should Be    ${Res_URL}
    Input Text    xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div/div[1]/div/input    friday
    Input Text    xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div/div[2]/div/input    123456
    Input Text    xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div/div[3]/div/input    Weekend
    Input Text    xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div/div[4]/div/input    fridaymode@gmail.com
    Input Text    xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div/div[5]/div/input    0909012332
    
    Click button    xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/button
    Input Text     xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[1]/input     friday
    Input Text     xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[2]/input     123456
    Click Button    xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/button
    #Location Should Be    ${WELCOME_URL}
    #Title Should Be    React App
    Sleep     1s
    Close Browser
    
    