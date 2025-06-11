# Connect to your PostgreSQL pod
kubectl exec -it postgresql-0 -n postgres -- psql -U postgres

# Inside psql, run these commands (if you haven't already)
CREATE DATABASE n8ndb;
CREATE USER n8nuser WITH ENCRYPTED PASSWORD 'n8npassword_here';
GRANT ALL PRIVILEGES ON DATABASE n8ndb TO n8nuser;
\q
