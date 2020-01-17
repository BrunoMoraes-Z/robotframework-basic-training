*** Settings ***
Library        RequestsLibrary
Library        Collections
Suite Setup    conectar api

*** Variable ***
${URL_API}     http://fakerestapi.azurewebsites.net/api/

*** Test Case ***
buscar todos os livros
    pegar todos os livros
    conferir status code             200
    conferir reason                  OK
    conferir quandidade de livros    200

conferir livro especifico
    pegar livro "15"
    conferir status code             200
    conferir reason                  OK

*** Keywords ***
conectar api
    Create Session                   fakeAPI                  ${URL_API}

pegar todos os livros
    ${result}                        Get Request              fakeAPI          Books
    Set Test Variable                ${result}
    Log                              ${result.text}

conferir status code
    [Arguments]                      ${status}
    Should Be Equal As Strings       ${result.status_code}    ${status}

conferir reason
    [Arguments]                      ${reason}
    Should Be Equal As Strings       ${result.reason}         ${reason}

conferir quandidade de livros
    [Arguments]                      ${quantidade}
    Length Should Be                 ${result.json()}         ${quantidade}

pegar livro "${livro}"
    ${result}                        Get Request              fakeAPI          Books/${livro}
    Set Test Variable                ${result}
    Log                              ${result.text}
