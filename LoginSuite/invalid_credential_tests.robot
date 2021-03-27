*** Settings ***
Documentation    This file test the invalid credentail error details 

Resource    ../Resource/Base/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource  

Test Setup    Launch_Browser
Test Teardown    End_Browser

Library    DataDriver    file=../testdata/openemr.xlsx    sheet_name=Invalid_Credential_Template

Test Template    Invalid_Credential_Template

*** Test Cases ***
TC1 

*** Keywords ***
Invalid_Credential_Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedvalue}
    Enter_Username    ${username}   
    Enter_Password    ${password}   
    Select_Language_Using_Label      ${language}          
    Click_Login
    Validate_Error_Message    ${expectedvalue}