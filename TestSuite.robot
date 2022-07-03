
*** Settings ***
Documentation    A test suite for login on-site with valid and invalid data
...
Library          SeleniumLibrary
Resource       resources/VariablesSuite.robot

#Теги можна придумувати будь які
Default Tags    Positive   Negative

*** Test Cases ***

#Користувач успішно авторизований на сайті
TC_1 The user has been successfully authorized on site
    [Tags]    Positive
    [Setup]    Open Browser and Maximize    ${UserUrl}  ${BrowserName}
    [Teardown]    Close Browser
    Login to Website    ${UserName}     ${Password}
    Page should not contain element    class:error-message-container
    Wait until element is visible     class:inventory_list
    Sorting container A to Z  ${sort_hilo}
    Add product to cart
    Open shopping cart
    Checkout shopping products
    Input informations
    Checkout: Overview
    Click Burger button
    Scroll footer

#Користувача не авторизований із недійсним іменем
TC_2 User not authorized with an invalid username
    [Tags]    Negative
    [Setup]    Open Browser and Maximize    ${UserUrl}  ${BrowserName}
    [Teardown]    Close Browser
    Login to Website    ${LocketUser}     ${Password}
#    Page should not contain element    class:error-message-container

#Користувач не авторизований з недійсним паролем
TC_3 User not authorized with an invalid password
    [Tags]    Negative
    [Setup]    Open Browser and Maximize    ${UserUrl}  ${BrowserName}
    [Teardown]    Close Browser
    Login to Website    ${UserName}     ${ProblemPassword}
#    Page should not contain element    class:error-message-container

