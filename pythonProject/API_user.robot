*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary 
Library    Collections

*** Variables *** 
${API_Base_EndPoint}    http://localhost:8000/ 
${id_user}    adminuser

*** Test Cases *** 
TC_01_Get All User Request 

    Create Session    API_Testing    ${API_Base_EndPoint} 
    ${Get_Response}    GET On Session    API_Testing    /user 
    ${json_response}    Set Variable    ${Get_Response.json()} 
    Log To Console    ${json_response} 

TC_02_Get User Request

    Create Session    API_Testing    ${API_Base_EndPoint}
    ${Get_Response}    GET On Session    API_Testing    /user/${id_user}
    ${json_response}    Set Variable    ${Get_Response.json()}
    Log To Console    ${json_response}

TC_03_Delete User Request

    Create Session    API_Testing    ${API_Base_EndPoint}
    ${Get_Response}    DELETE On Session    API_Testing    /user/guest
    ${json_response}    Set Variable    ${Get_Response.json()}
    Log To Console    ${json_response}

TC_04_Post user request
    Create Session    API_Testing    ${API_Base_EndPoint}
    ${body}    create dictionary    id=guest    name=guest    password=123456    phone=0999676767    email=guest@gmail.com    role=user
    ${header}    create dictionary    Content-Type=application/json
    ${response}    POST On Session    API_Testing    /user    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

TC_05_Put user request
    Create Session    API_Testing    ${API_Base_EndPoint}
    ${body}    create dictionary    id=guest    name=guestuser    password=123456    phone=0999686868    email=guest@gmail.com    role=user
    ${header}    create dictionary    Content-Type=application/json
    ${response}    PUT On Session    API_Testing    /user/guest    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}