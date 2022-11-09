# Step 1: ]
# Step 2: pkg> add HTTP Gumbo AbstractTrees
# Step 3: Julia> using HTTP, Gumbo, AbstractTrees
# Set cookies with web scaping

using HTTP, Gumbo

url = https://staging.example.com 

r = HTTP.request("GET", url; cookies=Dict("foo"=>123))
