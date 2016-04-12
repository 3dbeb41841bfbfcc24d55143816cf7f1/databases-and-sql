db=superheroes

echo "== List all superheroes =="
psql -d $db -f queries/superheroes.sql
