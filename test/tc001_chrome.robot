*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://demo.nopcommerce.com/
${OPTIONS}        add_argument("--headless")



*** Test Cases ***
LoginTest
    Open Browser    ${URL}    chrome    options=${OPTIONS}
    Click Link    xpath://a[contains(text(),'Log in')]
    Sleep    1S
    Input Text    id=Email    pavanoltraining@gmail.com
    Sleep    1S
    Input Text    id=Password    Test@123
    Sleep    1S
    Click Button    xpath://button[contains(text(),'Log in')]  
    Sleep    1S      
    Page Should Contain    text=Login was unsuccessful. Please correct the errors and try again.
    Sleep    1s
    Close Browser    

