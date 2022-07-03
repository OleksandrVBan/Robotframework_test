
*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BrowserName}      Chrome
${UserUrl}      https://www.saucedemo.com
${UserName}     standard_user
${Password}     secret_sauce
${ProblemPassword}     secret_sauce1
${LocketUser}   locked_out_user

# Sorting container A to Z
${sort_az}  az
${sort_za}  za
${sort_lohi}    lohi
${sort_hilo}    hilo

*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${UserUrl}  ${BrowserName}
    Open Browser    ${UserUrl}  ${BrowserName}
    Maximize Browser Window

Login to Website
    [Arguments]     ${UserName}     ${Password}
    input text    id:user-name      ${UserName}
    input password    id:password       ${Password}
    click button    name:login-button
    sleep    2

Sorting container A to Z
    [Arguments]    ${NameAtoZ}
    select from list by value    xpath://*[@id="header_container"]/div[2]/div[2]/span/select    ${NameAtoZ}
    sleep    2

Add product to cart
    click button    id:add-to-cart-sauce-labs-fleece-jacket
    click button    id:add-to-cart-sauce-labs-backpack
    sleep    2

Open shopping cart
    click link    class:shopping_cart_link
    sleep    2

Checkout shopping products
    page should contain element    class:cart_desc_label
    click button    id:checkout
    page should contain     Checkout: Your Information

Input informations
    input text    id:first-name     Olexander
    input text    id:last-name      Banashko
    input text    id:postal-code    610890
    sleep   2
    click button    id:continue

Checkout: Overview
    page should contain    Checkout: Overview
    set screenshot directory    /home/sasha/PycharmProjects/daruma-project1/screenshot
    capture element screenshot    xpath://*[@id="checkout_summary_container"]/div/div[2]
    scroll element into view    class:footer_copy
    sleep    2
    click button    id:finish
    page should contain    THANK YOU FOR YOUR ORDER
    sleep    2
    click button    id:back-to-products
    sleep   2

Click Burger button
    click button    id:react-burger-menu-btn
    wait until element is enabled    id:about_sidebar_link
#Коли зявиться елемент (стане видимий для кліку на нього)
    click link    id:about_sidebar_link
    page should contain    Pass or fail. The world relies on your code.
    sleep   2
    go back

Scroll footer
    page should contain    Products
    scroll element into view    class:footer_copy
    sleep    2
    click link    xpath://*[@id="page_wrapper"]/footer/ul/li[3]/a
    sleep   2


