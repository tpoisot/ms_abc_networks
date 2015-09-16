#! /usr/bin/env julia

using DataFrames
using SQLite

db = SQLiteDB("../data/abc.sqlite")

# Results
r_query = "SELECT substr(name, 11, 20) AS network, type, p, c, e, d FROM (SELECT * FROM scores INNER JOIN (SELECT simuls.rowid AS rid, p, c, e FROM simuls) ON rid = scores.sid CROSS JOIN (SELECT data.rowid AS nid, name, type FROM data) ON eid = nid) ORDER BY name;"

res = SQLite.query(db, r_query)
res = DataFrame(res.values, convert(Vector{Symbol}, res.colnames))

SQLite.close(db)

writetable("../data/flatfile.dat", res, separator = '\t', header = true)
