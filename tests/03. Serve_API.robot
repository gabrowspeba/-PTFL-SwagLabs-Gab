*** Settings ***
Library         RequestsLibrary
Resource        ../resources/variables/common_variables.robot
Resource        ../resources/keywords/common.robot



*** Test Cases ***
Create New User POST
    Create Session    alias=server_rest    url=https://serverest.dev
    
    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    POST On Session    alias=server_rest    url=/usuarios    expected_status=201    headers=${header}    data= { "nome": "Gab APIT", "email": "apitestubg@qa4.com.br", "password": "tst321", "administrador": "true"}

    Log    ${response.json()}    console=True

Read User Data GET
    Create Session    alias=server_rest    url=https://serverest.dev
    
    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    POST On Session    alias=server_rest    url=/usuarios?_id=uGA4l1MlOwDKA1Fn    expected_status=200    headers=${header}    data= { "_id": "uGA4l1MlOwDKA1Fn"}

    Log    ${response.json()}    console=True

Update User Data PUT
    Create Session    alias=server_rest    url=https://serverest.dev
    
    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    PUT On Session    alias=server_rest    url=/usuarios/uGA4l1MlOwDKA1Fn    expected_status=200    headers=${header}    data= { "nome": "Gab 1API Changed", "email": "beltrano@qa4.com.br", "password": "tst321", "administrador": "true"}

    Log To Console    ${response.json()}

Delete User DELETE
    Create Session    alias=server_rest    url=https://serverest.dev
    
    ${header}    Create Dictionary    Content-Type=application/json
    
    ${response}    PUT On Session    alias=server_rest    url=/usuarios/uGA4l1MlOwDKA1Fn    expected_status=200

    Log To Console    ${response.json()}