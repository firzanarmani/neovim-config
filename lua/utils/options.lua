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
	winnr = winnr or 0
	set_options_scoped(OptionType.WINDOW, options, winnr)
end

set_bo = function(options, bufnr)
	bufnr = bufnr or 0
	set_options_scoped(OptionType.BUFFER, options, bufnr)
end

get_o = function(option)
	return vim['o'][option]
end
