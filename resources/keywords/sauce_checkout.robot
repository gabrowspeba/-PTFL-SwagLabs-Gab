*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this checkout.resource in loaded.
Library           SeleniumLibrary
Resource          ../../resources/variables/common_variables.robot

*** Keywords ***
Return to Product List
    Wait Until Element Is Enabled        locator=//*[@id="continue-shopping"]                                timeout=3s
    Click Button                         locator=//*[@id="continue-shopping"]
    
finish the buying process
    Click Element                    locator=//*[@id="shopping_cart_container"]
    Wait Until Element Is Enabled    locator=//*[@id="checkout"]
    Click Button                     locator=//*[@id="checkout"]
    Wait Until Element Is Enabled    locator=//*[@id="first-name"]
    Input Text                       locator=//*[@id="first-name"]     text=Gabriel
    Input Text                       locator=//*[@id="last-name"]      text=Barbosa
    Input Text                       locator=//*[@id="postal-code"]    text=1675
    Click Button                     locator=//*[@id="continue"]
    Wait Until Element Is Enabled    locator=//*[@id="finish"]
    Click Button                     locator=//*[@id="finish"]
    Page Should Contain              text=Thank you for your order!
    Log To Console                   message=Test completed with success :)