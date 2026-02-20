*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Add multiple products
    Login to Saucedemo
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id=add-to-cart-sauce-labs-fleece-jacket
    Element Text Should Be    id=shopping_cart_container    4
    Click Element    //*[@id="shopping_cart_container"]/a
    Click Element    //*[@id="remove-sauce-labs-bike-light"]
    ${item_count} =    Get Element Count    //*[@class="cart_item"]
    Should Be Equal As Numbers    ${item_count}    3


*** Keywords ***
Login to Saucedemo
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button