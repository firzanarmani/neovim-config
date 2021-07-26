local OptionType = {
	GLOBAL = 'go',
	WINDOW = 'wo',
	BUFFER = 'bo'
}

local function set_options(scope, options)
	for option, value in pairs(options) do
		vim[scope][option] = value
	end
end

local function set_options_scoped(scope, options, number)
	for option, value in pairs(options) do
		vim[scope][number][option] = value
	end
end

set_go = function(options)
	set_options(OptionType.GLOBAL, options)
end

set_wo = function(options, winnr)
	set_options_scoped(OptionType.WINDOW, winnr, options)
end

set_bo = function(options, bufnr)
	set_options_scoped(OptionType.BUFFER, bufnr, options)
end

get_o = function(option)
	return vim['o'][option]
end