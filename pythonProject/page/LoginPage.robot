*** Settings ***
Resource        ../page/source.robot

*** Variables ***
${usernameInput}         xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[1]/input
${passwordInput}         xpath://*[@id="root"]/div/div[3]/div/form/div/div[2]/div[2]/input
${loginButton}           xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/button
${registerButton}        xpath://*[@id="root"]/div/div[3]/div/form/div/div[3]/a
${notifyLogin}           xpath://*[@id="root"]/div/div[1]/div/div/div[1]/div[2]
${alertLogin}            xpath://*[@id="root"]/div/div[1]/div/div
${notifySuccess}         xpath:/html/body/div/div/div[1]/div/div/div[1]/div[2]
${alertSuccess}          xpath:/html/body/div/div/div[1]/div/div