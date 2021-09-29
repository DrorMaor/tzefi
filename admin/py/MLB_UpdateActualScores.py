from __future__ import print_function
import mlbgame
import sys
import mysql.connector
from datetime import datetime


TeamDict = {
    "Angels" : "LAA",
    "Astros" : "HOU",
    "Athletics" : "OAK",
    "BlueJays" : "TOR",
    "Braves" : "ATL",
    "Brewers" : "MIL",
    "Cardinals" : "STL",
    "Cubs" : "CHC",
    "D-backs" : "ARI",
    "Dodgers" : "LAD",
    "Giants" : "SFG",
    "Indians" : "CLE",
    "Mariners" : "SEA",
    "Marlins" : "MIA",
    "Mets" : "NYM",
    "Nationals" : "WSN",
    "Orioles" : "BAL",
    "Padres" : "SDP",
    "Phillies" : "PHI",
    "Pirates" : "PIT",
    "Rangers" : "TEX",
    "Rays" : "TBR",
    "RedSox" : "BOS",
    "Reds" : "CIN",
    "Rockies" : "COL",
    "Royals" : "KCR",
    "Tigers" : "DET",
    "Twins" : "MIN",
    "WhiteSox" : "CHW",
    "Yankees" : "NYY"
}
conn = mysql.connector.connect(
  host="localhost",
  user="dror",
  password="CecilCooper15",
  database="tzefi"
)
"""
args = sys.argv[1:]
y = int(args[0])
m = int(args[1])
d = int(args[2])
"""
y = datetime.now().year
m = datetime.now().month
d = datetime.now().day - 1
day = mlbgame.games(y, m, d)
games = mlbgame.combine_games(day)
for game in games:
    clean = str(game)
    clean = clean.replace(' at ', '')
    clean = clean.replace(' ', '')
    clean = clean.replace('(', ' ')
    clean = clean.replace(')', ' ')
    parts = clean.split()
    sql = "update games set AwayScoreActual = " + str(parts[1]) + ", HomeScoreActual = " + str(parts[3])
    sql = sql + " where AwayTeam = '" + TeamDict[parts[0]] + "' and HomeTeam = '" + TeamDict[parts[2]] + "'"
    sql = sql + " and GameDate = '" + str(y) + "-" + str(m) + "-" + str(d) + "'"
    sql = sql + " and AwayScoreActual is null and HomeScoreActual is null; "
    cursor = conn.cursor()
    cursor.execute(sql)
    cursor.close()
    #print(sql)#

conn.commit()
