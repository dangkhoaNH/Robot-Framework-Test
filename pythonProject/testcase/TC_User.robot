*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${API_Base_EndPoint}  http://localhost:8000/user

*** Test Cases ***
TC_01_Get User Request
    Create Session         API_Testing             ${API_Base_EndPoint}
    ${Get_Response}        GET On Session          API_Testing                 /adminuser
    ${json_response}       Set Variable            ${Get_Response.json()}
    @{id_data}             Get Value From Json     ${json_response}            id
    ${id}                  Get From List           ${id_data}                   0
    Should Be Equal        ${id}                   adminuser

TC_02_Get All User Request
    Create Session     API_Testing     ${API_Base_EndPoint}
    ${Get_Response}    GET On Session  API_Testing             /
    ${json_response}   Set Variable    ${Get_Response.json()}
    Log To Console     ${json_response}
    Log To Console     ${Get_Response.status_code}

TC_03_Add New User Request
    ${body}            Create Dictionary   id=dangkhoa03   name=Dang Khoa    password=khoa123456    email=dkhoa@gmail.com    phone=0977034663    role=admin 
    ${header}          Create Dictionary   Content-Type=application/json
    Create session     user   ${API_Base_EndPoint}    headers=${header}
    ${response}        Post On Session    user     /       json=${body}
    Log To Console     ${response.status_code}
    Log To Console     ${response.json()}

TC_04_Delete User Request
    Create session     user   ${API_Base_EndPoint}
    ${response}        Delete On Session    user    /dangkhoa03
    Status Should Be   OK    ${response}
    Log To Console    ${response.status_code}

TC_05_Update Employee Request
    Create session     user   ${API_Base_EndPoint}
    ${body}            Create Dictionary             name=Nguyen Ho Dang Khoa   password=khoa123456    email=dkhoa@gmail.com    phone=0977034663    role=admin 
    ${resp}            PUT On Session       user     /dangkhoa03       json=${body}
    Log To Console     ${resp.json()}
    Log To Console     ${resp.status_code}