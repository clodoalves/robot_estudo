*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://training-wheels-protocol.herokuapp.com 
${navegador}        chrome

*** Keywords ***
Nova sessão
         
    Open Browser        ${url}      ${navegador}
    Maximize Browser Window

Encerra sessão
    #Captura a tela
    Capture Page Screenshot
    Close Browser