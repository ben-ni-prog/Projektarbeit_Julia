# Projektarbeit-Julia
SQLite Datenbank, bearbeitbar über Webanwendung zur erstellung einer To-Do-Liste für eine Mensa
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

The modified files are restricted to the app.jl file and db_setup.jl file in the db folder. 
Functionalities and explanations for these can be found within the files, respectively.
