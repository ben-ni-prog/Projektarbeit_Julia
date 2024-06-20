# Projektarbeit-Julia
SQLite Datenbank, bearbeitbar über Webanwendung zur erstellung einer To-Do-Liste für eine Mensa
#-----------------------------------------------------------------------------------------------------------
This web app has been generated using Julia and the Genie.Generator package with the newapp_webservice function. 
The package documentation can be found here: 
https://docs.juliahub.com/Genie/8eazC/1.7.2/API/generator.html

The webpage has been designed with the GenieFrameworks package:
https://genieframework.com/
https://docs.juliahub.com/General/Genie/stable/

For database functionalities, the packages SQLite and DataFrames have been used:
https://juliadatabases.org/SQLite.jl/stable/
https://docs.juliahub.com/DataFrames/AR9oZ/0.21.5/

To start the Programm, please follow the next steps:
1. run the files db_setup and App.jl
2. in the terminal, enter:
    using Genie
    Genie.loadapp()
    up()
3. open the following link in your browser: http://127.0.0.1:8000/

The modified files are restricted to the routes.jl and App.jl files and the files contained within folder db. 
Functionalities and explanations for this can be found within the files respectively.
routes.jl is not used anymore
