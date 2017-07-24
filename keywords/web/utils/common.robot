*** Settings ***
Resource    ../../../resources/imports.robot

*** Keywords ***
I Open My GitHub URL "${url}" With Browser "${browser}"
    [Documentation]    Open GitHub URL with specified browser
    Run Keyword If    '${browser.lower()}' == 'chrome'    Open Chrome Headless Browser    ${url}    ELSE    Open Other Browsers    ${url}    ${browser}
    Wait Until Page Contains    ${account_name}    timeout=${explicit_timeout}


Open Other Browsers
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}   browser=${browser}
    Maximize Browser Window

Open Chrome Headless Browser
    [Arguments]    ${url}
    [Documentation]    Open Chrome Browser with headless mode
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Set Chrome Options
    [Documentation]    Set Chrome Options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_options}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}