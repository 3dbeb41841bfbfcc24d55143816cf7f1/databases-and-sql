db=movies

echo "== Listing movies directors =="
psql -d $db -f queries/movies_directors.sql

echo "== Listing movies actors =="
psql -d $db -f queries/movies_actors.sql

echo "== Listing actors in Star Wars =="
psql -d $db -f queries/actors_in_star_wars.sql

echo "== Listing movies actor count =="
psql -d $db -f queries/movies_actor_count.sql

echo "== Listing movies directed by Stephen Spielberg =="
psql -d $db -f queries/movies_directed_by_ss.sql

echo "== Listing movies staring Harrison Ford =="
psql -d $db -f queries/movies_staring_hf.sql

echo "== Listing movies directed by Stephen Spielberg and staring Harrison Ford =="
psql -d $db -f queries/movies_directed_by_ss_and_staring_hf.sql
