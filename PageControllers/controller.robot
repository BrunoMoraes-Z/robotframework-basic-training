*** Settings ***
Library     Selenium2Library
Resource    ../PageObjects/elements.robot

*** Keywords ***
acessar site
    Open Browser                     ${SITE}                                                                                           ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${HOME_LOGO}                                                                                      10

finalizar navegador
    Close Browser

reiniciar site
    Click Element                    ${HOME_ICON}
    Wait Until Element Is Visible    ${HOME_LOGO}                                                                                      10

pesquisar produto "${PRODUTO}"
    Input Text                       ${INPUT_PRODUTO}                                                                                  ${PRODUTO}
    Click Button                     ${BUTTON_PESQUISAR}
    Wait Until Element Is Visible    ${HOME_ICON}

conferir produto "${PRODUTO}"
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//img[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Element      xpath=//div[@id='center_column']//span[contains(text(), '${PRODUTO}')]

conferir produto invalido "${PRODUTO}"
    Title Should Be                  Search - My Store
    Page Should Contain Element      xpath=//div[@id='center_column']//p[contains(text(), 'No results were found for your search')]
    Page Should Contain Element      xpath=//p[contains(text(), '${PRODUTO}')]

mover mouse para a categoria "${CATEGORIA}"
    Mouse Over                       xpath=//li/a[text()='${CATEGORIA}']
    Wait Until Element Is Visible    xpath=//ul[@class='submenu-container clearfix first-in-line-xs']

acessar subcategoria "${SUB_CATEGORIA}"
    Click Element                    xpath=//li/a[text()='${SUB_CATEGORIA}']
    Wait Until Element Is Visible    xpath=//span[@class='category-name'][contains(text(),'${SUB_CATEGORIA}')]

conferir listagem de produtos da categoria "${SUB_CATEGORIA}"
    Page Should Contain Element      xpath=//span[@class='category-name'][contains(text(),'${SUB_CATEGORIA}')]
    Page Should Contain Element      xpath=//ul[contains(@class, 'product_list')]

adicionar produto ao carrinho "${PRODUTO}"
    Mouse Over                       xpath=//img[@title='${PRODUTO}']
    Click Element                    xpath=//span[text()='Add to cart']
    Wait Until Element is Visible    xpath=//div[@id='layer_cart']

