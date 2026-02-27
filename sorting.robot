*** Settings ***
Library    Selenium2Library
Library    Collections        
Resource    login_keywords.robot

*** Test Cases ***
Sort products z-a
    Login with standard_user
    Click Element   class:product_sort_container
    Click Element   //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get all products
    Verify z-a sorting    ${product_names}

Sort products a-z
    Login with standard_user
    Click Element   class:product_sort_container
    Click Element   //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get all products
    Verify a-z sorting    ${product_names}

*** Keywords ***
Get all products
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    
        
    END
    RETURN    ${products}
  
Verify z-a sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}=    Get From List    ${product_names}    ${index}
        ${next}=    Get From List    ${product_names}    ${index+1}
        Should Be True    '${current}' >= '${next}'    Products are not sorted z-a at index ${index}
    END
    
Verify a-z sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE    0    ${length}-1
        ${current}=    Get From List    ${product_names}    ${index}
        ${next}=    Get From List    ${product_names}    ${index+1}
        Should Be True    '${current}' <= '${next}'    Products are not sorted a-z at index ${index}
    END
