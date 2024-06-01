return {
  "itchyny/calendar.vim",
  keys = {
    { "<leader>cm", "<cmd>Calendar -first_day=monday<cr>", desc = "Calendar: Monthly view" },
    { "<leader>ct", "<cmd>Calendar -view=clock<cr>", desc = "Calendar: Current time" },
    { "<leader>cy", "<cmd>Calendar -view=year<cr>", desc = "Calendar: Yearly view as a tab" },
    {
      "<leader>cv",
      "<cmd>Calendar -view=year -split=vertical -width=27<cr>",
      desc = "Calendar: Yearly view as a split",
    },
    {
      "<leader>ch",
      "<cmd>Calendar -view=year -split=horizontal -position=below -height=12<cr>",
      desc = "Calendar: Yearly view as a split",
    },
  },
}
