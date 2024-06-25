# Genie_3018518641778544533 

function func_c02c5ccef8afd2a201be4149d8ca7c3dd058f397(;
    context = Genie.Renderer.vars(:context),
    model = Genie.Renderer.vars(:model),
)

    [
        Genie.Renderer.Html.doctype()
        Genie.Renderer.Html.html(htmlsourceindent = "0") do
            [
                Genie.Renderer.Html.head(htmlsourceindent = "1") do
                    [
                        Genie.Renderer.Html.meta(charset = "utf-8", htmlsourceindent = "2")
                        Stipple.sesstoken()
                        Genie.Renderer.Html.title(htmlsourceindent = "2") do
                            [
                                """Genie App""";
                            ]
                        end
                        if isfile(
                            joinpath(
                                Stipple.Genie.config.server_document_root,
                                "css",
                                "genieapp.css",
                            ),
                        )


                            Genie.Renderer.Html.link(
                                htmlsourceindent = "2",
                                rel = "stylesheet",
                                href = "/css/genieapp.css",
                            )

                        else


                        end
                        Genie.Renderer.Html.style(htmlsourceindent = "2") do
                            [
                                """
                                      ._genie_logo {
                                        background:url('https://genieframework.com/logos/genie/logo-simple-with-padding.svg') no-repeat;
                                        background-size:40px;
                                        padding-top:22px;
                                        padding-right:10px;
                                        color:transparent !important;
                                        font-size:9pt;
                                      }
                                      ._genie .row .col-12 { width:50%; margin:auto; }
                                    """
                            ]
                        end
                    ]
                end
                Genie.Renderer.Html.body(htmlsourceindent = "1") do
                    [
                        Genie.Renderer.Html.div(
                            class = "container",
                            htmlsourceindent = "2",
                        ) do
                            [
                                Genie.Renderer.Html.div(
                                    class = "row",
                                    htmlsourceindent = "3",
                                ) do
                                    [
                                        Genie.Renderer.Html.div(
                                            class = "col-12",
                                            htmlsourceindent = "4",
                                        ) do
                                            [
                                                Stipple.page(
                                                    model,
                                                    partial = true,
                                                    v__cloak = true,
                                                    [Stipple.Genie.Renderer.Html.@yield],
                                                    Stipple.@if(:isready)
                                                );
                                            ]
                                        end;
                                    ]
                                end;
                            ]
                        end
                        if isfile(
                            joinpath(
                                Stipple.Genie.config.server_document_root,
                                "js",
                                "genieapp.js",
                            ),
                        )


                            Genie.Renderer.Html.script(
                                htmlsourceindent = "2",
                                src = "/js/genieapp.js",
                            )

                        else


                        end
                        Genie.Renderer.Html.footer(
                            class = "_genie container",
                            htmlsourceindent = "2",
                        ) do
                            [
                                Genie.Renderer.Html.div(
                                    class = "row",
                                    htmlsourceindent = "3",
                                ) do
                                    [
                                        Genie.Renderer.Html.div(
                                            class = "col-12",
                                            htmlsourceindent = "4",
                                        ) do
                                            [
                                                Genie.Renderer.Html.p(
                                                    class = "text-muted credit",
                                                    style = "text-align:center;color:#8d99ae;",
                                                    htmlsourceindent = "5",
                                                ) do
                                                    [
                                                        """Built with
                                                                    """
                                                        Genie.Renderer.Html.a(
                                                            class = "_genie_logo",
                                                            href = "https://genieframework.com",
                                                            htmlsourceindent = "6",
                                                            target = "_blank",
                                                            ref = "nofollow",
                                                        ) do
                                                            [
                                                                """Genie""";
                                                            ]
                                                        end
                                                    ]
                                                end;
                                            ]
                                        end;
                                    ]
                                end;
                            ]
                        end
                        if isfile(
                            joinpath(
                                Stipple.Genie.config.server_document_root,
                                "css",
                                "theme.css",
                            ),
                        )


                            Genie.Renderer.Html.link(
                                htmlsourceindent = "2",
                                rel = "stylesheet",
                                href = "/css/theme.css",
                            )

                        else


                        end
                        if isfile(
                            joinpath(
                                Stipple.Genie.config.server_document_root,
                                "css",
                                "autogenerated.css",
                            ),
                        )


                            Genie.Renderer.Html.link(
                                htmlsourceindent = "2",
                                rel = "stylesheet",
                                href = "/css/autogenerated.css",
                            )

                        else


                        end
                    ]
                end
            ]
        end
    ]
end
