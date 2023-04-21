*** Settings ***
Library        Selenium2Library

*** Variables ***
${base_url}              http://localhost:3000/login
${browser}               chrome
${second}                0.5s
${delay}                 2.5s
${usernameInput}         xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[1]/input
${passwordInput}         xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[2]/input
${loginButton}           xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/button
${registerButton}        xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/a
${notifyFail}            xpath://*[@id="root"]/div/div[1]/div/div/div[1]/div[2]
${alertFail}             xpath://*[@id="root"]/div/div[1]/div/div

*** Keywords ***
Open Browser To Page
    Open Browser              ${base_url}        ${browser}
    Maximize Browser Window
    Set Selenium Speed        ${second}