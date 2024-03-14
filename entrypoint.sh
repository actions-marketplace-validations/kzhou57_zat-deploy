#!/bin/sh -l

echo "Checking Input Parameters ..."
if [ -z "$ZENDESK_SUBDOMAIN" ]; then
  echo "ZENDESK_SUBDOMAIN is not set. Exiting..."
  exit 1
fi
if [ -z "$ZENDESK_USERNAME" ]; then
  echo "ZENDESK_USERNAME is not set. Exiting..."
  exit 2
fi
if [ -z "$ZENDESK_PASSWORD" ]; then
  echo "ZENDESK_PASSWORD is not set. Exiting..."
  exit 3
fi
if [ -z "$ZENDESK_APP_ID" ]; then
  echo "ZENDESK_APP_ID is not set. Exiting..."
  exit 4
fi

echo "Generate .zat file..."
if [ -n "$APP_FOLDER" ]; then
  cd $APP_FOLDER
fi
echo "{\"subdomain\": \"$ZENDESK_SUBDOMAIN\", \"username\": \"$ZENDESK_USERNAME\", \"password\": \"$ZENDESK_PASSWORD\", \"app_id\": \"$ZENDESK_APP_ID\"}" > .zat

echo "Deploying to Zendesk..."
zat clean
zat update