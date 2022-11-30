using Pkg

Pkg.add("SQLite");
Pkg.add("DataFrames");

using SQLite; 
using DataFrames;

db = SQLite.DB("data/example.sqlite"); #Database Connect
con = DBInterface; #connection

df = con.execute(db, 'SELECT * FROM example") |> DataFrame; #To list from example

