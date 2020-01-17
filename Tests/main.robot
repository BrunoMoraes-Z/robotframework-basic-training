*** Settings ***
Resource                  ../PageControllers/controller.robot
Resource                  ../PageObjects/elements.robot

Suite Setup                  acessar site
Test Teardown                reiniciar site
Suite Teardown               finalizar navegador

*** Test Case ***
Teste 01: pesquisar produto valido
    pesquisar produto "blouse"
    conferir produto "blouse"

Teste 02: pesquisar produto invalido
    pesquisar produto "renner"
    conferir produto invalido "renner"

Teste 03: Lista de Produtos
    mover mouse para a categoria "Women"
    acessar subcategoria "Summer Dresses"
    conferir listagem de produtos da categoria "Summer Dresses"

Teste 04: Adicionar produto no carrinho
    pesquisar produto "blouse"
    conferir produto "blouse"
    adicionar produto ao carrinho
