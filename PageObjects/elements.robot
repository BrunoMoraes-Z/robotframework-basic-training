*** Settings ***
Library     Selenium2Library

*** Variable ***
${SITE}                 http://automationpractice.com/index.php
${BROWSER}              chrome
${HOME_LOGO}            xpath=//img[@src='http://automationpractice.com/img/logo.jpg']
${INPUT_PRODUTO}        id=search_query_top
${BUTTON_PESQUISAR}     name=submit_search
${HOME_ICON}            xpath=//i[contains(@class,'icon-home')]