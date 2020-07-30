
*** Settings ***
#Inporta de outra classe tudo que tem nela.
Resource        base.robot


#Funciona como o Before nos casos de uso
Test Setup      Nova sessão
#Funciona como o After nos casos de uso
Test Teardown   Encerra sessão


*** Variables ***
${check_thor}   id:thor
${check_iron_man}   css:input[value='iron-man']
${check_xpath}   xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando checkbox por ID
    #Redireciona para outra página
    Go To                           ${url}/checkboxes
    #Seleciona o elemeto do checkbox que tem o id expecifico
    Select Checkbox                 ${check_thor}
    #Verifica se foi selecionado
    CheckBox Should Be Selected     ${check_thor}    
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                           15



Marcando checkbox por CSS Selector
    [tags]                          ironman

    #Redireciona para outra página
    Go To                           ${url}/checkboxes
    #Seleciona o elemeto do checkbox que tem o value do Seletor CSS expecifico
    Select Checkbox                 ${check_iron_man}
    #Verifica se foi selecionado
    CheckBox Should Be Selected     ${check_iron_man}    
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                           15


#Só é recomendado utiliza o Xpath se foi a ultima solução
#//*[@id='checkboxes']/input[7]
Marcando checkbox por Xpath
    [tags]                          ironmanXpath

    #Redireciona para outra página
    Go To                           ${url}/checkboxes
    #Seleciona o elemeto do checkbox que tem o value do Seletor CSS expecifico
    Select Checkbox                 ${check_xpath}
    #Verifica se foi selecionado
    CheckBox Should Be Selected     ${check_xpath}   
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                           15
