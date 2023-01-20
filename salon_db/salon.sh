#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  if [[ $1 ]]
    then echo -e "$\n$1"
  fi

  LIST_OF_SERVICES=$($PSQL "SELECT * FROM services")
  echo -e "\nHere are a list of services we offer:"
  echo "$LIST_OF_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  echo -e "\nWhich service would you like to book?"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]+$ ]]
    then
      MAIN_MENU "Sorry, that is not a valid service"
    else GET_CUSTOMER_INFO $SERVICE_ID_SELECTED
  fi

}

GET_CUSTOMER_INFO() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have your record currently, what is your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time would you like your service?"
  read SERVICE_TIME

  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time)
  VALUES('$CUSTOMER_ID', '$1', '$SERVICE_TIME')")

  CURRENT_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$1'")
  echo -e "\nI have put you down for a $CURRENT_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."


}

MAIN_MENU
