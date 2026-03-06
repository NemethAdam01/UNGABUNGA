*** Settings ***
Library    Selenium2Library
Library    Collections        
Resource    login_keywords.robot

*** Test Cases ***
Checkout process validation
    Login with standard_user
    Click Element    //*[@id="shopping_cart_container"]
    Click Element    //*[@id="checkout"]
    Page Should Contain Element    //*[@id="first-name"]
    Page Should Contain Element    //*[@id="last-name"]
    Page Should Contain Element    //*[@id="postal-code"]

Checkout process validation incorrect data
    Login with standard_user
    Click Element    //*[@id="shopping_cart_container"]
    Click Element    //*[@id="checkout"]
    Page Should Contain Element    //*[@id="first-name"]
    Page Should Contain Element    //*[@id="last-name"]
    Page Should Contain Element    //*[@id="postal-code"]
     ${long_name}=    Evaluate    "A" * 100
    Input Text    //*[@id="first-name"]    ${long_name}
    Input Text    //*[@id="last-name"]    @*?#~
    Input Text    //*[@id="postal-code"]    1234
    Click Element    //*[@id="continue"]
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3
