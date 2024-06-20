#--------------------------------------------------------------------------
#This code defines the reactive code of the webpage and creates the ui
#--------------------------------------------------------------------------

module App

#import packages GenieFramework, Genie.Router, Genie.Requests, Genie.Renderer.Html, SQLite, DataFrames, Dates
using GenieFramework, Genie.Router, Genie.Requests, Genie.Renderer.Html, SQLite, DataFrames, Dates

#import other files: routes.jl,  db_setup.jl, Listelements.jl
using Main.Routes,  Main.DB_setup#, Main.Listelements

@genietools

#--------------------------------------------------------------------------
#reactive code contained within @app function
#--------------------------------------------------------------------------
@app begin
        #Set tabs initial selection to "home"
    @in tab_selected = "home"
        #add todays date as starting point in datefield datepicker_prop 
    @in Datefield_due_date = ""
    @out due_date
    @onchange Datefield_due_date begin
        due_date = Datefield_due_date
    end
        #text field 
    @in Task_text = ""
    @out task
    @onchange Task_text begin
        task = Task_text
    end
    @in Author_text = ""
    #@out author
    @onchange Author_text begin
        author = Author_text
        println(Author_text)
        println(author)
    end
        #submit button functionalities
    @in Button_process = false
    @onbutton Button_process begin
        Button_process()
    end
    
    
    
        #To-Do-List table data
    result = DBInterface.execute(db, "SELECT * FROM Listelements") #SQL query to get all the data
    df = DataFrame(result)
    @out Table_data = DataTable(df)
end

#--------------------------------------------------------------------------
#defining the ui-function and setup of the websites homepage
#--------------------------------------------------------------------------
function ui()
    heading("Placeholder")
    tabgroup(
        :tab_selected,
        inlinelabel = true,
        class = "bg-primary text-white shadow-2",
        [
            tab(name = "home", label = "Home"),
            tab(name = "table", label = "To-Do-List"),
            tab(name = "submit", label = "Submit"),
        ],
    ),
    tabpanels(
        :tab_selected,
        animated = true,
        var"transition-prev" = "scale",
        var"transition-next" = "scale",
        [
            tabpanel(name = "home", home_ui),
            tabpanel(name = "table", table_ui),
            tabpanel(name = "submit", submit_ui),
        ],
    )
end

#setup page "/"
@page("/", ui)


end         #of module App