return{
  s("header", {
    t({"---","date: "..vim.fn.strftime("%Y-%m-%d"), "tags: "}),
    i(1),
    t({"","hubs:","---"})
  })
}
