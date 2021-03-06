require  "sqlite3"
 
 if File.exists?("maindata.db")
     File.delete ("maindata.db")
 end

 db=SQLite3::Database.new("maindata.db")
 db.execute <<-SQL
    create table users(
      id integer primary key,
      email varchar,
      password varchar);
  SQL

db.execute("insert into users(email, password) values(?, ?);", ["mary@example.com" , "mary123"])
db.execute("insert into users(email, password) values(?, ?);", ["anna@example.com", "anna456"])
db.execute("insert into users(email, password) values(?, ?);", ["bob@example.com", "bob789"])

 rows=db.execute("SELECT*FROM users;")
 puts rows