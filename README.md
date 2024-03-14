# Zendesk App Tools - Deploying an app
![](logo.png)


## About
This Action is forked from the [original /verschoren/zat-deploy](https://github.com/verschoren/zat-deploy), but accept the input parameters to avoid hard coded credentials in .zat file. 

## Usage
Below is an example flow to Deploy the app.
```
    name: Deploy Zendesk App

    on:
      push:
        branches: [ master ]

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - uses: actions/checkout@v4

        - name: ZAT Deploy
          uses: kzhou57/zat-update@master
          with:
            subdomain: https://youraccount.zendesk.com
            username: yourname@yourcompany.com
            password: ${{ secrets.ZENDESK_PASSWORD }}
            app_id: 123456
```

## Create or Update
If you have never deployed the app, you'll need to manually create it either using zat tool or on zendesk web page, then you can use the app_id above

## Dependencies
1. The action uses docker: *verschoren/zendesk_zat:latest*
