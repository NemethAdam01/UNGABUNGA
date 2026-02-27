*** Settings ***
Library    Selenium2Library
Library    Collections        
Resource    login_keywords.robot

*** Test Cases ***
Sort products price low to high
    Login with standard_user
    Click Element   class:product_sort_container
    Click Element   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${product_prices}=    Get all products
    verify price low to high sorting    ${product_prices}

Sort products price high to low
    Login with standard_user
    Click Element   class:product_sort_container
    Click Element   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${product_prices}=    Get all products
    verify price high to low sorting    ${product_prices}

*** Keywords ***
Get all products
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_price
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name.replace('$', '')}
    END
    RETURN    ${products}

verify price low to high sorting
    [Arguments]    ${product_prices}
    ${length}=    Get Length    ${product_prices}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}=    Get From List    ${product_prices}    ${index}
        ${next}=    Get From List    ${product_prices}    ${index+1}
        Should Be True    (${current}) <= (${next})    Products are not sorted low to high at index ${index}
    END

verify price high to low sorting
    [Arguments]    ${product_prices}
    ${length}=    Get Length    ${product_prices}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}=    Get From List    ${product_prices}    ${index}
        ${next}=    Get From List    ${product_prices}    ${index+1}
        Should Be True    (${current}) >= (${next})    Products are not sorted high to low at index ${index}
    END