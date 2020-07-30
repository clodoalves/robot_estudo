*** Settings ***
#Inporta de outra classe tudo que tem nela.
Resource        base.robot


#Funciona como o Before nos casos de uso
Test Setup      Nova sessão
#Funciona como o After nos casos de uso
Test Teardown   Encerra sessão


*** Variables ***
${label_scott}   Scott Lang
${label_loki}   Loki
${select_class}   class:avenger-list
${id_list}      id:dropdown
${value_loki}      6
${value_scott}      7

** Test Cases **
Selecionando por nome do texto da label e validar pelo value
    [tags]      dropdownText
    #Redireciona para outra página
    Go To                               ${url}/dropdown
    #Seleciona o elemento da lista por nome da label. É preciso passar o nome da class e o texto da label
    Select From List By Label                 ${select_class}      ${label_scott}

    #Verifica se foi selecionado.
    #É criado ma variável "interna" para poder fazer a comparação
    ${selected}=    Get Selected List Value     ${select_class}       
    Should Be Equal     ${selected}     ${value_scott}    
      
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       10


Selecionando por value e validar pelo texto
    [tags]      dropdownValue

    #Redireciona para outra página
    Go To                           ${url}/dropdown
    #Seleciona o elemento da lista por value. o id da lista e o value. No lugar do id, podemos
    #passar a class tambem.
    Select From List By value       ${id_list}      ${value_loki}

    #Verifica se foi selecionado
    #É criado ma variável "interna" para poder fazer a comparação
    ${selected}=    Get Selected List Label     ${select_class}       
    Should Be Equal     ${selected}     ${label_loki}   


    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       10
                 