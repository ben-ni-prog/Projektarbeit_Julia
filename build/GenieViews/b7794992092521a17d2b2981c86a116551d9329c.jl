# Genie_9274329317847511507 

function func_fcad78288ca68befbe8177b14ae378007f953e1c(;
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
                q__tab(label = "Home", name = "home", htmlsourceindent = "3")
                q__tab(label = "To-Do-List", name = "table", htmlsourceindent = "3")
                q__tab(label = "Submit", name = "submit", htmlsourceindent = "3")
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
                            class = "bg-white border-primary shadow-2 p-3 st-col col",
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
                                        """This website gives an overview of things that need to get done for the smooth operations of the StuCafe.""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """In order to get further insight into all the tasks that need to get completed, please jump to "To-Do-List".""";
                                    ]
                                end
                                Genie.Renderer.Html.p(
                                    class = "text-black",
                                    htmlsourceindent = "5",
                                ) do
                                    [
                                        """To add new tasks, please jump to "Submit".""";
                                    ]
                                end
                            ]
                        end;
                    ]
                end
                q__tab__panel(name = "table", htmlsourceindent = "3") do
                    [
                        q__table(
                            bordered = "",
                            htmlsourceindent = "4",
                            title = "To-Do-List",
                            flat = "",
                            ;
                            NamedTuple{(
                                Symbol("v-model"),
                                Symbol("row-key"),
                                Symbol(":columns"),
                                Symbol(":data"),
                            )}((
                                "Table_data",
                                "__id",
                                "Table_data.columns",
                                "Table_data.data",
                            ))...,
                        );
                    ]
                end
                q__tab__panel(name = "submit", htmlsourceindent = "3") do
                    [
                        Genie.Renderer.Html.div(
                            class = "bg-white border-primary shadow-2 st-col col",
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
                                        """Enter the data for the new elements on the To-Do-List below. 
                                              Upon clicking the "Submit"-button, the values will be added to the database."""
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
                                                        "Text_text !== ''",
                                                        "Text_text = ''",
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
                                                        "Text_text !== ''",
                                                        "Text_text = ''",
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
                                    class = "q-mr-sm",
                                    htmlsourceindent = "5",
                                    color = "primary",
                                    ;
                                    NamedTuple{(Symbol("v-on:click"),)}((
                                        "Button_process = true",
                                    ))...,
                                ) do
                                    [
                                        q__tooltip(htmlsourceindent = "6") do
                                            [
                                                """Submit task""";
                                            ]
                                        end;
                                    ]
                                end
                            ]
                        end;
                    ]
                end
            ]
        end
    ]
end
