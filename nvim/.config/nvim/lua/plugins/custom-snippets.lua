local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set({ "i", "s" }, "<A-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
return {

	ls.add_snippets("vue", {
		s("hello", {
			t('print("Ahoj mirko")'),
		}),
		-- Link CSS
		s("linkcss", {
			t('<link rel="stylesheet" href="${1:path/to/style.css}">'),
		}),
		-- Script tag
		s("script", {
			t('<script src="'),
			i(1),
			t('"></script>'),
		}),
		--div
		s("div", {
			t("<div>"),
			i(1),
			t("</div>"),
		}),
		--span
		s("span", {
			t("<span>"),
			i(1),
			t("</span>"),
		}),
		-- Heading
		s("h1", {
			t("<h1>"),
			i(1),
			t("</h1>"),
		}),
		s("h2", {
			t("<h2>"),
			i(1),
			t("</h2>"),
		}),
		s("h3", {
			t("<h3>"),
			i(1),
			t("</h3>"),
		}),
		-- Paragraph
		s("p", {
			t("<p>"),
			i(1),
			t("</p>"),
		}),
		-- Anchor
		s("a", {
			t('<a href="'),
			i(1),
			t('">'),
			i(2),
			t("</a>"),
		}),
		--html inline stuff
		s("cl", {
			t('class="'),
			i(1),
			t('"'),
		}),
		s("i", {
			t('id="'),
			i(1),
			t('"'),
		}),
		s("al", {
			t('alt="'),
			i(1),
			t('"'),
		}),
		s("st", {
			t('style="'),
			i(1),
			t('"'),
		}),
	}),
}
