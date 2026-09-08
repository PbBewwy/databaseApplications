-- =====================================================================
-- Unit 2g — Keeping the Unmatched Rows
-- Database Applications Development · MCCC
--
-- Databases: nba_5seasons.db for 1-3, movies_small.db for 4-5
--
-- Rename this file with your last name before you start.
--
-- Read unit2g_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Using an INNER JOIN, count how many players have stats for the
--    2025-26 season.
SELECT full_name, s.player_id, season
FROM players
JOIN player_season_stats s ON s.player_id = players.player_id AND s.season = '2025-26';

-- 2. Using a LEFT JOIN from players, count how many rows you get for
--    the same thing.
SELECT full_name, s.player_id, season
FROM players
LEFT JOIN player_season_stats s ON s.player_id = players.player_id AND s.season = '2025-26';

-- 3. List the names of players who have no 2025-26 season stats.
SELECT p.full_name, p.player_id
FROM players p
LEFT JOIN player_season_stats s ON p.player_id = s.player_id AND s.season = '2025-26'
WHERE s.player_id IS NULL;

-- 4. In movies_small.db, count how many rows in roles have no
--    character name recorded.
SELECT character
FROM roles
WHERE character IS NOT NULL

-- 5. Show ten people from movies_small.db who have no birth year
--    recorded.
SELECT name, birth_year
FROM people
WHERE birth_year IS NULL

-- 6. Pick any query from this unit you found interesting, run it, and
--    export the results to CSV. Name the file
--    unit2_report_lastname.csv and commit it alongside this file.


-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Queries 1 and 2 return different numbers. What are they, and what
-- does the difference represent?
-- 652, 1099. The difference is that even if there's nothing to join, the rows/columns will remain.

-- In query 3 you filtered with IS NULL. Which table did that NULL
-- come from, and why is it NULL?
-- player game stats. Because when doing a left join, some columns might not have equivalents

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- LEFT JOIN: Joins two tables together, and keeps anything that wouldn't be able to join otherwise.


-- Export: Takes a project file and compiles it into one file format or another

