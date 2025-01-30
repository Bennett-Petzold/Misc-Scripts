-- https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("rust", {
	-- Rust CFG environment
	s("#[cfg(test)]", {
		t({ "#[cfg(test)]", "mod tests {", "\tuse super::*;", "", "\t" }),
		i(1),
		t({ "", "}" })
	}),
	s("fread", {
		t("read_to_string("),
		i(1, "filename"),
		t({ ").unwrap()", "\t.lines()", "\t.map(|" }),
		i(2, "param"),
		t("| "),
		i(3),
		t({ ")", "\t.collect()" })
	}),
	s("bfread", {
		t("BufReader::new(File::open("),
		i(1, "filename"),
		t({ ").unwrap())", "\t.lines()", "\t.map(|" }),
		i(2, "param"),
		t("| "),
		i(3),
		t({ ")", "\t.collect()" })
	}),
	s("pattern", {
		t("static "),
		i(1, "NAME"),
		t(": LazyLock<Regex> = LazyLock::new(|| Regex::new(r#\""),
		i(2, "regexp"),
		t("\"#).unwrap());")
	}),
	s("fnit", {
		t("fn "),
		i(1, "name"),
		t("<I>("),
		i(2, "arg"),
		t(": I) -> "),
		i(3, "RetType"),
		t({ "", "where", "\tI: IntoIterator<Item = " }),
		i(4, "ItType"),
		t({ ">,", "{", "\t" }),
		i(5, "unimplemented!();"),
		t({ "", "}" })
	}),
	s("fnite", {
		t("fn "),
		i(1, "name"),
		t("<I, T>("),
		i(2, "arg"),
		t(": I) -> "),
		i(3, "RetType"),
		t({ "", "where", "\tI: IntoIterator<Item = T>,", "\tT: " }),
		i(4, "ItType"),
		t({ ",", "{", "\t" }),
		i(5, "unimplemented!();"),
		t({ "", "}" })
	}),
	s("fromi", {
		t("impl<I> From<I> for "),
		i(1, "StructType"),
		t({ "", "where", "\tI: IntoIterator<Item = " }),
		i(2, "ItType"),
		t({ ">,", "{", "\tfn from(value: I) -> Self {", "\t\t" }),
		i(3, "unimplemented!();"),
		t({ "", "\t}", "}" })
	}),
	s("fromie", {
		t("impl<I, T> From<I, T> for "),
		i(1, "StructType"),
		t({ "", "where", "\tI: IntoIterator<Item = T>,", "\tT: " }),
		i(2, "ItType"),
		t({ ",", "{", "\tfn from(value: I) -> Self {", "\t\t" }),
		i(3, "unimplemented!();"),
		t({ "", "\t}", "}" })
	}),
	--[[
	s("#[test]", {
		t({"#[test]", "fn "}),
		i(1),
		t({"() {", "\t"}),
		i(2),
		t({"", "}"})
	}),
	--]]
	--[[
	s("struct", {
		t("struct "),
		i(1, "Name"),
		t({" {", "\t"}),
		i(2),
		t({"", "}"})
	}),
	--]]
})
