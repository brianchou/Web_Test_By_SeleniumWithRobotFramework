*** Settings ***
Library           XML
Library           JSONLibrary
Library           RequestsLibrary
Library           Browser
Library           OCRLibrary
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
    [Tags]    WebMngconsoleSmokeTest
    Login to Mngconsole WebSite    ${browser}    ${headless}    ${url}    ${account}    ${password}
    click    li[role="menuitem"] div:has-text("站点管理")
    click    text=新增站点
    click    button:has-text("新增站点")
    Get Element State    text=厅主账号：    visible
    Get Element State    text=密码：    visible
    click    button:has-text("取消")
    Get Element State    th:has-text("厅主账号")    visible
    Wait For Elements State    button:has-text("编辑")
    ${buttonVisible}=    Get Element State    button:has-text("编辑")    visible
    IF    ${buttonVisible} == True
    click    button:has-text("编辑")
    Get Element State    text=厅主账号：    visible
    click    button:has-text("取消")
    click    button:has-text("权限配置")
    Get Element State    text=分配权限    visible
    click    [aria-label="分配权限"] button:has-text("取消")
    Close Browser
    ELSE
    Close Browser
    END

*** Keywords ***
