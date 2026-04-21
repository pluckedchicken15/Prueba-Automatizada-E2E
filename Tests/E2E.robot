*** Settings ***
Resource    ../Recursos/keywords.robot

*** Test Cases ***

TC_001_E2E_Compra_Completa
    Iniciar Navegador
    Iniciar Sesion
    Elegir Producto Sony
    Añadir Al Carrito
    Abrir Carrito
    Completar Orden De Compra
    Confirmar Compra Exitosa
    Finalizar Navegador
