*** Settings ***
Library        Selenium2Library

*** Variables ***
${base_url}         http://localhost:3000/login
${browser}           chrome
${second}            0.5s
${delay}            2.5s

*** Keywords ***
Open Browser To Page
    Open Browser        ${base_url}        ${browser}
    Maximize Browser Window
    Set Selenium Speed        ${second}