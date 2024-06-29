*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this common.resource in loaded.
Library           SeleniumLibrary
Resource          ../../resources/variables/common_variables.robot

*** Keywords ***
Teardown Test
    [Documentation]    Close all browsers after each test run
    Close All Browsers

Open Browser to Login Page
    Open Browser                     ${SAUCE_URL}    ${BROWSER}
    Maximize Browser Window

Make Login Successfully
    Wait Until Element Is Enabled    locator=//*[@id="user-name"]    timeout=3s
    Input Text                       locator=user-name               text=${SAUCE_ID}
    Input Password                   locator=//*[@id="password"]     password=${SAUCE_PWD}
    Click Button                     locator=//*[@id="login-button"]

Input Wrong Credentials
    Wait Until Element Is Enabled    locator=//*[@id="user-name"]    timeout=3s
    Input Text                       locator=user-name               text=${SAUCE_ID}
    Input Password                   locator=//*[@id="password"]     password=1234556
    Click Button                     locator=//*[@id="login-button"]

#Gherkin syntax | Given step
that User login successfully
    Open Browser to Login Page
    Make Login Successfully
    
#Gherkin syntax | When step
on the Product Page
    Location Should Be    ${SAUCE_INVENTORY}
    Title Should Be    Swag Labs

#Gherkin syntax | Negative Given step
that User have wrong credentials
    Open Browser to Login Page
    Input Wrong Credentials

#Gherkin syntax | Negative When step
gets login error
    Wait Until Element Is Visible    locator=//*[@class="error-button"]
    Element Should Be Visible        locator=//*[text()='Epic sadface: Username and password do not match any user in this service']
    Log To Console                   message=Negative test ok
    
