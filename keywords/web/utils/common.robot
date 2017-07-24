*** Settings ***
Resource    ../../../resources/imports.robot

*** Keywords ***
I Open My GitHub URL "${url}" With Browser "${browser}"
    [Documentation]    Open GitHub URL with specified browser
    Open Browser    ${url}    browser=${browser}
    Maximize Browser Window
    Wait Until Page Contains    ${account_name}    timeout=${explicit_timeout}