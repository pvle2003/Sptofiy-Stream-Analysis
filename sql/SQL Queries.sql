-- top 10 artists by total streamsS
SELECT artist_name, (SUM(streams) / 1000000000) AS 'Total Streams (Billions)'
FROM clean_spotify_data
GROUP BY artist_name
HAVING released_year = 2023
ORDER BY SUM(streams) DESC
LIMIT 10;

-- most streamed songs released in 2023
SELECT track_name, artist_name, streams
FROM clean_spotify_data
WHERE released_year = 2023
ORDER BY streams DESC
LIMIT 10;

-- highly danceable songs (above 80%)
SELECT track_name, artist_name, danceability_%
FROM clean_spotify_data
WHERE danceability_% >= 80
ORDER BY danceability_% DESC;

-- average energy by artist_count
SELECT artist_name, AVG (energy_%) AS 'Average Energy'
FROM clean_spotify_data
GROUP BY artist_name
ORDER BY AVG(energy_%) DESC;

-- songs in many playlists but low streams
SELECT track_name, artist_name, in_spotify_playlists, streams
FROM clean_spotify_data
WHERE in_spotify_playlists > 100 AND streams < 50000000
ORDER BY in_spotify_playlists DESC;

-- count of songs per musical keys
SELECT key, COUNT(*) AS 'Song Count'
FROM clean_spotify_data
GROUP BY key
ORDER BY COUNT(*);

-- fastest songs (bpm)
SELECT track_name, artist_name, bpm
FROM clean_spotify_data
ORDER BY bpm DESC
LIMIT 10;

-- moodiest songs (low valence)
SELECT track_name, artist_name, valence_%
FROM clean_spotify_data
ORDER BY valence_% 
LIMIT 10;

-- most instrumental songs
SELECT track_name, artist_name, instrumentalness_%
FROM clean_spotify_data	
ORDER BY instrumentalness_% DESC
LIMIT 10;

-- top artists by avg danceability
SELECT artist_name, AVG(danceability_%) AS 'Average Danceability'
FROM clean_spotify_data
GROUP BY artist_name
ORDER BY AVG(danceability_%) DESC
LIMIT 10;

-- most "talky" songs (speechiness)_
SELECT track_name, artist_name, speechiness_%
FROM clean_spotify_data
ORDER BY speechiness_% DESC
LIMIT 10;

-- song count by release year
SELECT released_year, COUNT(*) AS 'Song Count'
FROM clean_spotify_data
GROUP BY released_year
ORDER BY released_year;

-- top songs by daily streams-to-total ratio (trending fast)
SELECT track_name, artist_name, ROUND(100 * daily / streams, 2) AS 'Daily to Total %'
FROM clean_spotify_data
WHERE streams > 0
ORDER BY ROUND(100 * daily / streams, 2) DESC
LIMIT 10;
