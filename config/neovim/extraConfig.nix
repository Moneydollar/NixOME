''
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
      require("nvim-tree.api").tree.open()
    end
  end
})

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
 
vim.opt.shell = vim.fn.executable("fish") == 1 and "fish" or vim.opt.shell:get()


local lspconfig = require("lspconfig")

lspconfig.nil_ls.setup {
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixpkgs-fmt" }, -- or "alejandra" / "nixfmt"
      },
      nix = {
        maxMemoryMB = 12560,
        flake = {
          autoEvalInputs = true,
          nixpkgsInputName = nixpkgs,
        },
      },
    },
  },
}


local lspconfig = require("lspconfig")
-- Python
lspconfig.pyright.setup({})

-- C/C++
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
})
''
