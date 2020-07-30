
*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Devera Retornar Titulo Pagina
    #Abre o navegador do chrome com a url passada
    Open Browser        https://training-wheels-protocol.herokuapp.com/     chrome

    #Verifica se o titulo da página realmente é igual ao parámetro passado
    Title Should Be     Training Wheels Protocol
    
    #Fecha o navegador
    Close Browser