local function language_to_us()
	local cs = vim.bo.commentstring
	if cs == "" then
		return "LTeX: language=en-US"
	end
	return string.format(cs, "LTeX: language=en-US")
end

return {
	s("ctrig", t("also loaded!!")),
	s("autotrig", t("autotriggered, if enabled")),
	s("spellen", {
		f(language_to_us),
	}),
	s("autotrig", {
		t("autotriggered, if enabled"),
		i(1),
		t("Funktionier?"),
	}),
}
