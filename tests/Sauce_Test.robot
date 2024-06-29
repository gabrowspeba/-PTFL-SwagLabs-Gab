*** Settings ***
Documentation     This file contains all test cases for this project
Suite Teardown    Teardown Test
Library           SeleniumLibrary
Resource          ../resources/variables/common_variables.robot
Resource          ../resources/keywords/common.robot
Resource          ../resources/keywords/sauce_checkout.robot
Resource          ../resources/keywords/sauce_product.robot



*** Test Cases ***
TC01: Validate Success in Purchasing Process
    [Tags]    smoke
    Given that User login successfully
    When on the Product Page
    #Products Available: Backpack, Bike Light, Bolt T-Shirt, Fleece Jacket, Onesie or T-Shirt Red
    And add a Backpack to the cart
    Then finish the buying process

TC02: Validate Error Message when Using Wrong Credentials
    [Tags]    negative
    Given that User have wrong credentials
    When gets login error
    Then Close Browser
