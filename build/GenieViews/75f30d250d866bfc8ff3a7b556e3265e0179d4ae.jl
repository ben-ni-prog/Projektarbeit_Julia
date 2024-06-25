# Genie_17853126154778942567 

function func_4d677822537ea7870a7b329c067659ea45db3c41(;
    context = Genie.Renderer.vars(:context),
    model = Genie.Renderer.vars(:model),
)

    [
        q__tabs(
            class = "bg-primary text-white shadow-2",
            htmlsourceindent = "2",
            ;
            NamedTuple{(Symbol("v-model"), Symbol("inline-label"))}((
                "tab_selected",
                "",
            ))...,
        ) do
            [
                q__tab(
                    label = "Home",
                    name = "home",
                    icon = "home",
                    htmlsourceindent = "3",
                )
                q__tab(
                    label = "To-Do-List",
                    name = "table",
                    icon = "table_chart",
                    htmlsourceindent = "3",
                )
                q__tab(
                    label = "Completed Tasks",
                    name = "completed",
                    icon = "checklist",
                    htmlsourceindent = "3",
                )
                q__tab(
                    label = "Submit new Tasks",
                    name = "submit",
                    icon = "add",
                    htmlsourceindent = "3",
                )
                q__tab(
                    label = "Edit Tasks",
                    name = "edit",
                    icon = "edit",
                    htmlsourceindent = "3",
                )
            ]
        end
        q__tab__panels(
            animated = "",
            htmlsourceindent = "2",
            ;
            NamedTuple{(
                Symbol("v-model"),
                Symbol("transition-next"),
                Symbol("transition-prev"),
            )}(("tab_selected", "scale", "scale"))...,
        ) do
            [
                q__tab__panel(name = "home", htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-primary",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Home""";
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """This website gives an insight to the database containing the tasks of a cantine and enables interactions with the database.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """On this tab, below you can get insight into the most urgent tasks.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """In order to get further insight into all the tasks that need to get completed, please go to "To-Do-List".""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """To add new tasks to the To-Do-List, please go to "Submit New Tasks".""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Under the tab "Completed Tasks" you can see a list of all tasks that have been marked as complete and clear the list of completed tasks.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """To mark single tasks as completed or delete them from the list, please go to "Edit Tasks".""";
                                    ]
                                end
                            ]
                        end
                        Genie.Renderer.Html.br(htmlsourceindent = "4")
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-primary",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Tasks due next""";
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Shows the five tasks that are due next.""";
                                    ]
                                end
                                q__btn(
                                    label = "Refresh",
                                    icon = "autorenew",
                                    color = "primary",
                                    class = "q-mr-sm",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(
                                        Symbol(":loading"),
                                        Symbol(":percentage"),
                                        Symbol("v-on:click"),
                                    )}((
                                        "Button_refresh",
                                        "Button_refresh_progress",
                                        "Button_refresh = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Load changes to lists""";
                                            ]
                                        end;
                                    ]
                                end
                                q__table(
                                    bordered = "",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(
                                        Symbol("v-model"),
                                        Symbol("row-key"),
                                        Symbol(":columns"),
                                        Symbol(":data"),
                                    )}((
                                        "Urgent_data",
                                        "__id",
                                        "Urgent_data.columns",
                                        "Urgent_data.data",
                                    ))...,
                                )
                            ]
                        end
                    ]
                end
                q__tab__panel(name = "table", htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-primary",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """To-Do-List""";
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Shows all tasks in the To-Do-List, sorted by their due date.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """After adding or editing tasks, please click the refresh button to see the changes.""";
                                    ]
                                end
                                q__btn(
                                    label = "Refresh",
                                    icon = "autorenew",
                                    color = "primary",
                                    class = "q-mr-sm",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(
                                        Symbol(":loading"),
                                        Symbol(":percentage"),
                                        Symbol("v-on:click"),
                                    )}((
                                        "Button_refresh",
                                        "Button_refresh_progress",
                                        "Button_refresh = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Load changes to lists""";
                                            ]
                                        end;
                                    ]
                                end
                                q__table(
                                    bordered = "",
                                    htmlsourceindent = "5",
                                    flat = "",
                                    ;
                                    NamedTuple{(
                                        Symbol(":pagination"),
                                        Symbol("v-model"),
                                        Symbol("row-key"),
                                        Symbol(":columns"),
                                        Symbol(":data"),
                                    )}((
                                        "Table_pagination",
                                        "Tasks_data",
                                        "__id",
                                        "Tasks_data.columns",
                                        "Tasks_data.data",
                                    ))...,
                                )
                            ]
                        end;
                    ]
                end
                q__tab__panel(name = "completed", htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                            ;
                            NamedTuple{(Symbol("v-show"),)}(("show_clear",))...,
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-red",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-show"),)}(("show_confirm",))...,
                                ) do
                                    [
                                        """Attention!""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-show"),)}(("show_confirm",))...,
                                ) do
                                    [
                                        """You are about to permanently delete all tasks marked complete from the Database.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-show"),)}(("show_confirm",))...,
                                ) do
                                    [
                                        """Do you want to proceed?""";
                                    ]
                                end
                                q__chip(
                                    icon = "delete",
                                    htmlsourceindent = "5",
                                    color = "red",
                                    clickable = "",
                                    ;
                                    NamedTuple{(
                                        Symbol("v-show"),
                                        Symbol("v-on:click"),
                                    )}(("show_confirm", "Chip_delete = true"))...,
                                ) do
                                    [
                                        """Yes, proceed""";
                                    ]
                                end
                                q__chip(
                                    icon = "arrow_back",
                                    htmlsourceindent = "5",
                                    color = "green",
                                    clickable = "",
                                    ;
                                    NamedTuple{(
                                        Symbol("v-show"),
                                        Symbol("v-on:click"),
                                    )}(("show_confirm", "Chip_save = true"))...,
                                ) do
                                    [
                                        """No, go back""";
                                    ]
                                end
                                q__chip(
                                    icon = "delete",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-show"),)}((
                                        "show_clear_success",
                                    ))...,
                                ) do
                                    [
                                        """All entries marked completed have been deleted.""";
                                    ]
                                end
                            ]
                        end
                        Genie.Renderer.Html.br(htmlsourceindent = "4")
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-primary",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Completed Tasks""";
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Shows all completed tasks in the database, sorted by their due date.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """After adding or editing tasks, please click the refresh button to see the changes.""";
                                    ]
                                end
                                q__btn(
                                    label = "Refresh",
                                    icon = "autorenew",
                                    color = "primary",
                                    class = "q-mr-sm",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(
                                        Symbol(":loading"),
                                        Symbol(":percentage"),
                                        Symbol("v-on:click"),
                                    )}((
                                        "Button_refresh",
                                        "Button_refresh_progress",
                                        "Button_refresh = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Load changes to lists""";
                                            ]
                                        end;
                                    ]
                                end
                                q__table(
                                    bordered = "",
                                    htmlsourceindent = "5",
                                    flat = "",
                                    ;
                                    NamedTuple{(
                                        Symbol(":pagination"),
                                        Symbol("v-model"),
                                        Symbol("row-key"),
                                        Symbol(":columns"),
                                        Symbol(":data"),
                                    )}((
                                        "Table_pagination",
                                        "Completed_data",
                                        "__id",
                                        "Completed_data.columns",
                                        "Completed_data.data",
                                    ))...,
                                )
                                q__btn(
                                    label = "Clear all",
                                    icon = "clear_all",
                                    class = "q-mr-sm",
                                    color = "red",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_clear = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Delete all completed tasks from the database""";
                                            ]
                                        end;
                                    ]
                                end
                            ]
                        end
                    ]
                end
                q__tab__panel(name = "submit", htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-primary",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Submit""";
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Enter the data for the new tasks displayed on the To-Do-List in the textfields below.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Upon clicking the "Submit"-button, the values will be added to the database.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """To display the changes in the To-Do-List, please first refresh the tables""";
                                    ]
                                end
                                q__input(
                                    label = "Task",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}(("Task_text",))...,
                                ) do
                                    [
                                        Genie.Renderer.Html.template(
                                            htmlsourceindent = "6",
                                            ;
                                            NamedTuple{(Symbol("v-slot:append"),)}((
                                                "",
                                            ))...,
                                        ) do
                                            [
                                                q__icon(
                                                    name = "close",
                                                    class = "cursor-pointer",
                                                    htmlsourceindent = "7",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("v-if"),
                                                        Symbol("v-on:click"),
                                                    )}((
                                                        "Task_text !== ''",
                                                        "Task_text = ''",
                                                    ))...,
                                                );
                                            ]
                                        end;
                                    ]
                                end
                                q__input(
                                    label = "Author",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}(("Author_text",))...,
                                ) do
                                    [
                                        Genie.Renderer.Html.template(
                                            htmlsourceindent = "6",
                                            ;
                                            NamedTuple{(Symbol("v-slot:append"),)}((
                                                "",
                                            ))...,
                                        ) do
                                            [
                                                q__icon(
                                                    name = "close",
                                                    class = "cursor-pointer",
                                                    htmlsourceindent = "7",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("v-if"),
                                                        Symbol("v-on:click"),
                                                    )}((
                                                        "Author_text !== ''",
                                                        "Author_text = ''",
                                                    ))...,
                                                );
                                            ]
                                        end;
                                    ]
                                end
                                q__input(
                                    label = "Due date",
                                    filled = "",
                                    htmlsourceindent = "5",
                                    clearable = "",
                                    bordercolor = "primary",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}((
                                        "Datefield_due_date",
                                    ))...,
                                ) do
                                    [
                                        q__icon(
                                            name = "event",
                                            class = "cursor-pointer",
                                            style = "height: 100%;",
                                            htmlsourceindent = "6",
                                        ) do
                                            [
                                                q__popup__proxy(
                                                    htmlsourceindent = "7",
                                                    cover = "",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("transition-hide"),
                                                        Symbol("transition-show"),
                                                    )}(("scale", "scale"))...,
                                                ) do
                                                    [
                                                        q__date(
                                                            mask = "YYYY-MM-DD",
                                                            htmlsourceindent = "8",
                                                            ;
                                                            NamedTuple{(
                                                                Symbol("today-btn"),
                                                                Symbol("v-model"),
                                                                Symbol("no-unset"),
                                                            )}((
                                                                "",
                                                                "Datefield_due_date",
                                                                "",
                                                            ))...,
                                                        );
                                                    ]
                                                end;
                                            ]
                                        end;
                                    ]
                                end
                                q__btn(
                                    label = "Submit",
                                    icon = "add_task",
                                    class = "q-mr-sm",
                                    color = "primary",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_submit = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Submit new task""";
                                            ]
                                        end;
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                q__chip(
                                    icon = "done",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol(":label"), Symbol("v-show"))}((
                                        "success_message",
                                        "show_element",
                                    ))...,
                                )
                            ]
                        end;
                    ]
                end
                q__tab__panel(name = "edit", htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                        ) do
                            [
                                Genie.Renderer.Html.h4(
                                    class = "text-primary",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Delete tasks or move them to completed""";
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Enter the task ID-number that should be edited. 
                                            Afterwards, click the "Delete" or "Complete" button."""
                                    ]
                                end
                                q__input(
                                    label = "Task-ID",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}(("ID_text",))...,
                                ) do
                                    [
                                        Genie.Renderer.Html.template(
                                            htmlsourceindent = "6",
                                            ;
                                            NamedTuple{(Symbol("v-slot:append"),)}((
                                                "",
                                            ))...,
                                        ) do
                                            [
                                                q__icon(
                                                    name = "close",
                                                    class = "cursor-pointer",
                                                    htmlsourceindent = "7",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("v-if"),
                                                        Symbol("v-on:click"),
                                                    )}((
                                                        "ID_text !== ''",
                                                        "ID_text = ''",
                                                    ))...,
                                                );
                                            ]
                                        end;
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                q__btn(
                                    label = "Delete",
                                    icon = "delete",
                                    class = "q-mr-sm",
                                    color = "red",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_delete = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Delete entry""";
                                            ]
                                        end;
                                    ]
                                end
                                q__btn(
                                    label = "Edit",
                                    icon = "edit",
                                    class = "q-mr-sm",
                                    color = "orange",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_edit = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Edit entry""";
                                            ]
                                        end;
                                    ]
                                end
                                q__btn(
                                    label = "Complete",
                                    icon = "check_circle_outline",
                                    class = "q-mr-sm",
                                    color = "green",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_complete = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Mark entry as completed""";
                                            ]
                                        end;
                                    ]
                                end
                                Genie.Renderer.Html.br(htmlsourceindent = "5")
                                q__chip(
                                    icon = "done",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol(":label"), Symbol("v-show"))}((
                                        "completed_message",
                                        "show_completed",
                                    ))...,
                                )
                                q__chip(
                                    icon = "delete_outline",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol(":label"), Symbol("v-show"))}((
                                        "delete_message",
                                        "show_delete",
                                    ))...,
                                )
                                q__chip(
                                    icon = "error",
                                    htmlsourceindent = "5",
                                    color = "red",
                                    ;
                                    NamedTuple{(Symbol(":label"), Symbol("v-show"))}((
                                        "error_message",
                                        "show_error",
                                    ))...,
                                )
                                q__chip(
                                    icon = "done",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol(":label"), Symbol("v-show"))}((
                                        "edited_message",
                                        "show_edit_submit",
                                    ))...,
                                )
                            ]
                        end
                        Genie.Renderer.Html.br(htmlsourceindent = "4")
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                            ;
                            NamedTuple{(Symbol("v-show"),)}(("show_edit_selection",))...,
                        ) do
                            [
                                q__icon(
                                    name = "close",
                                    class = "cursor-pointer",
                                    style = "font-size: 1.8em; position: absolute; top: 11.9em; right: 0.8em;",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "show_edit_selection =! show_edit_selection",
                                    ))...,
                                )
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Please change the values of the element on the To-Do-List to what you want. After, click the submit button.""";
                                    ]
                                end
                                q__input(
                                    label = "Task",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}((
                                        "Task_edit_text",
                                    ))...,
                                ) do
                                    [
                                        Genie.Renderer.Html.template(
                                            htmlsourceindent = "6",
                                            ;
                                            NamedTuple{(Symbol("v-slot:append"),)}((
                                                "",
                                            ))...,
                                        ) do
                                            [
                                                q__icon(
                                                    name = "close",
                                                    class = "cursor-pointer",
                                                    htmlsourceindent = "7",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("v-if"),
                                                        Symbol("v-on:click"),
                                                    )}((
                                                        "Task_text !== ''",
                                                        "Task_text = ''",
                                                    ))...,
                                                );
                                            ]
                                        end;
                                    ]
                                end
                                q__input(
                                    label = "Author",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}((
                                        "Author_edit_text",
                                    ))...,
                                ) do
                                    [
                                        Genie.Renderer.Html.template(
                                            htmlsourceindent = "6",
                                            ;
                                            NamedTuple{(Symbol("v-slot:append"),)}((
                                                "",
                                            ))...,
                                        ) do
                                            [
                                                q__icon(
                                                    name = "close",
                                                    class = "cursor-pointer",
                                                    htmlsourceindent = "7",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("v-if"),
                                                        Symbol("v-on:click"),
                                                    )}((
                                                        "Author_text !== ''",
                                                        "Author_text = ''",
                                                    ))...,
                                                );
                                            ]
                                        end;
                                    ]
                                end
                                q__input(
                                    label = "Due date",
                                    filled = "",
                                    htmlsourceindent = "5",
                                    clearable = "",
                                    bordercolor = "primary",
                                    ;
                                    NamedTuple{(Symbol("v-model"),)}((
                                        "Datefield_due_date_edit",
                                    ))...,
                                ) do
                                    [
                                        q__icon(
                                            name = "event",
                                            class = "cursor-pointer",
                                            style = "height: 100%;",
                                            htmlsourceindent = "6",
                                        ) do
                                            [
                                                q__popup__proxy(
                                                    htmlsourceindent = "7",
                                                    cover = "",
                                                    ;
                                                    NamedTuple{(
                                                        Symbol("transition-hide"),
                                                        Symbol("transition-show"),
                                                    )}(("scale", "scale"))...,
                                                ) do
                                                    [
                                                        q__date(
                                                            mask = "YYYY-MM-DD",
                                                            htmlsourceindent = "8",
                                                            ;
                                                            NamedTuple{(
                                                                Symbol("today-btn"),
                                                                Symbol("v-model"),
                                                                Symbol("no-unset"),
                                                            )}((
                                                                "",
                                                                "Datefield_due_date_edit",
                                                                "",
                                                            ))...,
                                                        );
                                                    ]
                                                end;
                                            ]
                                        end;
                                    ]
                                end
                                q__btn(
                                    label = "Submit",
                                    icon = "add_task",
                                    class = "q-mr-sm",
                                    color = "primary",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_edit_submit = true",
                                    ))...,
                                )
                            ]
                        end
                        Genie.Renderer.Html.br(htmlsourceindent = "4")
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-5 st-col col",
                            style = "padding: 10px;",
                            htmlsourceindent = "4",
                            ;
                            NamedTuple{(Symbol("v-show"),)}(("show_selection",))...,
                        ) do
                            [
                                q__icon(
                                    name = "close",
                                    class = "cursor-pointer",
                                    style = "font-size: 1.8em; position: absolute; top: 11.9em; right: 0.8em;",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "show_selection =! show_selection",
                                    ))...,
                                )
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """Please select wether you are deleting an entry from the To-Do-List or the table of completed tasks.""";
                                    ]
                                end
                                q__btn(
                                    label = "To-Do-List",
                                    icon = "table_chart",
                                    class = "q-mr-sm",
                                    color = "primary",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_todos = true",
                                    ))...,
                                )
                                q__btn(
                                    label = "Completed Tasks",
                                    icon = "checklist",
                                    class = "q-mr-sm",
                                    color = "primary",
                                    htmlsourceindent = "5",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_completed_tasks = true",
                                    ))...,
                                )
                            ]
                        end
                    ]
                end
            ]
        end
    ]
end
