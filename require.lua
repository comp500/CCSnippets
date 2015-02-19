-- require() for CC by comp500
-- MIT license - https://github.com/comp500/CCSnippets/
function require(...)
    if select("#", ...) < 1 then
        return
    end
    local traverse = function (travDir, name)
        local file = travDir .. name
        while (not fs.exists(file)) and travDir ~= "" do
            travDir = fs.getDir(travDir)
            file = travDir .. name
        end
        return file
    end
    local apis = {}
    for i=1,select("#", ...) do
        local reqloc = select(i, ...)
        local traversedir = false
        if string.sub(reqloc, 1, 1) ~= "/" then
            traversedir = true
            reqloc = fs.combine(fs.getDir(shell.getRunningProgram()), reqloc)
        end
        if fs.isDir(reqloc) then
            return
        end
        local file = nil
        local name = fs.getName(reqloc)
        if traversedir then
            file = traverse(fs.getDir(reqloc), name)
            if not fs.exists(file) then
	            if shell.resolveProgram(file) ~= nil and fs.exists(shell.resolveProgram(file)) then
	                file = shell.resolveProgram(file)
	            end
		    end
        else
            file = reqloc
        end
        if fs.exists(file) then
            os.loadAPI(file)
            local api = _G[name]
            _G[name] = nil
            table.insert(apis, api)
        else
            table.insert(apis, {})
            error("Required API " .. name .. " not found!")
        end
    end
    return unpack(apis)
end
