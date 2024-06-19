#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 
 # Do not insert first row
 if [[ $YEAR != "year" ]]
 then

  # Get WINNER Id
  WINNER_EXIST=$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")

  if [[ -z $WINNER_EXIST ]]
  then
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

    # Check if the insert was successful
    if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted $WINNER into teams"
    fi
  fi

  # Get opponent Id
  OPPONENT_EXIST=$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")
  if [[ -z $OPPONENT_EXIST ]]
  then
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

    # Check if insert was successfull
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted $OPPONENT into teams"
    fi
  fi

  # Insert into games

  # Get WINNER ID
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # Get OPPONENT ID
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # INSERT
  INSERT_INTO_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  # Check if insertion was successful
  if [[ $INSERT_INTO_GAMES_RESULT == "INSERT 0 1" ]]
  then
    echo "Inserted $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS into games"
  fi

 fi

done
