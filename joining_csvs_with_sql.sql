-- team stats
SELECT 
    s.team,
    s.season,
    s.wins,
    s.loses,
    s.points_pg,
    s.opponent_points_pg,
    ROUND(AVG(r.field_goal_pct), 4) AS avg_fg_pct,
    ROUND(AVG(r.three_point_pct), 4) AS avg_three_point_pct,
    ROUND(AVG(r.offensive_rebounds), 4) AS avg_offensive_rebounds,
    ROUND(AVG(r.defensive_rebounds), 4) AS avg_defensive_rebounds,
    ROUND(AVG(r.assists), 4) AS avg_apg,
    ROUND(AVG(r.steals), 4) AS avg_spg,
    ROUND(AVG(r.blocks), 4) AS avg_bpg,
	ROUND(AVG(r.turnovers), 4) AS avg_to,
    s.off_rating_est,
    s.def_rating_est,
	s.net_rating
FROM team_game_results r JOIN team_standings s 
                         ON r.team = s.team 
                         AND r.season = s.season
GROUP BY 
    s.season,
    s.team,
    s.wins,
    s.loses,
    s.points_pg,
    s.opponent_points_pg,
    s.off_rating_est,
    s.def_rating_est,
	s.net_rating
ORDER BY 
    s.season,
    s.team;
-- player season analysis
SELECT p.season,
       player_name,
       p.team,
	   ROUND(p.minutes*1.0/p.games_played,2) AS minutes_pg,
       p.points_pg,
       p.rebounds_pg,
       assists_pg,
       ts_pct,
       effective_fg_pct,
       usage_rate,
       ast_pct,
       reb_pct,
       tov_pct,
       t.net_rating,
       wins,
       t.loses,
       win_pct
FROM player_season_total p
JOIN team_standings t 
  ON t.season = p.season
 AND t.team = p.team
