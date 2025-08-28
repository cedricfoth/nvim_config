function filename(_, snip)
    local name = vim.fn.expand("%:t:r")  -- Dateiname ohne Pfad/Endung
    return name
end

return {
    s("header", {
        t({ "---", "date: " .. vim.fn.strftime("%Y-%m-%d"), "tags: " }),
        i(1),
        t({ "", "hubs:", "---" }),
    }),
    s("weekly", {
        t({ "### " .. vim.fn.strftime("%Y-%m-%d"), "Fragen: " }),
        i(1),
        t({ "", "#### Informationen/Notes:", "", "#### Wichtige Punkte:", "", "#### Zusammenfassung:", "" }),
    }),
    s("check", {
        t({ "&check;" }),
    }),
    s("task", {
        t({ "- [ ] " }),       -- erste Zeile: Checkbox
        i(1, "Beschreibung"),  -- Taskbeschreibung
        t({ "", "  tags: #" }), -- zweite Zeile: Tags
        f(filename, {}),       -- automatischer Dateiname als Tag
        t({"_"}),
        i(2, "custom"),
        t({ "", "  due: " }),  -- dritte Zeile: Due-Date
        i(3, "YYYY-MM-DD"),
    }),
}
