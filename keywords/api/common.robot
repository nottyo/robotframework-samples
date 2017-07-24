*** Settings ***
Resource    ../../resources/imports.robot

*** Keywords ***
HTTP Response Status Code Should Be 200 OK
    [Documentation]    Check whether response status code is 200 OK
    Should Be Equal As Strings    ${response.status_code}    200