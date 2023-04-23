*** Settings ***
Library        Selenium2Library

*** Variables ***
${base_url}              http://localhost:3000/login
${browser}               chrome
${second}                1s
${delay}                 2s
${register_url}          http://localhost:3000/register
${home_url}              http://localhost:3000/

*** Keywords ***
Open Browser To LoginPage
    Open Browser              ${base_url}        ${browser}
    Maximize Browser Window
    Set Selenium Speed        ${second}