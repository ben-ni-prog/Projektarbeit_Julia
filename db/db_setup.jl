#--------------------------------------------------------------------------
#In this file the structure of the database and the tables contained within is defined
#--------------------------------------------------------------------------
module DB_setup

export db

#import package SQLite, Dates
using SQLite, Dates

#connect to database(ToDo_list)
db = SQLite.DB("ToDo_list")

#create the necessary tables
SQLite.execute(db,"CREATE TABLE IF NOT EXISTS Tasks(
    task TEXT,          
    author TEXT,
    due_date DATE,
    status INTEGER
    )"
    #status: 0 = to do; 1 = completed ==> boolean
)

end             #of Module db_setup