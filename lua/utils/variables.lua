local VariableType = {
	GLOBAL = 'g',
	WINDOW = 'w',
	BUFFER = 'b',
    TABPAGE = 't',
    VIM = 'v'
}

local function set_variables(scope, variables)
    for variable, value in pairs(variables) do
        vim[scope][variable] = value
    end
end

local function get_variables(scope, variable)
    return vim[scope][variable]
end

set_gvar = function(variables)
    set_variables(VariableType.GLOBAL, variables)
end

set_wvar = function(variables)
    set_variables(VariableType.WINDOW, variables)
end

set_bvar = function(variables)
    set_variables(VariableType.BUFFER, variables)
end

set_gvar = function(variables)
    set_variables(VariableType.GLOBAL, variables)
end

get_gvar = function(variable)
    return get_variables(VariableType.GLOBAL, variable)
end