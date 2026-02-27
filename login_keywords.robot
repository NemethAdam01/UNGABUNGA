***Settings ***

*** Keywords ***
Login with standard_user
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button