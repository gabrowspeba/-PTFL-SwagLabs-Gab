*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Variables defined here can be used where this common_variables.resource in loaded.

*** Variables ***
${SAUCE_URL}          https://www.saucedemo.com/
${SAUCE_INVENTORY}    https://www.saucedemo.com/inventory.html
${FAKER_API_URL}      https://fakerapi.it/api/v1/
${SERVE_REST_URL}     https://serverest.dev
${BROWSER}            chrome
${SAUCE_ID}           standard_user
${SAUCE_PWD}          secret_sauce