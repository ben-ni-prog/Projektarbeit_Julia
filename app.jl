#--------------------------------------------------------------------------
#This code defines the reactive code of the webpage and creates the ui
#--------------------------------------------------------------------------

module App

#import packages GenieFramework, Genie.Router, Genie.Requests, Genie.Renderer.Html, SQLite, DataFrames, Dates
using GenieFramework, Genie.Router, Genie.Requests, Genie.Renderer.Html, SQLite, DataFrames, Dates

#import other files: db_setup.jl
using Main.DB_setup

@genietools

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
                      @iif("Task_text !== ''"),
                      @click("Task_text = ''"),
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
                      @iif("Author_text !== ''"),
                      @click("Author_text = ''"),
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
  
  task = "Placeholder"
  author = "Placeholder"
  due_date = Dates.today()
  
  function Button_process()
    #Get data from submit form
    #task = params(:Task_text, "Placeholder")
    #author = params(:Author_text, "Placeholder")
    #due_date = params(:Datefield_due_date, Dates.today())
  
    #task = Task_text
    #author = Author_text
    #due_date = Datefield_due_date
    
    #both methods for getting values from input fields dont work, 
    
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
    @onchange Author_text begin
        author = Author_text     #--> when calling App.author in terminal, prints "Placeholder"
        println(Author_text)     #--> when typing in text field, prints correct value in terminal
        println(author)          #--> when typing in text field, prints correct value in terminal
    end
    @out author
        #submit button functionalities
    @in Button_process = false
    @onbutton Button_process begin
        Button_process()         #--> when clicking button, only commits values "Placeholder" to Database
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
