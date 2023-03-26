-- load snippets from path/of/your/nvim/config/my-cool-snippets
-- require'luasnip'.filetype_extend("javascript", {"react-ts","react","react-es","next","next-ts","react-native","react-native-ts"})
require("luasnip").filetype_extend("javascript",{"javascriptreact", "typescript"})
require("luasnip").filetype_extend("typescript",{"javascriptreact", "javascript"})
require("luasnip").filetype_extend("cpp",{"c"})
require("luasnip").filetype_extend("c",{"cpp"})
require("luasnip.loaders.from_vscode").lazy_load()
