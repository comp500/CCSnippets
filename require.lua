-- require() for CC by comp500
-- MIT license - https://github.com/comp500/CCSnippets/
function require(...)
    if select("#", ...) < 1 then
        return
    end
    local traverse = function (travDir, name)
        local file = travDir .. name
        while (not fs.exists(file)) or travDir ~= "" do
            travDir = fs.getDir(travDir)
            file = travDir .. name
        end
        return file
    end
    local apis = {}
    for i=0,select("#", ...) do
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
        else
            file = reqloc
        end
        os.loadAPI(file)
        local api = _G[name]
        _G[name] = nil
        table.insert(apis, api)
    end
    return unpack(apis)
end
