*** Settings ***
Library    SeleniumLibrary
Resource   ../Datos/datos.robot

*** Keywords ***
Iniciar Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Finalizar Navegador
    Close Browser

Iniciar Sesion
    Click Element    id:login2
    Wait Until Element Is Visible    id:loginusername    10s
    Input Text    id:loginusername    ${USER}
    Input Text    id:loginpassword    ${PASSWORD}
    Click Button    xpath://button[text()='Log in']
    Sleep    2s
    Run Keyword And Ignore Error    Handle Alert
    Wait Until Page Contains    Welcome

Elegir Producto Sony
    Wait Until Page Contains Element    ${SELECTOR_SONY}    10s
    Click Element    ${SELECTOR_SONY}
    Wait Until Page Contains    Sony xperia z5    10s
    Page Should Contain    Sony xperia z5

Añadir Al Carrito
    Click Element    xpath=//a[@class='btn btn-success btn-lg']
    Sleep    1s
    Handle Alert

Abrir Carrito
    Click Element    id:cartur
    Wait Until Page Contains    Sony xperia z5    10s
    Page Should Contain    Sony xperia z5

Completar Orden De Compra
    Click Element    xpath://button[text()='Place Order']
    Wait Until Element Is Visible    id:name    10s
    Input Text    id:name       ${NOMBRE}
    Input Text    id:country    ${PAIS}
    Input Text    id:city       ${CIUDAD}
    Input Text    id:card       ${TARJETA}
    Input Text    id:month      ${MES}
    Input Text    id:year       ${ANIO}
    Click Button    xpath://button[text()='Purchase']

Confirmar Compra Exitosa
    Wait Until Page Contains    Thank you for your purchase!    10s
    Page Should Contain    Thank you for your purchase!
    Capture Page Screenshot    ../Resultados/compra_exitosa.png
    Click Button    xpath://button[text()='OK']
