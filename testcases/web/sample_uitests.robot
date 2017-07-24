*** Settings ***
Documentation     Test My GitHub Web
Resource          ../../resources/imports.robot
Test Setup        Given I Open My GitHub URL "${gh_url}" With Browser "${browser}"
Test Teardown     Close Browser

*** Test Cases ***
TestCheckRepositoryOnGH
    [Documentation]    Open my GH and check whether my repository exists or not.
    When Click On Tab "Repositories"
    And Type Search Keyword "robotframework-samples"
    Then "robotframework-samples" Should Be Found

TestSearchRepositoryNotFound
    [Documentation]    Search repository and expect result not found.
    When Click On Tab "Repositories"
    And Type Search Keyword "invalid repos"
    Then Search Result Should Not Be Found

