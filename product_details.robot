*** Settings ***
Library    Selenium2Library
Library    Collections        
Resource    login_keywords.robot

*** Test Cases ***
termek adatainak ellenorzese kep alapjan
    Login with standard_user
    Click Element    //*[@id="item_4_img_link"]/img
    ${product_name}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Should Be Equal As Strings    ${product_name}    Sauce Labs Backpack
    ${product_price} =    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    Should Be Equal As Strings    ${product_price}    $29.99
    Sleep    1s
    Page Should Contain Element   //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Page Should Contain Image    //*[@id="inventory_item_container"]/div/div/div[1]/img
    Click Element    //*[@id="back-to-products"]

termek adatainak ellenorzese szoveg alapjan
    Login with standard_user
    Click Element    //*[@id="item_4_title_link"]/div
    ${product_name}=    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Should Be Equal As Strings    ${product_name}    Sauce Labs Backpack
    ${product_price} =    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    Should Be Equal As Strings    ${product_price}    $29.99
    Sleep    1s
    Page Should Contain Element   //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    Sleep    1s
    Page Should Contain Image    //*[@id="inventory_item_container"]/div/div/div[1]/img