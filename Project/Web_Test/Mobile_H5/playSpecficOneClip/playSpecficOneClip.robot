*** Settings ***
Library           XML
Library           JSONLibrary
Library           RequestsLibrary
Library           SeleniumLibrary
Library           String
Library           DateTime
Library           Collections
Library           OperatingSystem
Resource          ../../../../../Resource/Web_Test/mngconsole/login/kw_mngconsole_web_login.robot
Variables         ../../../../../Variables/var_Environment_QAT.py

*** Variables ***
${browser}        ${G_Browser}
${headless}       ${G_Headless}
${url}            ${G_Mngconsole_WebSite_URL}
${account}        ${G_Mngconsole_WebSite_Account}
${password}       ${G_Mngconsole_WebSite_Password}

*** Test Cases ***
check query and addNewSite page
    [Tags]    SmokeTest
    Open Browser    https://www.twitch.tv    chrome

*** Keywords ***
