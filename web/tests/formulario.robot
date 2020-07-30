*** Settings ***
#Inporta de outra classe tudo que tem nela.
Resource        base.robot


#Funciona como o Before nos casos de uso
Test Setup      Nova sessão
#Funciona como o After nos casos de uso
Test Teardown   Encerra sessão


*** Variables ***
${input_name_username}   css:input[name=username]
${input_name_password}   css:input[name=password]
${click_button_login}    class:btn-login
${id_senha_invalida}     id:flash
${id_usuario_invalido}   id:flash

** Test Cases **
#No Robot para você poder validar o valor de uma linha / validar registro de uma tabela, você precisa
#saber qual o numero da linha que o registro está.
Fazer login com sucesso pegando os campos de input pelo name e o botão pela class
    #Redireciona para outra página
    Go To                               ${url}/login
    #Seta o valor no campo
    Input Text      ${input_name_username}      stark
    Input Text      ${input_name_password}      jarvis!
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       5
    #Clica no botão   
    Click Element       ${click_button_login}
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep    5
    #Verifica se na página possui aquele determinado texto
    Page Should Contain  Olá, Tony Stark.
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       5


Senha Invalida
    [tags]      senhaInvalida
    #Redireciona para outra página
    Go To                               ${url}/login
    #Seta o valor no campo
    Input Text      ${input_name_username}      stark
    Input Text      ${input_name_password}      jarvis!ssssss
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       5
    #Clica no botão   
    Click Element       ${click_button_login}
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep    5
    #verifica se existe o elemento com "id" expecifico e verifica se possui aquela mensagem no elemento
    ${message}=     Get WebElement      ${id_senha_invalida}
    Should Contain  ${message.text}     Senha é invalida!
    #Verifica se na página possui aquele determinado texto
    #Page Should Contain  Senha é invalida

    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       5



Usuario Invalido
    [tags]      usuarioInvalido
    #Redireciona para outra página
    Go To                               ${url}/login
    #Seta o valor no campo
    Input Text      ${input_name_username}      starkkkkk
    Input Text      ${input_name_password}      jarvis!
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       5
    #Clica no botão   
    Click Element       ${click_button_login}
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep    5
    #verifica se existe o elemento com "id" expecifico e verifica se possui aquela mensagem no elemento
    ${message}=     Get WebElement      ${id_usuario_invalido}
    Should Contain  ${message.text}     O usuário informado não está cadastrado!
    #Verifica se na página possui aquele determinado texto
    #Page Should Contain  Senha é invalida

    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       5






    #OBSERVAÇÃO: Esse teste dá FAIL, pois o chrome não desce até o botão, logo não ocnsegue interagir.
    #Para dar Success tem que descer o scroll para poder aparecer o botão