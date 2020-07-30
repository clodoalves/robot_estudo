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
    [tags]      loginSucesso
    #Redireciona para outra página
    Go To                               ${url}/login
    #Seta o valor no campo
    Login With      stark       jarvis!
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       2
    #Clica no botão   
    Click Element       ${click_button_login}
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep    2
    #Verifica se na página possui aquele determinado texto
    Should See logged User  Tony Stark
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       2


Senha Invalida
    [tags]      senhaInvalida
    #Redireciona para outra página
    Go To                               ${url}/login
    #Seta o valor no campo
    Login With      stark       jarvis!aaaaa
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       2
    #Clica no botão   
    Click Element       ${click_button_login}
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep    2
    #verifica se existe o elemento com "id" expecifico e verifica se possui aquela mensagem no elemento
    Should Contain Login Alert      Senha é invalida!
    #Verifica se na página possui aquele determinado texto
    #Page Should Contain  Senha é invalida

    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       2



Usuario Invalido
    [tags]      usuarioInvalido
    #Redireciona para outra página
    Go To           ${url}/login
    #Seta o valor no campo
    Login With      starkkkkk       jarvis!
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       2
    #Clica no botão   
    Click Element       ${click_button_login}
    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep    2
    #verifica se existe o elemento com "id" expecifico e verifica se possui aquela mensagem no elemento
    Should Contain Login Alert      O usuário informado não está cadastrado!
    #Verifica se na página possui aquele determinado texto
    #Page Should Contain  Senha é invalida

    #Espera por segundos determinados antes de ir para o proxímo comando
    Sleep       2
    Wait Until Element Is Enabled       

*** Keywords ***
Login With
    [Arguments]     ${user}     ${pass}
    Input Text      ${input_name_username}      ${user}
    Input Text      ${input_name_password}      ${pass}

Should Contain Login Alert
    [Arguments]     ${mens}
    ${message}=     Get WebElement      ${id_usuario_invalido}
    Should Contain  ${message.text}     ${mens}

Should See logged User
    [Arguments]     ${full_name}
    Page Should Contain     Olá, ${full_name}.


    #OBSERVAÇÃO: Esse teste dá FAIL, pois o chrome não desce até o botão, logo não ocnsegue interagir.
    #Para dar Success tem que descer o scroll para poder aparecer o botão
    
    #OBSERVAÇÃO 2: Com a Keywords, todos os testes que precisam preencher e clicar no botão, podem usar 
    #apenas "Login With" passando os parametros.