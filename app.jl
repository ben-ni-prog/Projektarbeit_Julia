#--------------------------------------------------------------------------
#This code defines the reactive code of the webpage and creates the ui
#--------------------------------------------------------------------------

module App

#import packages GenieFramework, Genie.Router, Genie.Requests, Genie.Renderer.Html, SQLite, DataFrames, Dates
using GenieFramework, Genie.Router, Genie.Requests, Genie.Renderer.Html, Stipple, StippleUI, SQLite, DataFrames, Dates, JSON, Inflector

#import other scripts: db_setup.jl
include("db/DB_setup.jl")
using .DB_setup

@genietools




#--------------------------------------------------------------------------
#Definition for tab "home"
#--------------------------------------------------------------------------
result_urgent = DBInterface.execute(db, 
  "SELECT task, author, due_date FROM Tasks WHERE status = 0 ORDER BY due_date")  #SQL query to get all the data from Tasks marked uncompleted
df_urgent = DataFrame(result_urgent)                            #create a DataFrame of the data from Tasks
df_urgent_id = DataFrame(ID=1:length(df_urgent.task))           #create new df containing task id's matching the length of df_urgent
df_urgent = hcat(df_urgent_id, df_urgent)                       #concatenate both DataFrames with the ID in the firs row
Urgent_data = DataTable(first(df_urgent, 5))                    #update Urgent_data, wich is the variable displayed in the table, with the 5 most urgent entries in Tasks

function home_ui()
  cell(     #Cell properties--------------------------------
    class="bg-white border-primary shadow-5", 
    style="padding: 10px;",
    [       #cell content-----------------------------------
      h4(class="text-primary", "Home"),
      br(),
      p(class="text-black", "This website gives an insight to the database containing the tasks of a cantine and enables interactions with the database."),
      p(class="text-black", "On this tab, below you can get insight into the most urgent tasks."),
      p(class="text-black", "In order to get further insight into all the tasks that need to get completed, please go to \"To-Do-List\"."),
      p(class="text-black", "To add new tasks to the To-Do-List, please go to \"Submit New Tasks\"."),
      p(class="text-black", "Under the tab \"Completed Tasks\" you can see a list of all tasks that have been marked as complete and clear the list of completed tasks."),
      p(class="text-black", "To mark single tasks as completed or delete them from the list, please go to \"Edit Tasks\"."),
  ]),
  br(),
  cell(     #cell properties--------------------------------
    class="bg-white border-primary shadow-5", 
    style="padding: 10px;",
    [       #cell content-----------------------------------
      h4(class="text-primary", "Tasks due next"),
      br(),
      p(class="text-black","Shows the five tasks that are due next."),
        #refresh button to update entries in all tables
      btn(
      "Refresh", 
      icon = "autorenew", 
      color = "primary",
      class = "q-mr-sm",
      [tooltip("Load changes to lists")],     #message displayed when hovering over the button 
      loading = :Button_refresh,              #reactive variable that starts button process
      percentage = :Button_refresh_progress,  #reactive variable that starts button animation
      @click(:Button_refresh)
      ),  
        #to-do-list table showing the next 5 upcoming tasks
      table(
        :Urgent_data,             #collect data from reactive variable Urgent_data               
        title = false             #no title
      )
  ])
end       #of function home_ui


#--------------------------------------------------------------------------
#Definition for tab "submit new tasks", where new database entries can be created
#--------------------------------------------------------------------------

function submit_ui()
  cell(       #Cell properties--------------------------------
    class="bg-white border-primary shadow-5",
    style="padding: 10px;",
    [         #Cell content-----------------------------------
      h4(class="text-primary", "Submit"),
      br(),
      p(class="text-black","Enter the data for the new tasks displayed on the To-Do-List in the textfields below."), 
      p(class="text-black","Upon clicking the \"Submit\"-button, the values will be added to the database."),
      p(class="text-black","To display the changes in the To-Do-List, please first refresh the tables"),
        #Text-input field for task
      textfield(
        "Task",
        :Task_text,
        [
          template(                         #x on right side of input field to delete input
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
        #Text-input field for author
      textfield(
        "Author",
        :Author_text,
        [
          template(                               #x on right side of input field to delete input
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
        #Date-input field for date
      datefield(
        "Due date",
        :Datefield_due_date,
        datepicker_props = Dict(:todaybtn => true, :nounset => true),   #Include calendar to pick date
        textfield_props = Dict(:bordercolor => "primary"),              #set calendar color to primary
      ),
        #Button to start submit process, that adds entries to database
      btn(
        "Submit", 
        color = "primary", 
        class = "q-mr-sm", 
        icon = "add_task",
        [tooltip("Submit new task")],   #message displayed when hovering over the button
        @click(:Button_submit)
      ),
      br(),
        #display message when submit new task was completed successfully
      chip(
        label = (:success_message), 
        icon = "done",
        @showif("show_element")   #only show after submit button was clicked and button process has completed
      )
  ])
end       #of function submit_ui

#create variables used to get the values of the input fields when submitting the new task
  task = "Placeholder"
  author = "Placeholder"
  due_date = "Placeholder"

#--------------------------------------------------------------------------
#Definition for tab "to-do-list", where the table containing all uncompleted tasks in the db gets displayed
#--------------------------------------------------------------------------
result_tasks = DBInterface.execute(db, 
  "SELECT task, author, due_date FROM Tasks WHERE status = 0 ORDER BY due_date")   #SQL query to get all the data from Tasks marked uncompleted
df_tasks = DataFrame(result_tasks)                                #create a DataFrame of the data from Tasks
df_tasks_id = DataFrame(ID=1:length(df_tasks.task))               #create new df containing task id's matching the length of df_tasks
df_tasks = hcat(df_tasks_id, df_tasks)                            #concatenate both DataFrames with the ID in the firs row
Tasks_data = DataTable(df_tasks)                                  #update Table_data with new entries in db

function table_ui()
  cell(       #Cell properties--------------------------------
    class="bg-white border-primary shadow-5",
    style="padding: 10px;",
    [         #Cell content-----------------------------------
      h4(class="text-primary", "To-Do-List"),
      br(),
      p(class="text-black","Shows all tasks in the To-Do-List, sorted by their due date."),
      p(class="text-black","After adding or editing tasks, please click the refresh button to see the changes."),
        #refresh button to update entries in all tables
      btn(
        "Refresh", 
        icon = "autorenew", 
        color = "primary",
        class = "q-mr-sm",
        [tooltip("Load changes to lists")],     #message displayed when hovering over the button
        loading = :Button_refresh,              #reactive variable that starts button process
        percentage = :Button_refresh_progress,  #reactive variable that starts button animation
        @click(:Button_refresh)
      ),
        #to-do-list table
      table(
        :Tasks_data,                      #collect data from reactive variable Tasks_data
        pagination = :Table_pagination,   #reactive variable to set how many datapoints are listed per page               
        title = false,                    #no title
      )
  ])
end       #of function table_ui

#--------------------------------------------------------------------------
#Definition for tab "completed tasks", where the completed tasks are saved
#--------------------------------------------------------------------------
result_completed = DBInterface.execute(db, "SELECT task, author, due_date FROM Tasks WHERE status = 1 ORDER BY due_date") #SQL query to get all the data from Completed
df_completed = DataFrame(result_completed)                       #create a DataFrame of the data from Completed
df_completed_id = DataFrame(ID=1:length(df_completed.task))     #create new df containing task id's matching the length
df_completed = hcat(df_completed_id, df_completed)              #concatenate both DataFrames
Completed_data = DataTable(df_completed)                        #update Table_data with new entries in db

function completed_ui()
    #cell containing confirmation question and buttons for clearing tasks
  cell(       #Cell properties--------------------------------
    class="bg-white border-primary shadow-5", 
    style="padding: 10px;",
    @showif("show_clear"),    #only show the cell after clear button was clicked
    [         #cell content-----------------------------------
      h4(class="text-red",
        @showif("show_confirm"),    #only show when delete confirmation should be displayed 
        "Attention!"
      ),
      p(class="text-black", 
        @showif("show_confirm"),    #only show when delete confirmation should be displayed 
        "You are about to permanently delete all tasks marked complete from the Database."
      ),
      p(class="text-black", 
        @showif("show_confirm"),    #only show when delete confirmation should be displayed 
        "Do you want to proceed?"
        ),
      chip(     #clickable chip, that proceeds with deletion process
        "Yes, proceed",
        icon = "delete",
        color = "red",
        clickable = true,         #make chip clickable
        @click(:Chip_delete),     #reactive variable that starts process when clicked
        @showif("show_confirm")   #only show when delete confirmation should be displayed 
      ),
      chip(     #clickable chip, that stops deletion process
        "No, go back",            
        icon = "arrow_back",
        color = "green",
        clickable = true,         #make chip clickable
        @click(:Chip_save),       #reactive variable that starts process when clicked
        @showif("show_confirm")   #only show when delete confirmation should be displayed 
      ),
      chip(     #chip containing confirmation message after succesful deletion process
        "All entries marked completed have been deleted.",
        icon = "delete",
        @showif("show_clear_success") #only show, after deletion complete
      )
  ]),
  br(),
    #main cell of the ui, displays the table with completed tasks and refresh and clear buttons
  cell(       #Cell properties--------------------------------
    class="bg-white border-primary shadow-5", 
    style="padding: 10px;",
    [         #Cell content-----------------------------------
      h4(class="text-primary", "Completed Tasks"),
      br(),
      p(class="text-black","Shows all completed tasks in the database, sorted by their due date."),
      p(class="text-black","After adding or editing tasks, please click the refresh button to see the changes."),
        #refresh button to update entries in all tables
      btn(
        "Refresh", 
        icon = "autorenew", 
        color = "primary",
        class = "q-mr-sm",
        [tooltip("Load changes to lists")],     #message displayed when hovering over the button
        loading = :Button_refresh,              #variable to start button process
        percentage = :Button_refresh_progress,  #variable to start button animation
        @click(:Button_refresh)
      ),   
        #to-do-list table
      table(
        :Completed_data,                  #collect data from reactive variable Table_data
        pagination = :Table_pagination,   #set how many datapoints are listed per page
        flat = true,                      
        bordered = true,                  
        title = false
      ),
        #clear button to delete all entries in the database marked as completed
      btn(
        "Clear all", 
        icon = "clear_all", 
        color = "red",
        class = "q-mr-sm",
        [tooltip("Delete all completed tasks from the database")],  #message displayed when hovering over the button
        @click(:Button_clear)
      ),   
  ])
end       #of function completed_ui

#--------------------------------------------------------------------------
#Definition for tab "edit task", where tasks can get marked as done or deleted
#--------------------------------------------------------------------------
  #variables used to get value from textfields to update entries in the database
task_edit = "Placeholder"
author_edit = "Placeholder"
due_date_edit = "Placeholder"
  #create variable used to get the id number of the task that is getting edited
edit_id = 0

function edit_ui()
      #cell with entry field for task id and selection for complete/edit/delete----
  cell(       #Cell properties--------------------------------
  class="bg-white border-primary shadow-5", 
  style="padding: 10px;",
  [           #cell content-----------------------------------
    h4(class="text-primary", "Delete tasks or move them to completed"),
    br(),
    p(class="text-black","Enter the task ID-number that should be edited. 
    Afterwards, click the \"Delete\" or \"Complete\" button."),
      #Text input field for task-ID
    textfield(
      "Task-ID",
      :ID_text,
      [
        template(                               #x on right side of input field to delete input
            var"v-slot:append" = "",
            [
                icon(
                    "close",
                    @iif("ID_text !== ''"),
                    @click("ID_text = ''"),
                    class = "cursor-pointer",
                ),
            ],
        ),
      ],
    ),
    br(),
      #delete-button
    btn(
      "Delete", 
      icon = "delete", 
      color = "red",
      class = "q-mr-sm",
      [tooltip("Delete entry")],    #message displayed when hovering over the button
      @click(:Button_delete)
    ),
      #edit-button
    btn(
      "Edit", 
      icon = "edit", 
      color = "orange",
      class = "q-mr-sm",
      [tooltip("Edit entry")],    #message displayed when hovering over the button
      @click(:Button_edit)
    ),
      #complete-button
    btn(
      "Complete", 
      icon = "check_circle_outline",
      color = "green",
      class = "q-mr-sm",
      [tooltip("Mark entry as completed")],    #message displayed when hovering over the button
      @click(:Button_complete)
    ),
      #chips containing messages displayed after button processes-----------------------------
    br(),
      #diplay message when completing task was successful
    chip( #message showing succesful process of marking task as completed
      label = (:completed_message), 
      icon = "done",
      @showif("show_completed")   #only show after completed button was clicked and button process has completed
    ),
      #diplay message when deleting task was successful
    chip( #message showing task was successfully deleted
      label = (:delete_message), 
      icon = "delete_outline",
      @showif("show_delete")   #only show after delete button was clicked and button process has completed
    ),
      #diplay error message when editing task was unsuccessful
    chip( #message showing process didn't succeed
      label = (:error_message), 
      color = "red",
      icon = "error",
      @showif("show_error")   #only show after button process has resulted in an error
    ),
      #diplay message when submit new task was successful
    chip( #message showing task has been succesfully updated
      label = (:edited_message), 
      icon = "done",
      @showif("show_edit_submit")   #only show after submit button was clicked and entry has been updated succesfully
    ),
  ]),
  br(),
      #cell with textfield for updating existing tasks-----------------------------
  cell(      #Cell properties--------------------------------
      class="bg-white border-primary shadow-5", 
      style="padding: 10px;",
      @showif("show_edit_selection"),   #only show after edit button was clicked
      [        #Cell content-----------------------------------
        icon(   #x on right top corner of cell to close the selection field                
          "close",
          style = "font-size: 1.8em; position: absolute; top: 11.9em; right: 0.8em;",
          @click("show_edit_selection =! show_edit_selection"),
          class = "cursor-pointer",
        ),
        p(
          class="text-black",
          "Please change the values of the element on the To-Do-List to what you want. After, click the submit button."
        ),  
          #Text-input field for updating the task
        textfield(
          "Task",
          :Task_edit_text,
          [
            template(   #x on right side of input field to delete input
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
          #Text-input field for updating the author
        textfield(
          "Author",
          :Author_edit_text,
          [
            template(   #x on right side of input field to delete input
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
          #Date-input field for updating the due date
        datefield(
          "Due date",
          :Datefield_due_date_edit,
          datepicker_props = Dict(:todaybtn => true, :nounset => true),
          textfield_props = Dict(:bordercolor => "primary"),
        ),
        br(),
          #Edit-Submit-Button, that updates the database entry with the entered task, author and due date
        btn(
          "Submit", 
          icon = "add_task", 
          color = "primary",
          class = "q-mr-sm",
          @click(:Button_edit_submit)
        ),
  ]),
    #cell with selection for delete function---------------------------------
  cell(        #Cell properties--------------------------------
    class="bg-white border-primary shadow-5", 
    style="padding: 10px;",
    @showif("show_selection"), # only show if the delete button has been clicked
    [          #cell content-----------------------------------
      icon(   #x on right top corner of cell to close the selection field                         
        "close",
        style = "font-size: 1.8em; position: absolute; top: 11.9em; right: 0.8em;",
        @click("show_selection =! show_selection"),
        class = "cursor-pointer",
      ),
      p(
        class="text-black",
        "Please select wether you are deleting an entry from the To-Do-List or the table of completed tasks."
      ),
        #To-Do-List-Button
      btn(
        "To-Do-List", 
        icon = "table_chart", 
        color = "primary",
        class = "q-mr-sm",
        @click(:Button_todos)
      ),
        #Completed-List-Button
      btn(
        "Completed Tasks", 
        icon = "checklist", 
        color = "primary",
        class = "q-mr-sm",
        @click(:Button_completed_tasks)
      )
    ])
end       #of function edit_ui

#--------------------------------------------------------------------------
#reactive code contained within @app function
#--------------------------------------------------------------------------
@app begin
  #Page navigation tabs----------------------------------------------------
  """
    Define the reactive variable used to determin wich tab on the navigation bar
    will be displayed.
  """
        #Set navigation tabs initial selection to "home"
    @in tab_selected = "home"

  #Input fields------------------------------------------------------------
  """
    Creates reactive variables for the various input fields 
    and when these change, assigns them to another static variable.
  """
        #due date field 
    @in Datefield_due_date = ""
    @onchange Datefield_due_date begin
        App.due_date = Datefield_due_date
    end
        #task field 
    @in Task_text = ""
    @onchange Task_text begin
        App.task = Task_text
    end
        #author field
    @in Author_text = ""
    @onchange Author_text begin
        App.author = Author_text
    end
        #ID field in the edit-tab
    @in ID_text = 0
    @onchange ID_text begin
      App.edit_id = ID_text
    end
        #due date edit field 
    @in Datefield_due_date_edit = ""
    @onchange Datefield_due_date_edit begin
        App.due_date = Datefield_due_date_edit
    end
        #task edit field 
    @in Task_edit_text = ""
    @onchange Task_edit_text begin
        App.task = Task_edit_text
    end
        #author edit field
    @in Author_edit_text = ""
    @onchange Author_edit_text begin
        App.author = Author_edit_text
    end
  #Submit button-----------------------------------------------------------
  """
    Button that starts the process to submit new tasks to the Database.
  """
        #submit button input variable
    @in Button_submit = false
        #submit  success message and hiding variables
    @in show_element = false
    @out success_message = "Placeholder"
        #button process
    @onbutton Button_submit begin
          #Create the SQL query
        sql_query = "INSERT INTO Tasks (task, author, due_date, status) VALUES (?, ?, ?, ?)"
          #Execute the SQL query
        DBInterface.execute(db, sql_query, (task, author, due_date, 0))
          #Define success_message that is displayed after successful task submitting
        success_message = "Task labeled \"$task\" created successfully!"
          #Reveal submit success message
        show_element =! show_element
        sleep(5)
        show_element =! show_element
          #reset text fields
        Task_text = ""
        Author_text = ""
        Datefield_due_date = ""
    end         #of submit-button process

  #Table definitions-------------------------------------------------------
  """
    Creates variables that link the Database entries to the tables displayed on 
    the webpage.
    To see how they are defined, check the Refresh-Button section.
  """
      #To-Do-List table parameters
    @in Tasks_data = DataTable(df_tasks)
    @in Completed_data = DataTable(df_completed)
    @in Urgent_data = DataTable(df_urgent)
    @in Table_pagination = DataTablePagination(rows_per_page = 10)
  
  #Refresh Button----------------------------------------------------------
  """
    Button that starts the process to refresh the tables displaying the Database entries.
    After the database has been manipulated, these changes will only be displayed
    once one of the refresh buttons was clicked to start the Button_refresh progress.
  """
      #Refresh Button variables
    @in Button_refresh = false
    @in Button_refresh_progress = 0.0
      #Button process
    @onbutton Button_refresh begin
        #display loading symbol in button
      for Button_refresh_progress = 0:1:2             
        @show Button_refresh_progress
        sleep(0.5)
      end
        #update Tasks_data for the To-Do-List
      result_tasks = DBInterface.execute(db, "SELECT task, author, due_date FROM Tasks WHERE status = 0 ORDER BY due_date")   #SQL query to get the uncompleted tasks from db
      App.df_tasks = DataFrame(result_tasks)                              #create a DataFrame of the data in db
      df_tasks_id = DataFrame(ID=1:length(App.df_tasks.task))             #update df_tasks_id to new lenght
      App.df_tasks = hcat(df_tasks_id, App.df_tasks)                      #concatenate both DataFrames with id in the first row
      Tasks_data = DataTable(App.df_tasks)                                #update Table_data with new entries in db
        #update Completed_data for the completed tasks Lits
      result_completed = DBInterface.execute(db, "SELECT task, author, due_date FROM Tasks WHERE status = 1 ORDER BY due_date") #SQL query to get tasks marked completed from db
      App.df_completed = DataFrame(result_completed)                      #create a DataFrame of the data from Completed
      df_completed_id = DataFrame(ID=1:length(App.df_completed.task))     #create new df containing task id's matching the length
      App.df_completed = hcat(df_completed_id, App.df_completed)          #concatenate both DataFrames with id in the first row
      Completed_data = DataTable(App.df_completed)                        #update Completed_data with new entries in db
        #update Urgent_data for the list of next upcoming tasks on the home page
      result_urgent = DBInterface.execute(db, "SELECT task, author, due_date FROM Tasks WHERE status = 0 ORDER BY due_date")   #SQL query to get the uncompleted tasks from db
      App.df_urgent = DataFrame(result_urgent)                            #create a DataFrame of the data from Completed
      df_urgent_id = DataFrame(ID=1:length(App.df_urgent.task))           #create new df containing task id's matching the length
      App.df_urgent = hcat(df_urgent_id, App.df_urgent)                   #concatenate both DataFrames with id in the first row
      Urgent_data = DataTable(first(App.df_urgent, 5))                    #update Urgent_data with 5 most urgent new entries in db
    end       #of refresh-button process

  #Clear-Button------------------------------------------------------------
  """
    Button that starts the process which deletes all entries in the Database table Tasks
    that are marked completed.
  """
      #Clear Button variable
    @in Button_clear = false
      #hiding variable for confirmation cell of the clear all button process
    @in show_clear = false
    @in show_confirm = false
      #Clear-Button process
    @onbutton Button_clear begin
      show_clear =! show_clear
      show_confirm =! show_confirm
    end
  
  #Delete-Chip-------------------------------------------------------------
  """
    Clickable chip, that starts the process for following through with the deletion process
    of all tasks marked completed.
  """
      #Delete Chip variable
    @in Chip_delete = false
      #variable for success message
    @in show_clear_success = false
      #Delete-Chip process
    @onbutton Chip_delete begin
        #sqlite query to delete the entry from the database
      SQLite.execute(db, "DELETE FROM Tasks WHERE status = ?", (1,))
        #show success message and hide the clear cell again
      show_confirm =! show_confirm
      show_clear_success =! show_clear_success
      sleep(5)
      show_clear_success =! show_clear_success
      show_clear =! show_clear
    end

  #Safe-Chip---------------------------------------------------------------
  """
    Clickable chip, that ends the process to delete all tasks marked completed.
  """
      #Delete Chip variable
    @in Chip_save = false
      #Safe-Chip process
    @onbutton Chip_save begin
      show_clear =! show_clear
      show_confirm =! show_confirm
    end

  #Delete-Button-----------------------------------------------------------
  """
    Button that starts a process to delete the task for wich the ID-number was entered
    on the navigation tab "Edit Task".
  """
      #Delete Button variable
    @in Button_delete = false
      #hiding variables for delete cell and button feedback
    @in show_selection = false
    @in show_delete = false
    @in show_error = false
      #define message getting displayed in chips
    @out delete_message = "Placeholder"
    @out error_message = "Placeholder"
      #button process
    @onbutton Button_delete begin
      show_selection =! show_selection
    end
    
  #To-Do-List Delete-Button------------------------------------------------
  """
    Button in the selection cell for deleting a task from the database, showing after
    Delete-Button was clicked. 
    Attempts to delete the task with the given ID-number. When an error occurs, displays
    the error message, otherwise the success message. Afterwards closes the selection cell.
  """
      #To-Do-List-Delete-Button variables
    @in Button_todos = false
      #button process
    @onbutton Button_todos begin
      try #main process
          #get data from the corresponding id
        df_selection = filter(row -> row[:ID] == ID_text, App.df_tasks)
          #create string variables of the data
        delete_task = df_selection.task[1]
        delete_author = df_selection.author[1]
        delete_due_date = df_selection.due_date[1]
          #sqlite query to delete the entry from the database
        SQLite.execute(db, "DELETE FROM Tasks WHERE task = ? AND author = ? AND due_date = ?", 
                      (delete_task, delete_author, delete_due_date))
          #Define success_message that is displayed after successful task deletion
        delete_message = "Task \"$delete_task\" has been deleted."
          #Hide the extra cell with the selection buttons
        show_selection =! show_selection
          #Reveal delete success message and set textfield to initial value
        show_delete =! show_delete
        ID_text = 0
        sleep(5)
        show_delete =! show_delete
      catch e #process on error
          #Define error_message that is displayed after successful task submitting
        error_message = "Oh no! The entry with the ID-number $ID_text could either not be found or properly processed. Please try again."
          #hide selection buttons and message
        show_selection =! show_selection
          #Reveal error message and set textfield to initial value
        show_error =! show_error
        ID_text = 0
        sleep(7)
        show_error =! show_error
      end
    end           #of To-Dos-button process

  #Completed-Tasks Delete-Button-------------------------------------------
  """
    Button in the selection cell for deleting a task from the database, showing after
    Delete-Button was clicked. 
    Attempts to delete the task with the given ID-number. When an error occurs, displays
    the error message, otherwise the success message. Afterwards closes the selection cell.
  """
      #Completed-Tasks-Delete Button variable
    @in Button_completed_tasks = false
      #Button process
    @onbutton Button_completed_tasks begin
      try #main process
          #get data from the corresponding id
        df_selection = filter(row -> row[:ID] == ID_text, App.df_completed)
          #create string variables of the data
        delete_task = df_selection.task[1]
        delete_author = df_selection.author[1]
        delete_due_date = df_selection.due_date[1]
          #sqlite query to delete the entry from the database
        SQLite.execute(db, "DELETE FROM Tasks WHERE task = ? AND author = ? AND due_date = ?", 
                      (delete_task, delete_author, delete_due_date))
          #Define success_message that is displayed after successful task deletion
        delete_message = "Task \"$delete_task\" has been deleted."
          #Hide the extra cell with the selection buttons
        show_selection =! show_selection
          #Reveal delete success message and set textfield to initial value
        show_delete =! show_delete
        ID_text = 0
        sleep(5)
        show_delete =! show_delete
      catch e #Process on error
          #Define error_message that is displayed after successful task submitting
        error_message = "Oh no! The entry with the ID-number $ID_text could either not be found or properly processed. Please try again."
          #hide selection buttons and message
        show_selection =! show_selection
          #Reveal error message and set textfield to initial value
        show_error =! show_error
        ID_text = 0
        sleep(7)
        show_error =! show_error
      end
    end           #of To-Dos-button process

  #Edit-Button-------------------------------------------------------------
  """
    Button that opens a cell showing input fields to edit an existing task on the To-Do-List.
    Upon clicking, pulls the entry with the given ID-Number from the database and displays these 
    in the respective input fields.
    To submit the updated entries, the submit button is given in "Submit-Edit-Button".
  """
      #Button-edit variable
    @in Button_edit = false
      #hiding variables for edit cell and button feedback
    @in show_edit_selection = false
    @in show_edit_submit = false
      #define message getting displayed in chips
    @out edited_message = "Placeholder"
      #Edit-Button Process
    @onbutton Button_edit begin
      try
          #get data from the corresponding id
        df_selection = filter(row -> row[:ID] == ID_text, App.df_tasks)
          #Change the preset variables in the input fields to the updated values
        Task_edit_text = df_selection.task[1]
        Author_edit_text = df_selection.author[1]
        Datefield_due_date_edit = df_selection.due_date[1]
          #create string variables used in sql-query to find corresponding entry
        App.task_edit  = df_selection.task[1]
        App.author_edit = df_selection.author[1]
        App.due_date_edit = df_selection.due_date[1]
          #reveal cell containing ui to change database entry
        show_edit_selection =! show_edit_selection
      catch e
          #Define error_message that is displayed after successful task submitting
        error_message = "Oh no! The entry with the ID-number $ID_text could either not be found or properly processed. Please try again."
          #Reveal error message and set textfield to initial value
        show_error =! show_error
        ID_text = 0
        sleep(7)
        show_error =! show_error
      end
    end       #of Edit-Button process

  #Submit-Edit-Button------------------------------------------------------
  """
    Button to commit changes of a single entry that is to be edited to the database. 
  """
      #Submit Edit Button variable
    @in Button_edit_submit = false
      #Submit-Edit-Button process
    @onchange Button_edit_submit begin
      try
          #hide edit selection cell
        show_edit_selection =! show_edit_selection
          #sqlite query to update the entry according to the values entered in the cell showing the edit input fields
        SQLite.execute(db, "UPDATE Tasks SET task = ?, author = ?, due_date = ? WHERE task = ? AND author = ? AND due_date = ?", 
                      (App.task, App.author, App.due_date, App.task_edit, App.author_edit, App.due_date_edit))
          #Define success_message that is displayed after successful task submitting
        edited_message = "Task \"$Task_edit_text\" has been updated."
          #Reveal edit success message and set id textfield to initial value
        show_edit_submit =! show_edit_submit
        ID_text = 0
        sleep(5)
        show_edit_submit =! show_edit_submit
      catch e
          #hide edit functionality cell
        show_edit_selection =! show_edit_selection
          #Define error_message that is displayed after successful task submitting
        error_message = "Oh no! The entry with the ID-number $ID_text could either not be found or properly processed. Please try again."
          #Reveal error message and set textfield to initial value
        show_error =! show_error
        ID_text = 0
        sleep(7)
        show_error =! show_error
      end
    end       #of Submit-Edit-Button process

  #Complete-Button---------------------------------------------------------
  """
    Button that marks existing tasks in the database currently on the To-Do-List
    as completed.
  """
      #Complete Button variables
    @in Button_complete = false 
      #hiding variable for button feedback
    @in show_completed = false
    @in show_error = false
      #define message getting displayed in chips
    @out completed_message = "Placeholder"
      #button process
    @onbutton Button_complete begin
      try
          #get data from the corresponding id
        df_selection = filter(row -> row[:ID] == App.edit_id, App.df_tasks)
          #create string variables of the data
        completed_task = df_selection.task[1]
        completed_author = df_selection.author[1]
        completed_due_date = df_selection.due_date[1]
          #sqlite query to update the entry to completed, by setting status = 1
        SQLite.execute(db, "UPDATE Tasks SET status = 1 WHERE task = ? AND author = ? AND due_date = ?", 
                      (completed_task, completed_author, completed_due_date))
          #Define success_message that is displayed after successful task submitting
        completed_message = "Yay, task \"$completed_task\" has been completed!"
          #Reveal submit success message and set textfield to initial value
        show_completed =! show_completed
        ID_text = 0
        sleep(5)
        show_completed =! show_completed
      catch e
          #Define error_message that is displayed after successful task submitting
        error_message = "Oh no! The entry with the ID-number $ID_text could either not be found or properly processed. Please try again."
          #Reveal error message and set textfield to initial value
        show_error =! show_error
        ID_text = 0
        sleep(7)
        show_error =! show_error
      end
    end         # of complete-button process


end     #of reactive code

#--------------------------------------------------------------------------
#defining the ui-function and setup of the websites homepage
#--------------------------------------------------------------------------

function ui()
    #create the navigation tabs on top of the page to select what to display
  tabgroup(
      :tab_selected,
      inlinelabel = true,
      class = "bg-primary text-white shadow-2",
      [
          tab(name = "home", icon = "home", label = "Home"),
          tab(name = "table", icon = "table_chart",label = "To-Do-List"),
          tab(name = "completed", icon = "checklist", label = "Completed Tasks"),
          tab(name = "submit", icon = "add", label = "Submit new Tasks"),
          tab(name = "edit", icon = "edit", label = "Edit Tasks"),
      ],
  ),
    #Assign functions to the tabs, that define what is getting displayed.
    #For further insight in the UIs, check the top where they are defined
  tabpanels(
      :tab_selected,
      animated = true,
      var"transition-prev" = "scale",
      var"transition-next" = "scale",
      [
          tabpanel(name = "home", home_ui),
          tabpanel(name = "table", table_ui),
          tabpanel(name = "completed", completed_ui),
          tabpanel(name = "submit", submit_ui),
          tabpanel(name = "edit", edit_ui),
      ],
  )
end       #of function ui

#--------------------------------------------------------------------------
#setup page "/" using the function ui
#--------------------------------------------------------------------------
@page("/", ui)


end         #of module App