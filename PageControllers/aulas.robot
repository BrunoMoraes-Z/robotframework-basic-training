*** Settings ***
Library        Selenium2Library

*** Settings ***
Library   Selenium2Library

*** Variable ***
${VARIAVEL_GLOBAL}  teste

@{FRUTAS}  maça  uva  banana  abacaxi  pera

&{PESSOA}  nome=Bruno Moraes  idade=20  email=moraes.7bruno@gmail.com

*** Test Case ***
loops
    for com limites
    for com lista
    saindo do for
    repetindo

*** Keywords ***
for com limites
    :FOR  ${count}  IN RANGE  1  6
    \  Log  teste ${count}

for com lista
    :FOR  ${element}  IN  @{FRUTAS}
    \  Log  mminha fruta é: ${element}

saindo do for
    :FOR  ${element}  IN  @{FRUTAS}
    \  Exit For Loop If  '${element}' == 'abacaxi'
    \  Log  fruta: ${element}

repetindo
    Repeat Keyword  4  Log  repetindo log