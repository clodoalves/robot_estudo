*** Settings ***
#Inporta de outra classe tudo que tem nela.
Resource        base.robot


#Funciona como o Before nos casos de uso
Test Setup      Nova sessão
#Funciona como o After nos casos de uso
Test Teardown   Encerra sessão


*** Variables ***

** Test Cases **
#No Robot para você poder validar o valor de uma linha / validar registro de uma tabela, você precisa
#saber qual o numero da linha que o registro está.
Verifica o valor ao informar o numero da linha
    [tags]      tablePorLinha
    #Redireciona para outra página
    Go To                               ${url}/tables
    #Passa o "id" da tabela, a linha que quer verificar e o valor que aquela linha deve ter
    Table Row Should Contain        ${id_table}     ${line_1}       $ 10.000.000        
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       10


Descobre a linha por texto chave através do xpath e valida os demais valores
#Redireciona para outra página
    Go To               ${url}/tables
#Pega a partir de um valor único utilizando xpath a linha e seta esse valor da linha em uma variável
    ${target}=          Get WebElement      xpath:.//tr[contains(., '@robertdowneyjr')]
    #Salva no log todo o conteúdo daquela linha
    Log                 ${target.text}
    #Imprime no console todo o conteúdo daquela linha
    Log To Console      ${target.text}
    Should Contain      ${target.text}      $ 10.000.000
    Should Contain      ${target.text}      Homem de Ferro
#Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       10


    #OBSERVAÇÃO: O id da linha em uma tabela pode ser alterada de acordo com os registros.
    #Com isso não se recomenda pegar pela posição da linha e sim por algum valor único que aquele
    #registro possua.