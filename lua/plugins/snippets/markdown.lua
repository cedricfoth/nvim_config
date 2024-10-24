return{
  s("header", {
    t({"---","date: "..vim.fn.strftime("%Y-%m-%d"), "tags: "}),
    i(1),
    t({"","hubs:","---"})
  }),
  s("weekly", {
    t({"### "..vim.fn.strftime("%Y-%m-%d"), "Fragen: "}),
    i(1),
    t({"#### Informationen/Notes:","", "#### Wichtige Punkte:","","#### Zusammenfassung:", ""})
  })
}
