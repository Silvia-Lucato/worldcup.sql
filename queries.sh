#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
WINNER_TOTAL="$($PSQL "SELECT SUM(winner_goals) FROM games ")"
OPPONENT_TOTAL="$($PSQL "SELECT SUM(opponent_goals) FROM games")"
TOTAL_GOALS="$(expr $WINNER_TOTAL + $OPPONENT_TOTAL)"
echo "$TOTAL_GOALS"

echo -e "\nAverage number of goals in all games from the winning teams:"
WINNER_AVG_GOALS="$($PSQL "SELECT AVG(winner_goals) FROM games")"
echo "$WINNER_AVG_GOALS"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
MAX_GOALS_2018="$($PSQL "SELECT MAX(winner_goals) FROM games WHERE year = 2018")"
WINNER_2018_ID="$($PSQL "SELECT ROUND(AVG(winner_id), 0) FROM games WHERE winner_goals = $MAX_GOALS_2018 AND year = 2018")"
WINNER_2018="$($PSQL "SELECT name FROM teams WHERE team_id = $WINNER_2018_ID")"
echo "$WINNER_2018"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams INNER JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE round = 'Eighth-Final' AND year = 2014")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams FULL JOIN games ON teams.team_id=games.winner_id WHERE winner_id IS NOT NULL ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
MAX_GOALS_2014="$($PSQL "SELECT MAX(winner_goals) FROM games WHERE year = 2014")"
WINNER_2014_ID="$($PSQL "SELECT ROUND(AVG(winner_id), 0) FROM games WHERE winner_goals = $MAX_GOALS_2014 AND year = 2014")"
WINNER_2014="$($PSQL "SELECT name FROM teams WHERE team_id = $WINNER_2014_ID")"
echo "2014|$WINNER_2014"
echo "2018|$WINNER_2018"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%'")"
