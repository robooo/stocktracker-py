*** Keywords ***
Remove DB
    Remove File  main-port.csv

App Setup
    Start Backend
    Create Session  session_id  http://127.0.0.1:5000
    Set Environment Variable  ALPHAVANTAGE_APIKEY  YOUR_KEY

Start Backend
    ${id}=  Start Process  python  api.py
    Set Suite Variable  ${BACKEND_ID}  ${id}
    Sleep  3s  # Wait till backend starts
