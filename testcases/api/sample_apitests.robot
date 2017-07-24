*** Settings ***
Resource    ../../resources/imports.robot


*** Test Cases ***
TestGetUserInfoSuccess
    [Documentation]    Get GH Account Info
    When Get GitHub Account "nottyo" Info
    Then HTTP Response Status Code Should Be 200 OK
    And Response Body "url" Should Be "https://api.github.com/users/nottyo"
    And Response Body "location" Should Be "Bangkok, Thailand"