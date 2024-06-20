#--------------------------------------------------------------------------
#Here, the different routes of the webpage and their layouts are defined
#--------------------------------------------------------------------------
module Routes

# import packages GenieFramework, Genie.Router, Genie.Requests, SQLite, DataFrames
using GenieFramework, Genie.Router, Genie.Requests, SQLite, DataFrames

#import other files: db_setup.jl
using Main.DB_setup

#export ui for different pages
export home_ui, table_ui, submit_ui, Button_process, task, author, due_date

#--------------------------------------------------------------------------
#Definition for tab "home"
#--------------------------------------------------------------------------
function home_ui()
  cell(class="bg-white border-primary shadow-2 p-3", [
    h4(class="text-primary", "Home"),
    br(),
    p(class="text-black", "This website gives an overview of things that need to get done for the smooth operations of the StuCafe."),
    #br(), 
    p(class="text-black", "In order to get further insight into all the tasks that need to get completed, please jump to \"To-Do-List\"."),
    #br(),
    p(class="text-black", "To add new tasks, please jump to \"Submit\".")
  ])
end


#--------------------------------------------------------------------------
#Definition for tab "submit", where new database entries can be created
#--------------------------------------------------------------------------
function submit_ui()
  cell(class="bg-white border-primary shadow-2", [
    h4(class="text-primary", "Submit"),
    br(),
    p(class="text-black","Enter the data for the new elements on the To-Do-List below. 
    Upon clicking the \"Submit\"-button, the values will be added to the database."),
      #Input field for task
    textfield(
      "Task",
      :Task_text,
      [
        template(
            var"v-slot:append" = "",
            [
                icon(
                    "close",
                    @iif("Text_text !== ''"),
                    @click("Text_text = ''"),
                    class = "cursor-pointer",
                ),
            ],
        ),
      ],
    ),
      #Input field for author
    textfield(
      "Author",
      :Author_text,
      [
        template(
            var"v-slot:append" = "",
            [
                icon(
                    "close",
                    @iif("Text_text !== ''"),
                    @click("Text_text = ''"),
                    class = "cursor-pointer",
                ),
            ],
        ),
      ],
    ),
      #Input field for date
      datefield(
        "Due date",
        :Datefield_due_date,
        datepicker_props = Dict(:todaybtn => true, :nounset => true),
        textfield_props = Dict(:bordercolor => "primary"),
    ),
      #Button to start submit process, that adds entries to database
    btn("Submit", color = "primary", class = "q-mr-sm", 
    [tooltip("Submit task")], 
    @click(:Button_process))
  ])
end

task = ""
author = ""
due_date = Dates.today()

function Button_process()
  #Get data from submit form
  #task = params(:Task_text, "Placeholder")
  #author = params(:Author_text, "Placeholder")
  #due_date = params(:Datefield_due_date, Dates.today())

  # Create the SQL query
  sql_query = "INSERT INTO Listelements (task, author, date) VALUES (?, ?, ?)"

  # Execute the SQL query
  DBInterface.execute(db, sql_query, (task, author, due_date))

  # Commit the transaction to save the changes
  SQLite.commit(db)
end

#--------------------------------------------------------------------------
#Definition for tab "table", where the database gets displayed
#--------------------------------------------------------------------------
function table_ui()
  table(
    :Table_data,
    flat = true,
    bordered = true,
    title = "To-Do-List"
  )
end

end     #of module Routes