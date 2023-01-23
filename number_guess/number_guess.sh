#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

MENU() {
  if [[ $1 ]]
    then
      echo -e "\n$1"
  fi

  echo "Enter your username:"
  read USERNAME
}

USER_GUESS() {
  if [[ $1 ]]
    then
      echo -e "$1"
    else
      echo -e "\nGuess the secret number between 1 and 1000:"
      read GUESS
  fi
  
}
MENU

GET_USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $GET_USER ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  else
    echo $GET_USER | while IFS=\| read USERNAME GAMES BEST
    do
      echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
    done
fi


GUESS_NUM=$(( RANDOM % 1000 + 1 ))
GUESSES=1
echo "number: $GUESS_NUM"

USER_GUESS

while [[ $GUESS_NUM -ne $GUESS ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      USER_GUESS "That is not an integer, guess again:"
      read GUESS
  elif [[ $GUESS -eq $GUESS_NUM ]]
    then
      (( GUESSES++ )) 
      break;
  elif [[ $GUESS -lt $GUESS_NUM ]]
    then
      USER_GUESS "It's higher than that, guess again:"
      (( GUESSES++ ))
      read GUESS
  elif [[ $GUESS -gt $GUESS_NUM ]]
    then
      USER_GUESS "It's lower than that, guess again:"
      (( GUESSES++ ))
      read GUESS
  fi
done

if [[ -z $GAMES  ]]
  then
    UPDATE_GAME=$($PSQL "UPDATE users SET games_played=1, best_game=$GUESSES WHERE username='$USERNAME'")
  else
    (( GAMES++ ))
    if [[ $GUESSES -lt $BEST ]]
      then
        UPDATE_GAME=$($PSQL "UPDATE users set games_played=$GAMES, best_game=$GUESSES WHERE username='$USERNAME'")
      else
        UPDATE_GAME=$($PSQL "UPDATE users set games_played=$GAMES WHERE username='$USERNAME'")
    fi
fi

echo "You guessed it in $GUESSES tries. The secret number was $GUESS_NUM. Nice job!"
