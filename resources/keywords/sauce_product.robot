*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this product.resource in loaded.
Library           SeleniumLibrary
Resource          ../../resources/variables/common_variables.robot
Resource          ../../resources/keywords/sauce_checkout.robot

*** Keywords ***
add a ${product} to the cart
    IF  '${product}'=='Backpack'
        Wait Until Element Is Enabled    locator=//*[@id="add-to-cart-sauce-labs-backpack"]                  timeout=3s
        Click Button                     locator=//*[@id="add-to-cart-sauce-labs-backpack"]
    ELSE IF    '${product}'=='Bike Light'
        Wait Until Element Is Enabled    locator=//*[@id="add-to-cart-sauce-labs-bike-light"]                timeout=3s
        Click Button                     locator=//*[@id="add-to-cart-sauce-labs-bike-light"]
    ELSE IF    '${product}'=='Bolt T-Shirt'
        Wait Until Element Is Enabled    locator=//*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]              timeout=3s
        Click Button                     locator=//*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ELSE IF    '${product}'=='Fleece Jacket'
        Wait Until Element Is Enabled    locator=//*[@id="add-to-cart-sauce-labs-fleece-jacket"]             timeout=3s
        Click Button                     locator=//*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ELSE IF    '${product}'=='Onesie'
        Wait Until Element Is Enabled    locator=//*[@id="add-to-cart-sauce-labs-onesie"]                    timeout=3s
        Click Button                     locator=//*[@id="add-to-cart-sauce-labs-onesie"]
    ELSE IF    '${product}'=='T-Shirt Red'
        Wait Until Element Is Enabled    locator=//*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]    timeout=3s
        Click Button                     locator=//*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ELSE
        Log To Console                   message=Wrong product name
        Fail
    END