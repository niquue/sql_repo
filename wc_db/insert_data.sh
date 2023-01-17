#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $WINNER != "winner" && $OPPONENT != "opponent" && $YEAR != "year" && $ROUND != "round" && $WINNER_GOALS != "winner_goals" && $OPPONENT_GOALS != "opponent_goals" ]]
    then
      CHECK_RESULT_WIN=$($PSQL "SELECT 1 FROM teams WHERE name='$WINNER'")
      if [[ $CHECK_RESULT_WIN != 1 ]]
        then
          INSERT_TEAM_RESULT1=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          #WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
          #echo $WIN_ID
      fi
      CHECK_RESULT_OPP=$($PSQL "SELECT 1 FROM teams WHERE name='$OPPONENT'")
      if [[ $CHECK_RESULT_OPP != 1 ]]
        then
          INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      fi
      WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
      VALUES('$YEAR', '$ROUND', '$WIN_ID', '$OPP_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
  fi



  
done


