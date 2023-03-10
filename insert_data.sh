#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL"TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 if [[ $WINNER != winner ]]
   then
   TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$WINNER'")
   WINNING_TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$WINNER'")
   if [[ -z $TEAM_ID ]]
     then
     INSERT_WINNER=$($PSQL"INSERT INTO teams(name) VALUES('$WINNER')")
     if [[ $INSERT_WINNER == 'INSERT 0 1' ]]
       then
       echo "Inserted into teams, $WINNER"
     fi
     TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$WINNER'")
     WINNING_TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$WINNER'")
   fi
 fi
 if [[ $OPPONENT != opponent ]]
   then
   TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$OPPONENT'")
   LOSING_TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$OPPONENT'")
   if [[ -z $TEAM_ID ]]
     then
     INSERT_OPPONENT=$($PSQL"INSERT INTO teams(name) VALUES('$OPPONENT')")
     if [[ $INSERT_OPPONENT == 'INSERT 0 1' ]]
       then
       echo "Inserted into teams, $OPPONENT"
     fi
     TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$OPPONENT'")
     LOSING_TEAM_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$OPPONENT'")
   fi
 fi
 if [[ $YEAR != year ]]
   then
   INSERT_RESULT=$($PSQL"INSERT INTO games(year, winner_goals, opponent_goals, round, winner_id, opponent_id) VALUES($YEAR, $WINNER_GOALS, $OPPONENT_GOALS, '$ROUND', $WINNING_TEAM_ID, $LOSING_TEAM_ID)")
   if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
     then
     echo "Inserted into games: $YEAR, $ROUND, $WINNER_GOALS, $OPPONENT_GOALS"
   fi
 fi
done
