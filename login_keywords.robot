***Settings ***
Library    Selenium2Library

*** Keywords ***
Login with standard_user
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button

