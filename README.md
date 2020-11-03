# Stock Tracker App

## Functionality

This application allows a user to compose a portfolio of stock holdings.

It supports the following capabilities:   
- Add a holding by providing the ticker symbol plus the number of units.  
- Remove a holding for a given ticker.  
  - The format of supported stock tickers is a series of uppercase letters, plus an optional hyphen and/or dot and/or number, 
  examples being: AAPL, BF-B, VOD.LON, VOW3.DE   
- Query the total value of the portfolio:  
  - Stock prices based on the daily closing price from the prior (most recent) trading day.   
- Note: only one holding per ticker is supported. If a holding with an existing ticker is added, then the new number of units replaces the amount for that ticker.

Other notes:

- The portfolio is saved each time it is changed.   
- This is a single-user application; there is no end user authentication.   
- The application integrates with the following API: https://www.alphavantage.co/ (see below for setting up API access)   


## Usage

### Setup

Requires Python3.

Please ensure the project dependencies are installed first, e.g. using:

`pip install -r requirements.txt`

The project also requires api access to <https://www.alphavantage.co/>. To set this up:
-   Sign-up for a free api key here: <https://www.alphavantage.co/support/#api-key>   
    - Look for the key to be displayed on screen as soon as you submit your details.
-   Then add the api key as an environment variable named `ALPHAVANTAGE_APIKEY`

NOTE: Please be aware that the standard AlphaVantage API access is limited to 5 calls per minute; so don't worry
if you see some intermittent failures when issuing a series of requests in quick succession.

### Run

To run the command line interface:

    $ python cli.py

NOTES:
-   You may need to substitute `python` in this command with the relevant alternative executable, e.g. `python3`, depending on your local setup.
-   This project was run and tested on Mac and Windows, so should work fine on either, barring any problems related to differences in local configuration.

