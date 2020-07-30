
*** Settings ***
Library     SeleniumLibrary


#O Test Setup e o Test Teardown servem como gancho para todos os casos de teste.
#Ou seja, todos os casos irá utilizar o Test Setup e o Test Teardown, com isso
#pode remover em todos os casos o open e close browser

#Funciona como o Before nos casos de uso
Test Setup      Nova sessão
#Funciona como o After nos casos de uso
Test Teardown   Encerra sessão


*** Variables ***
${url}      https://training-wheels-protocol.herokuapp.com 
${check_thor}   id:thor
${check_iron_man}   css:input[value='iron-man']
${check_xpath}   xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando checkbox por ID
    #Abre o navegador do chrome com a url passada
    Open Browser                    ${url}      chrome
    #Redireciona para outra página
    Go To                           ${url}/checkboxes
    #Seleciona o elemeto do checkbox que tem o id expecifico
    Select Checkbox                 ${check_thor}
    #Verifica se foi selecionado
    CheckBox Should Be Selected     ${check_thor}    
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                           15
    #Fecha o navegador
    Close Browser



Marcando checkbox por CSS Selector
    [tags]                          ironman

    #Abre o navegador do chrome com a url passada
    Open Browser                    ${url}      chrome
    #Redireciona para outra página
    Go To                           ${url}/checkboxes
    #Seleciona o elemeto do checkbox que tem o value do Seletor CSS expecifico
    Select Checkbox                 ${check_iron_man}
    #Verifica se foi selecionado
    CheckBox Should Be Selected     ${check_iron_man}    
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                           15
    #Fecha o navegador
    Close Browser


#Só é recomendado utiliza o Xpath se foi a ultima solução
#//*[@id='checkboxes']/input[7]
Marcando checkbox por Xpath
    [tags]                          ironmanXpath

    #Abre o navegador do chrome com a url passada
    Open Browser                    ${url}      chrome
    #Redireciona para outra página
    Go To                           ${url}/checkboxes
    #Seleciona o elemeto do checkbox que tem o value do Seletor CSS expecifico
    Select Checkbox                 ${check_xpath}
    #Verifica se foi selecionado
    CheckBox Should Be Selected     ${check_xpath}   
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                           15
    #Fecha o navegador
    Close Browser



*** Keywords ***
Nova sessão
    Open Browser        ${url}      chrome

Encerra sessão
    Close Browser