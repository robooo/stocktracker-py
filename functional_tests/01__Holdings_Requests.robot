*** Settings ***
Library  Process
Library  OperatingSystem
Library  RequestsLibrary
Resource  resources/backend.robot
Resource  resources/api.robot

Suite Setup  App Setup
Suite Teardown  Terminate Process  ${BACKEND_ID}

*** Variables ***
&{HEADERS}=  Content-Type=application/json  Accept=application/json
&{FORM_HEADER}=  Content-Type=application/x-www-form-urlencoded  Accept=*/*

*** Test Cases ***
Add Holding To Portfolio
    Add 1 Of AAPL Stocks To Portfolio And Should Return ${201}
    Verify 1 Units Of AAPL Was Added To Portfolio
    [Teardown]  Remove DB

Try To Add Non-Existing Ticker
    Add 1 Of NONEXISTING Stocks To Portfolio And Should Return ${400}
    [Teardown]  Run Keyword And Ignore Error  Remove DB

Try To Add Wrong Units
    Add -1 Of AAPL Stocks To Portfolio And Should Return ${400}  # Bug?
    Add 0 Of AAPL Stocks To Portfolio And Should Return ${400}  # Bug?
    [Teardown]  Run Keyword And Ignore Error  Remove DB
