require('nvim-treesitter.configs').setup {
  ensure_installed = {
	"bash", 
	"go", 
	"html", 
	"javascript",
	"json",
	"lua",
},
  highlight = {
    enable = true, -- false will disable the whole extension
  },
}

