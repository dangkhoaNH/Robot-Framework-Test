*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${API_Base_EndPoint}  http://localhost:8000/employee

*** Test Cases ***
TC_01_Get Employee Request
    Create Session         API_Testing             ${API_Base_EndPoint}
    ${Get_Response}        GET On Session          API_Testing                 /1
    ${json_response}       Set Variable            ${Get_Response.json()}
    Log To Console         ${json_response}
    Log To Console         ${Get_Response.status_code}

TC_02_Get All Employee Request
    Create Session     API_Testing     ${API_Base_EndPoint}
    ${Get_Response}    GET On Session  API_Testing             /
    ${json_response}   Set Variable    ${Get_Response.json()}
    Log To Console     ${json_response}
    Log To Console     ${Get_Response.status_code}

TC_03_Add New Employee Request
    ${body}            Create Dictionary    name=Hoang Minh    email=minh@gmail.com    phone=0388888824
    ${header}          Create Dictionary    Content-Type=application/json
    Create session     employee   ${API_Base_EndPoint}    headers=${header}
    ${response}        Post On Session    employee     /       json=${body}
    Log To Console     ${response.status_code}
    Log To Console     ${response.json()}

TC_04_Delete Employee Request
    Create session     employee   ${API_Base_EndPoint}
    ${response}        Delete On Session    employee    /8
    Status Should Be   OK    ${response}
    Log To Console    ${response.status_code}

TC_05_Update Employee Request
    Create session     employee   ${API_Base_EndPoint}
    ${body}    Create Dictionary    name=Nguyen Hoang Minh    email=hoangminh@gmail.com    phone=03888881412
    ${resp}    PUT On Session    employee     /8    json=${body}
    Log To Console    ${resp.json()}
    Log To Console    ${resp.status_code}