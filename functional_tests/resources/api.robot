*** Keywords ***
Get Portfolio
    ${resp}=  Get request  session_id  /portfolio  headers=${HEADERS}
    Log  ${resp}
    [Return]  ${resp.json()}

Add ${units} Of ${ticker} Stocks To Portfolio And Should Return ${code}
    ${data}=  Create Dictionary  ticker=${ticker}  units=${units}
    ${resp}=  Post Request  session_id  /holding  data=${data}  headers=${FORM_HEADER}
    Should Be Equal As Strings  ${resp.status_code}  ${code}
    [Return]  ${resp.text}

Verify ${units} Units Of ${ticker} Was Added To Portfolio
    ${data}=  Get Portfolio
    Should Be Equal As Integers  ${units}  ${data['${ticker}']}
