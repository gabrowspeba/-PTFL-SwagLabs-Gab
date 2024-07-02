*** Settings ***
Library         RequestsLibrary
Resource        ../resources/variables/common_variables.robot
Resource        ../resources/keywords/common.robot


*** Test Cases ***
TC01: Get User Information
    [Documentation]    Test to get user information
    Create Session    alias=faker    url=${FAKER_API_URL}
    ${response}    GET On Session   alias=faker    url=/users?_quantity=1    expected_status=200
    Log    ${response.json()}    console=True

    Delete All Sessions

TC02: Get Multiple Users
    [Documentation]    Test to get multiple users information
    Create Session    alias=faker    url=${FAKER_API_URL}
    ${response}    GET On Session   alias=faker    url=/users?_quantity=5    expected_status=200
    Log    ${response.json()}    console=True

    Delete All Sessions

TC03: Not Expected Status and Show Error Message
    [Documentation]    Test to get error message
    Create Session    alias=faker    url=${FAKER_API_URL}
    ${response}    GET On Session   alias=faker    url=/users?_quantity=1    expected_status=201    msg=## This message shows up when it fails ## ->
    Log    ${response.json()}    console=True

    Delete All Sessions
    
TC04: Test using IF ELSE
    [Documentation]    Test to get addresses information using IF ELSE
    Create Session    alias=faker    url=${FAKER_API_URL}
    ${response}    GET On Session   alias=faker    url=/addresses?_quantity=2    expected_status=200
    Log    ${response.json()['data'][1]['country']}    console=True

    ${var}    Set Variable    ${response.json()['data'][1]['country']}

    IF    '${var}'=='Brazil'
        Log To Console    We are in Brazil
    ELSE
        Log To Console    We are in ${var}
    END

    Delete All Sessions

TC05: Test using FOR
    [Documentation]    Test to get addresses information using FOR
    Create Session    alias=faker    url=${FAKER_API_URL}

    FOR  ${i}   IN RANGE    20
        
        ${response}    GET On Session   alias=faker    url=/addresses?_quantity=1    expected_status=200
        Log    ${response.json()['data'][0]['country']}    console=True
        ${var}    Set Variable    ${response.json()['data'][0]['country']}

        Exit For Loop If    '${var}'=='Brazil'
        Exit For Loop If    '${var}'=='Luxembourg'
        Exit For Loop If    '${var}'=='Ethiopia'
        Exit For Loop If    '${var}'=='Singapore'
        Exit For Loop If    '${var}'=='Fiji'
        Exit For Loop If    '${var}'=='American Samoa'
        Exit For Loop If    '${var}'=='Malawi'
        Exit For Loop If    '${var}'=='Cape Verde'
        Exit For Loop If    '${var}'=='Congo'
        Exit For Loop If    '${var}'=='Palau'
        Exit For Loop If    '${var}'=='Cameroon'
        Exit For Loop If    '${var}'=='Estonia'
        Exit For Loop If    '${var}'=='Tunisia'
        Exit For Loop If    '${var}'=='Portugal'
            
        Sleep    2s

    END
    
    Delete All Sessions

    IF  '${var}'=='Brazil'
        Log To Console    We are in Brazil
    ELSE
        Log To Console    We are in ${var}        
    END
    

    Log To Console    Went out loop with this country -> ${var}