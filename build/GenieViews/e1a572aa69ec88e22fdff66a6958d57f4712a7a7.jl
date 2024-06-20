# Genie_11109451497930922770 

function func_50bef766a6b21d65077ad8ee4ab653c265991cea(;
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
                        Genie.Renderer.Html.form(htmlsourceindent = "4");
                    ]
                end
            ]
        end
    ]
end
