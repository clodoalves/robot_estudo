*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    #Armazena o retorno do método Welcome passado com o parametro a string Thun An    
    ${result}=      Welcome     Thun An

    #Imprime o log no prompt
    Log To Console      ${result}

    #Verifica se o ${result} é igual a string passada.
    Should Be Equal     ${result}   Olá Thun An, bem vindo ao curso de Robot Framework