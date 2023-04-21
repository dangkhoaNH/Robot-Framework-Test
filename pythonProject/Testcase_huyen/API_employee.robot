*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary 
Library    Collections

*** Variables *** 
${API_Base_EndPoint}    http://localhost:8000/ 

*** Test Cases *** 
TC_01_Get All Employee Request 

    Create Session    API_Testing    ${API_Base_EndPoint} 
    ${Get_Response}    GET On Session    API_Testing    /Employee
    ${json_response}    Set Variable    ${Get_Response.json()} 
    Log To Console    ${json_response} 

TC_02_Get Employee Request

    Create Session    API_Testing    ${API_Base_EndPoint}
    ${Get_Response}    GET On Session    API_Testing    /employee/2
    ${json_response}    Set Variable    ${Get_Response.json()}
    Log To Console    ${json_response}

TC_03_Delete Employee Request

    Create Session    API_Testing    ${API_Base_EndPoint}
    ${Get_Response}    DELETE On Session    API_Testing    /employee/6
    ${json_response}    Set Variable    ${Get_Response.json()}
    Log To Console    ${json_response}

TC_04_Post Employee request
    Create Session    API_Testing    ${API_Base_EndPoint}
    ${body}    create dictionary    id=6    name=Emma    password=123456    email=emma@gmail.com    phone=0999676767    active=True
    ${header}    create dictionary    Content-Type=application/json
    ${response}    POST On Session    API_Testing    /employee    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

TC_05_Put Employee request
    Create Session    API_Testing    ${API_Base_EndPoint}
    ${body}    create dictionary    id=6    name=Emma Waston    password=123456    email=emmawaston@gmail.com    phone=0999676767    active=True
    ${header}    create dictionary    Content-Type=application/json
    ${response}    PUT On Session    API_Testing    /employee/6    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}