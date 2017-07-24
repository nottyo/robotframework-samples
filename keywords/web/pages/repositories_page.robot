*** Settings ***
Resource    ../../../resources/imports.robot
Variables   ../locators.yaml

*** Keywords ***
Type Search Keyword "${search_keyword}"
    [Documentation]     Perform typing on search box
    Input Text    ${search_box}    ${search_keyword}
    Press Key    ${search_box}    \\13
    Wait Until Element Is Visible    css=a.issues-reset-query    timeout=${explicit_timeout}

"${repository}" Should Be Found
    [Documentation]    Verify that specified repository is found.
    Page Should Contain Link    default=/${account_name}/${repository}

Search Result Should Not Be Found
    [Documentation]    Expect search result not found.
    Page Should Contain    ${account_name} doesn’t have any repositories that match.