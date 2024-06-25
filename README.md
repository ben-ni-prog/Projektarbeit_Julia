# Projektarbeit-Julia
Interaktive SQLite Datenbank mit anbindung an eine Webpage zur erstellung einer To-Do-Liste für eine Mensa
#-----------------------------------------------------------------------------------------------------------

# Install
To run the program, please install the following packages:

add Genie

add GenieFramework

add Inflector

add JSON

add SQLite

add DataFrames

#-----------------------------------------------------------------------------------------------------------

# General Info
This web app has been generated using Julia and the Genie.Generator package with the newapp_webservice() function. 
The package documentation can be found here: 
https://docs.juliahub.com/Genie/8eazC/1.7.2/API/generator.html

The webpage has been designed with the GenieFrameworks package:
https://genieframework.com/
https://docs.juliahub.com/General/Genie/stable/

For the database the packages SQLite and DataFrames have been used:
https://juliadatabases.org/SQLite.jl/stable/
https://docs.juliahub.com/DataFrames/AR9oZ/0.21.5/


To start the Programm, please follow the next steps:
1. run the file app.jl
2. in the terminal, enter:
   
        using Genie

        Genie.loadapp()

        up()
   
3. open the following link in your browser: http://127.0.0.1:8000/

The modified files are restricted to the app.jl file and db_setup.jl file in the db folder. db_setup is used to create and connect to a SQLite database. app.jl contains all the code for design and usability of the webpage.
Further functionalities and detailed explanations for these can be found within the files, respectively.

#-----------------------------------------------------------------------------------------------------------

# Sources

Genie-------------------------------------------------------------------------------------------------------

•	https://learn.genieframework.com/docs/guides/  Official Genie Webpage including tutorials etc., accessed on 25.06.2024.

•	https://www.freecodecamp.org/news/how-to-build-web-apps-in-julia/ Setup web application using Genie.Generator.newapp_webservice,  accessed on 18.06.2024.

SQLite------------------------------------------------------------------------------------------------------

•	https://juliadatabases.org/SQLite.jl/stable/ Package documentation including usage examples, accessed on 20.06.2024

•	https://www.geeksforgeeks.org/working-with-databases-in-julia/ SQLite introduction and usage examples, accessed on 20.06.2024

Information obtained through conversations with Microsoft Copilot on various dates-----------------

•	12.06.2024

You
in the following julia code using the GenieFramework package i am displaying two links to other pages. Please change the code in a way that these links are displayed in separate lines: 
route("/") do
    [ h4("Welcome to the number analysis module"),
      a("Numbers form", href="/form"),
      a("Reactive Form", href="/reactive")
    ]
end


Copilot: Sure, I can help with that. In Julia, you can use the br() function from the GenieFramework to add a line break between the links. Here’s how you can modify your code:
route("/") do
    [ h4("Welcome to the number analysis module"),
      a("Numbers form", href="/form"),
      br(),
      a("Reactive Form", href="/reactive")
    ]
end
In this modified code, br() creates a line break, which will display the links on separate lines. Let me know if you need further assistance! 😊


•	22.06.2024

You (22.06.24)
Can i do this?: SQLite.execute(db, "UPDATE Tasks SET status = '1' WHERE task=df_selection.task, author=df_selection.author, date=df_selection.date")
Copilot
Usingthe web
The SQL query you’re trying to execute seems to be trying to update a row in the Tasks table where the task, author, and date match those of df_selection. However, it appears you’re trying to use Julia variables directly in a SQL query, which won’t work as expected.
You should use parameterized queries to prevent SQL injection attacks and to correctly format the variables. Here’s how you can do it:
Julia
using SQLite

#Assuming `db` is your SQLite database connection and `df_selection` is your DataFrame
SQLite.execute(db, "UPDATE Tasks SET status = '1' WHERE task = ? AND author = ? AND date = ?", (df_selection.task, df_selection.author, df_selection.date))
AI-generated code. Review and use carefully. More info on FAQ.
In this code, the ? are placeholders that SQLite will replace with the values from the tuple (df_selection.task, df_selection.author, df_selection.date). This ensures that the values are correctly formatted and safely inserted into the SQL query.
Please replace df_selection.task, df_selection.author, and df_selection.date with the actual values you want to use.
Let me know if you need further assistance! 😊


