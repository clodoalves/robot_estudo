*** Settings ***
#Inporta de outra classe tudo que tem nela.
Resource        base.robot


#Funciona como o Before nos casos de uso
Test Setup      Nova sessão
#Funciona como o After nos casos de uso
Test Teardown   Encerra sessão


*** Variables ***
${select_radio_cap}   cap
${select_radio_iron_man}   cap

** Test Cases **
Selecionando por Id
    #Redireciona para outra página
    Go To                               ${url}/radios
    #Seleciona o elemento do radio que estpa no grupo "movies" e tem o id expecifico
    Select Radio Button                 movies      ${select_radio_cap}
    #Verifica se foi selecionado
    Radio Button Should Be Set To     movies      ${select_radio_cap}    
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                               5

Selecionando por Value
    #Redireciona para outra página
    Go To                               ${url}/radios
    #Seleciona o elemento do radio que estpa no grupo "movies" e tem o value expecifico
    Select Radio Button                 movies      ${select_radio_iron_man}
    #Verifica se foi selecionado
    Radio Button Should Be Set To     movies      ${select_radio_iron_man}    
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep                               5



    #OBSERVAÇÃO: Qualquer radio-button vai ter o "value", pode até não ter o "id".
    #OBSERVAÇÃO 2 : Diferentemente do Checkbox, no radio-button não colocamos o "id" e nem
    #o css:input[value='']. Basta colocar o nome do "id" e o nome do "value".